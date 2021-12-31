using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace coreWeb_MVC.Controllers
{
    public class DefulController : Controller
    {
        // GET: DefulController
        public ActionResult Index()
        {
            return View();
        }

        // GET: DefulController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: DefulController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: DefulController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: DefulController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: DefulController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: DefulController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: DefulController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
