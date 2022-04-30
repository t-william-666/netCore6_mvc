using coreWeb_MVC.Models;
using Microsoft.AspNetCore.Mvc;

namespace coreWeb_MVC.Controllers
{
    public class BackstageController : Controller
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        private readonly TestDBContext _context;
        public BackstageController(TestDBContext dBContext)
        {
            _context = dBContext;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Home()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]//令牌
        public IActionResult Login(string UserID, string password)
        {
            var user = _context.Users.Where(p => p.UserID == UserID && p.Password == password);
            return View();
        }
        public IActionResult Error()
        {
            return View();
        }
    }
}
