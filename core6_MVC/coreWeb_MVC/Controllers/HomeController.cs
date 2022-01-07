using coreWeb_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

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

        public IActionResult Login()
        {
            IEnumerable<Shop> shops=_dbContext.Shops.ToList();
            return View(shops);
        }

        public IActionResult Register()
        {
            ViewData["user"] = "";
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

       
    }
}