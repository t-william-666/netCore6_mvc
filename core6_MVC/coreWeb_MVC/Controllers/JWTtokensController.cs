using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;


namespace coreWeb_MVC.Controllers
{
    /// <summary>
    /// JWT 生成接口令牌
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class JWTtokensController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        //一定要在这里注入configuration
        public JWTtokensController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        [Route("login")]
        public string login()
        {
            // 1. 定义需要使用到的Claims
            var claims = new[]
            {
                new Claim("Id", "9527"),
                new Claim("Name", "Admin")
            };

            // 2. 从 appsettings.json 中读取SecretKey（加密密钥）
            var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:SecretKey"]));

            // 3. 选择加密算法
            var algorithm = SecurityAlgorithms.HmacSha256;

            // 4. 生成Credentials（资格证书）
            var signingCredentials = new SigningCredentials(secretKey, algorithm);

            // 5. 从 appsettings.json 中读取Expires （令牌有效时间）
            var expires = Convert.ToDouble(_configuration["JWT:Expires"]);

            // 6. 根据以上，生成token
            //注意：claims里面的内容应该要从外面传递进来，动态存一些用户信息之类的，configuration["JWT:SecretKey"]
            //这种是在读取配置文件appsettings.json中的配置，configuration要在类的构造函数中注入进来。
            var token = new JwtSecurityToken(
                _configuration["JWT:Issuer"],    //Issuer（发布者名称）
                _configuration["JWT:Audience"],  //Audience（订阅者名称）
                claims,                          //Claims（）
                DateTime.Now,                    //notBefore（当前时间）
                DateTime.Now.AddDays(expires),   //expires（令牌有效时间）
                signingCredentials               //Credentials（资格证书）
            );

            // 7. 将token变为string
            var jwtToken = new JwtSecurityTokenHandler().WriteToken(token);
            return jwtToken;
        }
    }
}
