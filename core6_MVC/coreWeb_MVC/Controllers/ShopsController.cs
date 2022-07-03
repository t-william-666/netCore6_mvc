﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using coreWeb_MVC.Models;

namespace coreWeb_MVC.Controllers
{
    /// <summary>
    /// 商店Api接口
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class ShopsController : ControllerBase
    {
        private readonly TestDBContext _context;

        public ShopsController(TestDBContext context)
        {
            _context = context;
        }

        /// <summary>
        /// 查询所有商店
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Shop>>> GetShops()
        {
            if (_context.Shops == null)
            {
                return NotFound();
            }
            return await _context.Shops.ToListAsync();
        }

        /// <summary>
        /// 根据商店id查询商店
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<ActionResult<Shop>> GetShop(string id)
        {
            if (_context.Shops == null)
            {
                return NotFound();
            }
            //方法一
            var shop = await _context.Shops.FindAsync(id);
            //方法二
            var shop2 = await _context.Shops.Where(p => p.ShopID == id).FirstOrDefaultAsync();
            if (shop == null)
            {
                return NotFound();
            }
            if (shop2 == null)
            {
                return NotFound();
            }

            return shop2;
        }

        /// <summary>
        /// 根据商店id修改商店
        /// </summary>
        /// <param name="id"></param>
        /// <param name="shop"></param>
        /// <returns></returns>
        [HttpPut("{id}")]
        public async Task<IActionResult> PutShop(string id, Shop shop)
        {
            if (id != shop.ShopID)
            {
                return BadRequest();
            }

            _context.Entry(shop).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ShopExists(id))
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
        /// 添加商店
        /// </summary>
        /// <param name="shop"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult<Shop>> PostShop(Shop shop)
        {
            if (_context.Shops == null)
            {
                return Problem("Entity set 'TestDBContext.Shops'  is null.");
            }
            _context.Shops.Add(shop);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ShopExists(shop.ShopID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetShop", new { id = shop.ShopID }, shop);
        }

        /// <summary>
        /// 根据商店id删除商店
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteShop(string id)
        {
            if (_context.Shops == null)
            {
                return NotFound();
            }
            var shop = await _context.Shops.FindAsync(id);
            if (shop == null)
            {
                return NotFound();
            }

            _context.Shops.Remove(shop);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ShopExists(string id)
        {
            return (_context.Shops?.Any(e => e.ShopID == id)).GetValueOrDefault();
        }
    }
}