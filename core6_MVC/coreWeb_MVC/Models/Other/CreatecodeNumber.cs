namespace coreWeb_MVC.Models.Other
{
    public class CreatecodeNumber
    {
        /// <summary>
        /// 生成用户编号
        /// </summary>
        /// <returns></returns>
        public static string CreateUserID()
        {
            string userID = "US";
            //获取当前时间到秒
            string date = DateTime.Now.ToString("yyyyMMddhhmmss");
            //获取当前时间的微妙
            string nutime = DateTime.Now.ToString("FFFF");
            userID = userID + date + nutime;

            return userID;
        }
        /// <summary>
        /// 生成商店编号
        /// </summary>
        /// <returns></returns>
        public static string CreateShopID()
        {
            string ShopID = "SD-";
            //获取当前时间到秒
            string date = DateTime.Now.ToString("yyyyMMddhhmmss");
            //获取当前时间的微妙
            string nutime = DateTime.Now.ToString("FFFF");
            ShopID = ShopID + date + nutime;
            return ShopID;
        }
        /// <summary>
        /// 生成商品编号
        /// </summary>
        /// <returns></returns>
        public static string CreateProductID(string proType = "")
        {
            string productID = proType + "-";
            //获取当前时间到秒
            string date = DateTime.Now.ToString("yyyyMMddhhmmss");
            //获取当前时间的微妙
            string nutime = DateTime.Now.ToString("FFFF");
            productID = productID + date + nutime;
            return productID;
        }

    }
}
