using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Security.Cryptography;
using System.Text;

namespace coreWeb_MVC.Models.Other
{
    /// <summary>
    /// PBKDF2 密码加密
    /// </summary>
    public class PasswordHasher
    {
        /// <summary>
        /// 创建一个加密密码的方法，传入需要加密密码，和盐
        /// </summary>
        /// <param name="value"></param>
        /// <param name="salt"></param>
        /// <returns></returns>
        private static string HashPassword(string value, string salt)
        {
            var valueBytes = KeyDerivation.Pbkdf2( //PRF 是一个伪随机函数，可以简单的理解为 Hash 函数
                password: value, //Password 表示口令 。
                salt: Encoding.UTF8.GetBytes(salt), //Salt 表示盐值，一个随机数。
                prf: KeyDerivationPrf.HMACSHA512, //伪随机函数，这里是SHA-512
                iterationCount: 10000, //c 表示迭代次数。
                numBytesRequested: 256 / 8); //dkLen 表示最后输出的密钥长度。

            return Convert.ToBase64String(valueBytes);
        }
        /// <summary>
        /// 存储的用户密码的hash值和盐方法 
        /// </summary>
        /// 用户注册时或修改密码使用
        /// <param name="password"></param>
        /// <returns></returns>
        /// 内部的密码加密和校验部分已经完成了，但还有一个问题，就是创建用户密码的时候，如何存储的用户密码的hash值和盐呢，
        /// 这里我采取使用“点”进行拼接存储，即使用salt.hash的形式，相应的，取值校验，再以“点”进行拆分
        public static string HashPassword(string password)
        {
            var salt = GenerateSalt();
            var hash = HashPassword(password, salt);
            var result = $"{salt}.{hash}";
            Console.WriteLine("hash result:{0}", result);
            return result;
        }
        /// <summary>
        /// hash校验的方法
        /// </summary> 
        /// 这时我们需要输入用户输入的密码，盐，以及生成好的hash值，就可以判断用户输入的密码是否正确了。
        /// <param name="password"></param>
        /// <param name="salt"></param>
        /// <param name="hash"></param>
        /// <returns></returns>
        private static bool Validate(string password, string salt, string hash)
            => HashPassword(password, salt) == hash;
        /// <summary>
        /// 对外的密码校验函数  
        /// </summary>
        /// 用户登录验证密码是否正确
        /// <param name="password"></param>
        /// <param name="storePassword"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentNullException"></exception>
        public static bool VerifyHashedPassword(string password, string storePassword)
        {
            if (string.IsNullOrEmpty(password))
            {
                throw new ArgumentNullException(nameof(password));
            }

            if (string.IsNullOrEmpty(storePassword))
            {
                throw new ArgumentNullException(nameof(storePassword));
            }

            var parts = storePassword.Split('.');
            var salt = parts[0];
            var hash = parts[1];

            return Validate(password, salt, hash); ;
        }
        /// <summary>
        /// 随机盐生成的方法
        /// </summary>
        /// <returns></returns>
        private static string GenerateSalt()
        {
            byte[] randomBytes = new byte[128 / 8];
            using (var generator = RandomNumberGenerator.Create())
            {
                generator.GetBytes(randomBytes);
                return Convert.ToBase64String(randomBytes);
            }
        }

    }
}
