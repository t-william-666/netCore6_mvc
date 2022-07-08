using coreWeb_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using coreWeb_MVC.Models.Other;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace coreWeb_MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly TestDBContext _dbContext;

        //session会话
        private readonly IHttpContextAccessor _httpContextAccessor;
        private ISession _session => _httpContextAccessor.HttpContext.Session;
        //构造函数==》依赖注入
        public HomeController(ILogger<HomeController> logger, TestDBContext dbContext, IHttpContextAccessor httpContextAccessor)
        {
            _logger = logger;
            _dbContext = dbContext;
            _httpContextAccessor = httpContextAccessor;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult LocalRed(string geturl)
        {
            return LocalRedirect("");
        }

        /// <summary>
        /// 登录
        /// </summary>
        /// <returns></returns>
        public IActionResult Login()
        {
            return View();
        }
        /// <summary>
        /// 登录验证并跳转页面
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        //ASP.NET Core 包含三个用于处理【防伪造令牌】的筛选器：
        //ValidateAntiForgeryToken  操作筛选器可应用于单个操作、控制器或全局操作。除非请求包含有效的防伪造令牌，否则对已应用此筛选器的操作的请求将被阻止：
        //AutoValidateAntiforgeryToken  导致为所有不安全的 HTTP 方法验证防伪标记的特性。作为全局筛选器 说人话就是放在控制器前面的位置，作为全局令牌。
        //IgnoreAntiforgeryToken  给定操作（或控制器）无需防伪造令牌。说人话就是 禁用令牌，加了IgnoreAntiforgeryToken就不需要验证令牌
        [HttpPost]
        [ValidateAntiForgeryToken]//令牌
        public IActionResult Logining(string account, string password)
        {
            var user = _dbContext.Users.Where(p => p.Account == account && p.Password == password && p.UserState > 0).FirstOrDefault();
#pragma warning disable CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
            User users = _dbContext.Users.Where(p => p.Account == account).FirstOrDefault();
#pragma warning restore CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。

            var storePassword = users.Password;//获取数据库的加密密码
            var result = PasswordHasher.VerifyHashedPassword(password, storePassword);
            if (result)
            {
                //保存登录用户数据对象(会话)
                HttpContext.Session.SetString("userInfo", users.UserID);
                TempData["userID"] = user.UserID;
                _session.SetString("user", users.UserID);
                //重新定向
                return RedirectToAction("Home");
            }
            else
            {
                return Content("sorry");
            }

        }
        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        public IActionResult Loginout()
        {
            HttpContext.Session.SetString("userInfo", "");
            return RedirectToAction("Home");
        }
        /// <summary>
        /// 注册
        /// </summary>
        /// <returns></returns>
        public IActionResult Register()
        {
            ViewData["user"] = "";
            return View();
        }

        /// <summary>
        /// 注册验证并跳转页面
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <param name="passwordTrue"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken] //令牌
        public IActionResult Register(string account, string password, string passwordTrue)
        {
            if (account == "" || account == null || password == "" || password == null || passwordTrue == "" || passwordTrue == null)
            {
                return Content("数据不能为空！");
            }
            else
            {
                var findUser = _dbContext.Users.Where(p => p.Account == account);
                //Any()大概意思就是如果有数据则返回true ，否则返回false。
                if (findUser.Any())
                {
                    return Content("sorry");
                }
                //加密密码
                password = PasswordHasher.HashPassword(password);
                User user = new User()
                {
                    UserID = CreatecodeNumber.CreateUserID(),//生成用户编号
                    Account = account,
                    Password = password,
                    UserName = "新用户",
                    Sex = "3",
                };
                _dbContext.Add(user);
                //_dbContext.Users.Add(user);
                //_dbContext.Set<User>().Add(user);
                _dbContext.SaveChanges();
                //保存注册用户数据对象(会话)
                HttpContext.Session.SetString("userInfo", account);
                TempData["userID"] = user.UserID;

                return RedirectToAction("Home");
            }
        }

        /// <summary>
        /// 主页
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Home()
        {
            //右侧菜单栏
            TempData["headMenu"] = await _dbContext.TitleLists.Where(p => p.about == "header-tab").OrderBy(p => p.TitleOrderby).ToListAsync();
            ViewBag.headerMenu = TempData["headMenu"];
            //用户二级菜单栏 使用TempData跨页面传递数据（因为搜索页面也用到）
            TempData["userMenu"] = await _dbContext.TitleLists.Where(p => p.about == "user-menu").OrderBy(p => p.TitleOrderby).ToListAsync();
            ViewBag.userMenu = TempData["userMenu"];
            //广告轮播图获取
            ViewBag.Banner = await _dbContext.BannerImages.Where(p => p.State == 1).ToListAsync();
            //菜单导航栏-菜单导航条 使用TempData跨页面传递数据（因为搜索页面也用到）
            TempData["Menulist"] = await _dbContext.TitleLists.Where(p => p.State == 1 && p.about == "menu").OrderBy(p => p.TitleOrderby).ToListAsync();
            ViewBag.Menulist = TempData["Menulist"];
            //获取商品信息商品图片商品评分 Skip 跳过多少条数据 Take输出多少条数据
            ViewBag.Productlist = await _dbContext.SuperProductViews.Take(12).ToListAsync();
            #region 使用Join连接
            //ViewBag.Productlist = _dbContext.Products.Join(_dbContext.TitleLists, p => p.ProductState, t => t.Title, (p, t) => new SuperProductView
            //{
            //    ShopID = p.ShopID,
            //    ProductID = p.ProductID,
            //}).ToList();

            //ViewBag.a = _dbContext.Shops.Include(p => p.Products).ToList();
            //ViewBag.Productlist = from p in _dbContext.Set<Product>()
            //                      join g in _dbContext.Set<ProductImage>()
            //                      on p.ProductID equals g.ProductID
            //                      join t in _dbContext.Set<TitleList>()
            //                          on p.ProductStarNum equals t.Title
            //                      where p.ProductType == 101 && g.ImgType == "1"
            //                      select new { p, g, t };
            //select new { ProductName = p.ProductName,ProductIntroduce=p.ProductIntroduce };
            #endregion

#pragma warning disable CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
            string uID = HttpContext.Session.GetString("userInfo");
#pragma warning restore CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
            ViewBag.user = _session.GetString("user");
            if (!string.IsNullOrWhiteSpace(uID))
            {
                //获取用户全部信息及头像
                var user = _dbContext.Users.Include(p => p.UserImageLists.Where(p => p.ImgState == 1)).Where(p => p.UserID == uID).FirstOrDefault();
                //var user = _dbContext.Users.Find(uID);
                ViewData["ss"] = user;
                ViewBag.userInfo = user;
            }

            return View();
        }

        /// <summary>
        /// 用户个人中心
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Usercenter()
        {
#pragma warning disable CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
            string uID = HttpContext.Session.GetString("userInfo");
#pragma warning restore CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
            if (string.IsNullOrWhiteSpace(uID))
            {
                return View();
            }
            //选项卡切换
            ViewBag.userMenu = await _dbContext.TitleLists.Where(p => p.about == "user-tab").OrderBy(p => p.TitleOrderby).ToListAsync();
            //我的订单
            ViewBag.userOrder = await _dbContext.ProductOrders.Include(p => p.ProductOrderDetails).Where(p => p.UserID == uID).ToListAsync();
            //我的收藏
            ViewBag.userHeart = await _dbContext.SupUserLikeProductViews.Where(p => p.UserID == uID && p.LikeType == 1).ToListAsync();
            //修改个人信息
            ViewBag.userIntroduce = await _dbContext.Users.Include(o => o.UserImageLists.Where(p => p.ImgState == 1)).Where(p => p.UserID == uID).ToListAsync();
            //收货地址管理
            ViewBag.userAddress = await _dbContext.UserAddresses.Where(p => p.UserID == uID && p.State == 1).ToListAsync();
            //商品物流查询
            ViewBag.userLogistics = "";
            //商品评价管理
            ViewBag.userProductComment = await _dbContext.ProductOrderDetails.Where(p => p.UserID == uID).ToListAsync();
            return View();
        }

        /// <summary>
        /// 搜索商品页面
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Searchshopproduct()
        {
            ////使用第二种TempData[""]更好，数据共享不需要频繁请求数据库
            //ViewBag.Menulist = _dbContext.TitleLists.Where(p => p.State == 1 && p.about == "导航栏").OrderBy(p => p.TitleOrderby).ToList();
            ViewBag.Menulist = TempData["Menulist"];
            //商品排序
            ViewBag.Productsort = await _dbContext.TitleLists.Where(p => p.about == "order-by").OrderBy(p => p.TitleOrderby).ToListAsync();
            //商品详细信息
            ViewBag.productlist = await _dbContext.SuperProductViews.Take(12).ToListAsync();
            return View();
        }
        /// <summary>
        /// 商品详情页面
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Productdetail(string id)
        {
            string prodtctID = id;
            if (string.IsNullOrWhiteSpace(prodtctID))
            {
                prodtctID = "wx-10002";
            }
            //商品信息详情
            ViewBag.Productdetail = await _dbContext.Products.Include(p => p.Shop).Where(p => p.ProductID == prodtctID).FirstOrDefaultAsync();
            decimal starnum = ViewBag.Productdetail.ProductStarNum;
            //商品详情星级评分
            ViewBag.Productstars = await _dbContext.ShopProductStarRatings.Where(p => p.StarNum == starnum).ToListAsync();
            //商品详情图片
            ViewBag.ProductImg = await _dbContext.ProductImages.Where(p => p.ProductID == prodtctID).ToListAsync();

            //商品描述
            ViewBag.ProductDesc = await _dbContext.ProductImages.Where(p => p.ProductID == prodtctID).ToListAsync();
            //用户评论
            ViewBag.ProductComment = await _dbContext.SupUserCommentViews.Where(p => p.ProductID == prodtctID).OrderBy(p => p.AddDate).ToListAsync();
            //物流政策
            ViewBag.Productagreement = await _dbContext.TitleLists.Where(p => p.about == "agreement").OrderBy(p => p.TitleOrderby).ToListAsync();

            //热门推荐商品
            ViewBag.ProductHot = await _dbContext.SuperProductViews.OrderBy(p => p.ProductNum).Take(6).ToListAsync();

            return View();
        }

        /// <summary>
        /// 商家详情页面
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Shopdetail(string id)
        {
            string shopID = id;
            if (string.IsNullOrWhiteSpace(shopID))
            {
                shopID = "SD-2022042115";
            }
            //商店详情信息
            ViewBag.ShopDetail = await _dbContext.Shops.Where(p => p.ShopID == shopID).FirstOrDefaultAsync();
            //商店详细信息图片
            ViewBag.ShopImg = await _dbContext.ShopImages.Where(p => p.ShopID == shopID).ToListAsync();

            //商品排序
            ViewBag.Productsort = await _dbContext.TitleLists.Where(p => p.about == "order-by").OrderBy(p => p.TitleOrderby).ToListAsync();

            //商店商品详细信息--使用强类型
            var shopProductList = await _dbContext.SuperProductViews.Where(p => p.ShopID == shopID).ToListAsync();//方法一
            //IEnumerable<SuperProductView> shopProductList=await _dbContext.SuperProductViews.Where(p=>p.ShopID == shopID).ToListAsync();//方法二
            return View(shopProductList);
        }

        /// <summary>
        /// 购物车页面
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Cart()
        {
#pragma warning disable CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
            string userID = HttpContext.Session.GetString("userInfo");
#pragma warning restore CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
            if (!string.IsNullOrWhiteSpace(userID))
            {
                IEnumerable<SupUserProductCartView> CartDetail = await _dbContext.SupUserProductCartViews.Where(p => p.UserID == userID).ToListAsync();
                return View(CartDetail);
            }
            else
            {
                return View();
            }

        }

        /// <summary>
        /// 报错
        /// </summary>
        /// <returns></returns>
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }


    }
}