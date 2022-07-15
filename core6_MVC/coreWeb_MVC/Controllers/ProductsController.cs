using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using coreWeb_MVC.Models;
using coreWeb_MVC.Models.OtherModel;

namespace coreWeb_MVC.Controllers
{
    /// <summary>
    /// 商品Api接口
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly TestDBContext _context;

        public ProductsController(TestDBContext context)
        {
            _context = context;
        }

        /// <summary>
        /// 查询所有商品
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SuperProductView>>> GetProducts()
        {
            if (_context.Products == null)
            {
                return NotFound();
            }
            return await _context.SuperProductViews.ToListAsync();
        }

        /// <summary>
        /// 根据商品id查询商品
        /// </summary>
        /// <param name="id">商品ID</param>
        /// <returns></returns>
        [HttpGet("GetProduct")]
        public async Task<ActionResult<SuperProductView>> GetProduct(string id)
        {
            var userID = HttpContext.Session.GetString("userInfo");
            if (string.IsNullOrWhiteSpace(id))
            {
                return NotFound("商品ID为空");
            }
            if (!string.IsNullOrWhiteSpace(userID))
            {
                UserLookProduct lookProduct = new UserLookProduct()//添加用户浏览记录
                {
                    UserID = userID,
                    PoductID = id,
                    ShopID = "",
                    AddDate = DateTime.Now
                };
                await _context.UserLookProducts.AddAsync(lookProduct);
                await _context.SaveChangesAsync();
            }
            var product = await _context.SuperProductViews.Where(p => p.ProductID == id).FirstOrDefaultAsync();
            if (product == null)
            {
                return NotFound("找不到该商品");
            }
            return product;
        }

        /// <summary>
        /// 根据商品类型查询商品
        /// </summary>
        /// <param name="producttype">商品类型</param>
        /// <returns></returns>
        [HttpGet("GetProductTypeList")]
        public async Task<IActionResult> GetProductTypeList(string producttype = "")
        {
            if (string.IsNullOrWhiteSpace(producttype))
            {
                return NotFound("商品类型为空");
            }
            var product = await _context.SuperProductViews.Where(p => p.ProductType == int.Parse(producttype)).ToListAsync();
            ApiModel apiModel = new ApiModel()
            {
                status = 1,
                data = product,
                msg = "搜索商品成功"
            };
            return Ok(apiModel);
        }

        /// <summary>
        /// 根据商品名称模糊查询商品
        /// </summary>
        /// <param name="productname">商品名称</param>
        /// <returns></returns>
        [HttpGet("GetProductNameList")]
        public async Task<IActionResult> GetProductNameList(string productname)
        {
            var userID = HttpContext.Session.GetString("userInfo");
            if (string.IsNullOrWhiteSpace(productname))
            {
                return NotFound("搜索条件为空");
            }
            if (!string.IsNullOrWhiteSpace(userID))//添加用户查询记录
            {
                UserSearch userSearch = new UserSearch()
                {
                    UserID = userID,
                    SearchName = productname,
                    AddDate = DateTime.Now
                };
                await _context.UserSearches.AddAsync(userSearch);
                await _context.SaveChangesAsync();
            }
            var productList = await _context.SuperProductViews.Where(p => p.ProductName.Contains(productname) || p.ProductDesc.Contains(productname)).ToListAsync();

            ApiModel apiModel = new ApiModel()
            {
                status = 1,
                data = productList,
                msg = "搜索商品成功"
            };
            return Ok(apiModel);
        }

        /// <summary>
        /// 添加商品
        /// </summary>
        /// <param name="product">商品实体类</param>
        /// <param name="formFiles">图片列表</param>
        /// <returns></returns>
        [HttpPost("InsertProduct")]
        public async Task<ActionResult<Product>> InsertProduct(Product product, List<IFormFile> formFiles)
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'TestDBContext.Products'  is null.");
            }
            _context.Products.Add(product);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ProductExists(product.ProductID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetProduct", new { id = product.ProductID }, product);
        }

        /// <summary>
        /// 根据商品id修改商品
        /// </summary>
        /// <param name="id">商品id</param>
        /// <param name="product">商品实体类</param>
        /// <param name="formFiles">图片列表</param>
        /// <returns></returns>
        [HttpPut("UpdateProduct")]
        public async Task<IActionResult> UpdateProduct(string id, Product product, List<IFormFile> formFiles)
        {
            if (id != product.ProductID)
            {
                return BadRequest();
            }

            _context.Entry(product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        /// <summary>
        /// 根据商品id删除商品
        /// </summary>
        /// <param name="id">商品ID</param>
        /// <returns></returns>
        [HttpDelete("DeleteProduct")]
        public async Task<IActionResult> DeleteProduct(string id)
        {
            if (_context.Products == null)
            {
                return NotFound();
            }
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ProductExists(string id)
        {
            return (_context.Products?.Any(e => e.ProductID == id)).GetValueOrDefault();
        }
    }
}
