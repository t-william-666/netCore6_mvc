using coreWeb_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Web;
namespace coreWeb_MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly TestDBContext _dbContext;
        //构造函数==》依赖注入
        public HomeController(ILogger<HomeController> logger, TestDBContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
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
                ViewData["userInfo"] = user;
                ViewBag.userInfo = user;
            }

            return View();
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
        [HttpPost]
        public IActionResult Logining(string userID, string password)
        {
            var user = _dbContext.Users.Where(p => p.UserID == userID && p.Password == password).FirstOrDefault();
            var users = _dbContext.Users.Where(p => p.UserID == userID && p.Password == password).Count();
            if (users > 0)
            {
                //保存登录用户数据对象(会话)
                HttpContext.Session.SetString("userInfo", userID);
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