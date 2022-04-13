using coreWeb_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Web;
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
        /// <summary>
        /// 主页
        /// </summary>
        /// <returns></returns>
        public IActionResult Home()
        {
            if (HttpContext.Session.GetString("userInfo") != null)
            {
#pragma warning disable CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
                string uID = HttpContext.Session.GetString("userInfo");
#pragma warning restore CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
                var user = _dbContext.Users.Where(p => p.UserID == uID).FirstOrDefault();
                //var user = _dbContext.Users.Find(uID);
                ViewData["ss"] = user;
                ViewBag.userInfo = user;
            }
            ViewBag.user = _session.GetString("user");
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
            //IEnumerable<Shop> shops=_dbContext.Shops.ToList();
            //return View(shops);
            return View();
        }
        /// <summary>
        /// 登录验证并跳转页面
        /// </summary>
        /// <param name="userID"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        //ASP.NET Core 包含三个用于处理【防伪造令牌】的筛选器：
        //ValidateAntiForgeryToken  操作筛选器可应用于单个操作、控制器或全局操作。除非请求包含有效的防伪造令牌，否则对已应用此筛选器的操作的请求将被阻止：
        //AutoValidateAntiforgeryToken  导致为所有不安全的 HTTP 方法验证防伪标记的特性。作为全局筛选器 说人话就是放在控制器前面的位置，作为全局令牌。
        //IgnoreAntiforgeryToken  给定操作（或控制器）无需防伪造令牌。说人话就是 禁用令牌，加了IgnoreAntiforgeryToken就不需要验证令牌
        [HttpPost]
        [ValidateAntiForgeryToken]//令牌
        public IActionResult Logining(string userID, string password)
        {
            var user = _dbContext.Users.Where(p => p.UserID == userID && p.Password == password).FirstOrDefault();
            var users = _dbContext.Users.Where(p => p.UserID == userID && p.Password == password).Count();
            if (users > 0)
            {
                //保存登录用户数据对象(会话)
                HttpContext.Session.SetString("userInfo", userID);
                _session.SetString("user", userID);
                //重新定向
                return RedirectToAction("Home");
            }
            else
            {
                return Content("sorry");
            }

        }
        public IActionResult Log()
        {
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
        /// <param name="userID"></param>
        /// <param name="password"></param>
        /// <param name="passwordTure"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Register(string userID, string password, string passwordTrue)
        {
            if (userID == "" || userID == null || password == "" || password == null || passwordTrue == "" || passwordTrue == null)
            {
                return Content("数据不能为空！");
            }
            else
            {
                var findUser = _dbContext.Users.Where(p => p.UserID == userID);
                //Any()大概意思就是如果有数据则返回true ，否则返回false。
                if (findUser.Any())
                {
                    return Content("sorry");
                }
                User user = new User()
                {
                    UserID = userID,
                    Password = password,
                    UserName="新用户",
                    Sex = "3",
                };
                _dbContext.Add(user);
                //_dbContext.Users.Add(user);
                //_dbContext.Set<User>().Add(user);
                _dbContext.SaveChanges();
                //保存注册用户数据对象(会话)
                HttpContext.Session.SetString("userInfo", userID);

                return RedirectToAction("Home");
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