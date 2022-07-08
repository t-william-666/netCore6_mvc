using coreWeb_MVC.Models;
using coreWeb_MVC.Models.Other;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace coreWeb_MVC.Controllers
{
    /// <summary>
    /// 用户中心api接口
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class UsercenterController : ControllerBase
    {
        private readonly TestDBContext _dbContext;
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="dbContext"></param>
        public UsercenterController(TestDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        #region===>>>用户中心的我的收藏
        /// <summary>
        /// 查询用户我的收藏
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        [HttpGet("userID")]
        public async Task<IActionResult> GetUserlike(string userID = "")
        {
            if (string.IsNullOrWhiteSpace(userID))
            {
                return NotFound();
            }
            return (IActionResult)await _dbContext.SupUserLikeProductViews.Where(p => p.UserID == userID && p.LikeType == 1).ToListAsync();
        }
        /// <summary>
        /// 删除用户我的收藏
        /// </summary>
        /// <param name="likeID"></param>
        /// <returns></returns>
        [HttpDelete("likeID")]
        public async Task<IActionResult> DeleteUserlike(string likeID)
        {
            if (_dbContext.UserLikes == null || string.IsNullOrWhiteSpace(likeID))
            {
                return NotFound();
            }
            var userLike = await _dbContext.UserLikes.Where(p => p.LikeID == int.Parse(likeID)).FirstOrDefaultAsync();
            if (userLike == null)
            {
                return NotFound();
            }
            _dbContext.Remove(userLike);
            await _dbContext.SaveChangesAsync();
            return Ok();
        }
        #endregion

        #region===>>>用户中心的我的订单
        /// <summary>
        /// 查询用户订单
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        [HttpGet("userID")]
        public async Task<IActionResult> GetUserOrder(string userID = "")
        {
            if (string.IsNullOrWhiteSpace(userID))
            {
                return NotFound();
            }
            var userOrder = await _dbContext.ProductOrders.Include(p => p.ProductOrderDetails).Where(p => p.UserID == userID).ToListAsync();
            return Ok(userOrder);
        }
        /// <summary>
        /// 添加用户订单
        /// </summary>
        /// <param name="CartID">购物车编号list</param>
        /// <param name="amountprice">总价格</param>
        /// <param name="discountprice">优惠价</param>
        /// <param name="paytype">付款类型</param>
        /// <param name="addressID"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> InsertUserPrder(string CartID, string amountprice, string discountprice, string paytype, string addressID)
        {
            //FromSqlRaw 或 ExecuteSqlRaw 执行sql语句
            //通过 FromSqlInterpolated 和 ExecuteSqlInterpolated 方法，可采用一种能抵御 SQL 注入攻击的方式使用字符串内插语法。
            //CancellationToken token =CancellationToken.None;
            //FormattableString sql = $"select * from Product where ProdictID in ({productID})";
            //var addOrder = await _dbContext.Database.ExecuteSqlInterpolatedAsync(sql, token);
            //var addOrder2 = _dbContext.Products.FromSqlInterpolated($"select * from Product where ProdictID in ({productID})").ToList();
            //////SQL语句
            //FormattableString sql = $"select * from Product where ProdictID in ({CartID})";
            ////查询要添加的订单商品
            //var addOrder = await _dbContext.Products.FromSqlInterpolated(sql).Include(p => p.ProductCarts).ToListAsync();
            //使用局部变量using
            using (var dbOrderContext = new TestDBContext())
            {
                try
                {
                    //开启事务
                    await dbOrderContext.Database.BeginTransactionAsync();
                    string userid = "";
#pragma warning disable CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
                    userid = HttpContext.Session.GetString("userInfo");
#pragma warning restore CS8600 // 将 null 字面量或可能为 null 的值转换为非 null 类型。
                    if (string.IsNullOrWhiteSpace(userid))
                    {
                        return NotFound();
                    }

                    ////SQL语句
                    FormattableString sql = $"select * from ProductCart where CartID in ({CartID})";
                    //查询要添加的订单商品
                    var addOrder = await dbOrderContext.ProductCarts.FromSqlInterpolated(sql).Include(p => p.Product).ToListAsync();
                    //添加数据到订单
                    ProductOrder productOrder = new ProductOrder
                    {
                        OrderNo = CreatecodeNumber.CreateOrderID(),
                        UserID = userid,
                        OrderName = "",
                        OrderAmountPrice = decimal.Parse(amountprice),
                        OrderDiscountPrice = decimal.Parse(discountprice),
                        OrderSumPrice = decimal.Parse(amountprice) - decimal.Parse(discountprice),
                        OrderNum = addOrder.Count(),
                        OrderAddressId = int.Parse(addressID),
                        OrderType = int.Parse(paytype)

                    };
                    //添加数据到订单详情
                    List<ProductOrderDetail> orderDetails = new List<ProductOrderDetail>();
                    foreach (ProductCart item in addOrder)
                    {
                        ProductOrderDetail orderDetail = new ProductOrderDetail();
                        orderDetail.ProductID = item.ProductID;
                        orderDetail.OrderNo = productOrder.OrderNo;
                        orderDetail.UserID = userid;
                        orderDetail.ShopID = item.Product.ShopID;
                        orderDetail.ProductID = item.Product.ProductID;
                        orderDetail.ProductPrice = item.Product.Price;//原价
                        if (item.Product.discountType == 0)//活动价
                        {
                            orderDetail.DiscountPrice = item.Product.ActivityPrice;
                        }
                        else//折扣价
                        {
                            orderDetail.DiscountPrice = item.Product.Price * item.Product.discount;
                        }
                        orderDetail.OrderProductNum = item.ProductCartNum;//数量
                        orderDetail.OrderDetailState = 1;//状态

                        orderDetails.Add(orderDetail);
                    }
                    var deleteCart = await dbOrderContext.ProductCarts.FromSqlInterpolated(sql).ToListAsync();
                    //添加订单Add（单条）
                    dbOrderContext.Add(productOrder);
                    //添加订单详情AddRange(多条)
                    dbOrderContext.AddRange(orderDetails);
                    //删除购物车已付款的订单数据
                    dbOrderContext.RemoveRange(deleteCart);
                    await dbOrderContext.SaveChangesAsync();
                    //提交事务
                    await dbOrderContext.Database.CommitTransactionAsync();
                }
                catch (Exception)
                {
                    //回滚事务
                    await dbOrderContext.Database.RollbackTransactionAsync();
                    throw;
                }

            }

            return Ok();
        }
        /// <summary>
        /// 修改用户订单状态
        /// </summary>
        /// <param name="detailID"></param>
        /// <returns></returns>
        [HttpPut("detailID")]
        public async Task<IActionResult> UpdateUserorder(string detailID)
        {
            if (string.IsNullOrWhiteSpace(detailID))
            {
                return NotFound();
            }
            var orderDetail = await _dbContext.ProductOrderDetails.Where(p => p.DetailID == int.Parse(detailID)).FirstOrDefaultAsync();
            orderDetail.OrderDetailState = orderDetail.OrderDetailState + 1;
            _dbContext.ProductOrderDetails.Attach(orderDetail);
            _dbContext.SaveChanges();
            return Ok();
        }
        /// <summary>
        /// 删除用户订单
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="detailID"></param>
        /// <returns></returns>
        [HttpDelete]
        public async Task<IActionResult> DeleteUserOrder(string orderID = "", string detailID = "")
        {
            if (string.IsNullOrWhiteSpace(orderID) && string.IsNullOrWhiteSpace(detailID))
            {
                return NotFound();
            }
            if (!string.IsNullOrWhiteSpace(detailID))//删除单条订单详情
            {
                var deleteOrder = await _dbContext.ProductOrderDetails.SingleOrDefaultAsync(p => p.DetailID == int.Parse(detailID));
                if (deleteOrder != null)
                {
                    _dbContext.Remove(deleteOrder);
                }
            }
            if (!string.IsNullOrWhiteSpace(orderID))//删除整个订单
            {
                //使用级联删除
                var deleteOrder = await _dbContext.ProductOrders.Where(p => p.OrderNo == orderID).Include(p => p.ProductOrderDetails).ToListAsync();

                ////使用断开关系（外键）
                //var delorder=await _dbContext.ProductOrders.Where(p=>p.OrderNo==orderID).Include(p => p.ProductOrderDetails).FirstOrDefaultAsync();
                //foreach (ProductOrderDetail item in delorder.ProductOrderDetails)
                //{
                //    item.OrderNo = item.OrderNo+"_del";//修改子表的外键（也可以清空为null）
                //}
                //delorder.ProductOrderDetails.Clear();//获取删除所有的子表关联的数据

                _dbContext.Remove(deleteOrder);
            }
            _dbContext.SaveChanges();
            return Ok();
        }
        #endregion

        #region===>>>用户中心的个人信息
        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <returns></returns>
        [HttpGet("userID")]
        public async Task<IActionResult> GetUserInfo(string userID = "")
        {
            if (string.IsNullOrWhiteSpace(userID))
            {
                return NotFound();
            }
            var userInfo = await _dbContext.Users.Where(p => p.UserID == userID).Include(p => p.UserImageLists).FirstOrDefaultAsync();
            return Ok(userInfo);
        }
        /// <summary>
        /// 添加用户信息
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> AddUserInfo(User user)
        {
            if (user == null)
            {
                return NotFound();
            }
            user.UserID = CreatecodeNumber.CreateUserID();//生成用户编号
            user.Password = PasswordHasher.HashPassword(user.Password);//加密密码
            await _dbContext.Users.AddAsync(user);
            _dbContext.SaveChanges();
            return Ok();
        }
        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <returns></returns>
        [HttpPut("userID")]
        public async Task<IActionResult> UpdateUserInfo(User user, string userID = "")
        {
            if (string.IsNullOrWhiteSpace(userID))
            {
                return NotFound();
            }
            var userInfo = await _dbContext.Users.Where(p => p.UserID == userID).FirstOrDefaultAsync();
            _dbContext.Update(user);
            _dbContext.SaveChanges();
            return Ok();
        }
        /// <summary>
        /// 删除用户信息
        /// </summary>
        /// <returns></returns>
        [HttpDelete]
        public async Task<IActionResult> DeleteUserInfo(string userID = "")
        {
            if (string.IsNullOrWhiteSpace(userID))
            {
                return NotFound();
            }
            var delete = await _dbContext.Users.SingleAsync(p => p.UserID == userID);
            delete.UserState = 0;
            _dbContext.Update(delete);
            _dbContext.SaveChanges();
            return Ok();
        }
        #endregion

        #region===>>>用户中心的地址信息管理
        /// <summary>
        /// 查询用户地址
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        [HttpGet("userID")]
        public async Task<IActionResult> GetAddress(string userID = "")
        {
            if (string.IsNullOrWhiteSpace(userID))
            {
                return NotFound();
            }
            var address = await _dbContext.UserAddresses.Where(p => p.UserID == userID && p.State == 1).ToListAsync();
            return Ok(address);
        }
        /// <summary>
        /// 添加用户地址
        /// </summary>
        /// <param name="userAddress"></param>
        /// <param name="userID"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> AddAddress(UserAddress userAddress, string userID = "")
        {
            if (userAddress == null)
            {
                return NotFound();
            }
            await _dbContext.UserAddresses.AddAsync(userAddress);
            _dbContext.SaveChanges();

            return Ok();
        }
        /// <summary>
        /// 修改用户地址
        /// </summary>
        /// <param name="userAddress"></param>
        /// <param name="addresID"></param>
        /// <returns></returns>
        [HttpPut("addressID")]
        public async Task<IActionResult> UpdateAddress(UserAddress userAddress, string addresID = "")
        {
            if (userAddress == null)
            {
                return NotFound();
            }
            //_dbContext.UserAddresses.Update(userAddress);
            _dbContext.Entry(userAddress).State = EntityState.Modified;
            _dbContext.SaveChanges();
            try
            {
                await _dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                return NotFound();
                throw;
            }

            return Ok();
        }
        /// <summary>
        /// 删除用户地址
        /// </summary>
        /// <param name="addressID"></param>
        /// <returns></returns>
        [HttpDelete]
        public async Task<IActionResult> UpdateAddress(string addressID = "")
        {
            if (addressID == null)
            {
                return NotFound();
            }
            var delete = await _dbContext.UserAddresses.Where(p => p.AddressID == int.Parse(addressID)).FirstOrDefaultAsync();
            delete.State = 0;
            _dbContext.UserAddresses.Update(delete);
            _dbContext.SaveChanges();

            return Ok();
        }
        #endregion










        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
