using coreWeb_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.AspNetCore;
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
        [HttpPost]
        public IActionResult Logining(string userID,string password)
        {
            using (TestDBContext db=new TestDBContext())
            {
                var user = db.Users.Where(p => p.UserID == userID && p.Password == password);
                if (user == null)
                {
                    //ISession["userInfo"] = user;
                    return RedirectToAction("Home");
                }
                else
                {
                    return Content("密码错误或者账号不存在");
                }
            }
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