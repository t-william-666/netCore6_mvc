using coreWeb_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql;
using System.Configuration;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Rewrite;


//===============================================================【添加服务】============================================================================
//WebApplicationBuilder构造函数
var builder = WebApplication.CreateBuilder(args);

/// <summary>
///  将服务添加到容器中  Add services to the container.
/// </summary>
builder.Services.AddControllersWithViews();

/// <summary>
/// 添加了所有必需的 MVC 服务
/// </summary>
builder.Services.AddMvc();

/// <summary>
/// 注册连接数据库的服务
/// </summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;"));
builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection")));

/// <summary>
///MySQL注册连接数据库的服务
///</summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseMySql(builder.Configuration.GetConnectionString("SqlServerConnection")));

/// <summary>
/// Session（会话）服务
/// </summary>
builder.Services.AddSession(options =>
{
    options.Cookie.Name = ".AdventureWorks.Session";//会话使用cookie跟踪和标识来自单个浏览器的请求。默认情况下cookie 名为 .AspNetCore.Session，并使用路径 / 
    options.IdleTimeout = TimeSpan.FromMinutes(60);//设置session的过期时间
    options.Cookie.HttpOnly = true;//设置在浏览器不能通过js获得该cookie的值 

    //SameSite用来防止 CSRF 攻击 和用户追踪（第三方恶意获取cookie），限制第三方 Cookie，从而减少安全风险。
    options.Cookie.SameSite = SameSiteMode.None;//设置了Strict或Lax以后，基本就杜绝了 CSRF 攻击；  None：没有限制。
    //是否只能通过HTTPS请求来传输Cookie信息。
    options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
    //指示此 Cookie 是否对于应用程序正常运行至关重要。 如果为 true，则可能会绕过同意策略检查。 默认值为 false。
    options.Cookie.IsEssential = true;
});

/// <summary>
/// Session（会话）服务
/// </summary>
builder.Services.AddHttpContextAccessor();

/// <summary>
///防伪造服务配置为查找 X-XSRF-TOKEN 标头： 名为 X-XSRF-TOKEN 的请求头中发送令牌
///使用 JavaScript 发出带有相应标头的 AJAX 请求 表头就必须为 下面命名--X-XSRF-TOKEN
////// </summary>
//builder.Services.AddAntiforgery(options => options.HeaderName = "X-XSRF-TOKEN");

/// <summary>
/// 添加Swagger   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
/// </summary>
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("api", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "Api", Version = "v1" });
});

/// <summary>
/// 添加Api发现功能   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
/// </summary>
builder.Services.AddEndpointsApiExplorer();


/// <summary>
///添加JWT验证  需要添加 NuGet包==》Authentication.JwtBearer组件
///</summary>
// 设置验证方式为 Bearer Token
// 你也可以添加 using Microsoft.AspNetCore.Authentication.JwtBearer;
// 使用 JwtBearerDefaults.AuthenticationScheme 代替 字符串 "Brearer"
builder.Services.AddAuthentication("Bearer").AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("abcdABCD1234abcdABCD1234")),    // 加密解密Token的密钥

            // 是否验证发布者
            ValidateIssuer = true,
            // 发布者名称
            ValidIssuer = "server",

            // 是否验证订阅者
            ValidateAudience = true,
            // 订阅者名称
            ValidAudience = "client007",

            // 是否验证令牌有效期
            ValidateLifetime = true,
            // 每次颁发令牌，令牌有效时间 60分钟
            ClockSkew = TimeSpan.FromMinutes(60)
        };
});







//===============================================================【注册服务】============================================================================
var app = builder.Build();

/// <summary>
/// 配置HTTP请求管道 异常处理中间件  Configure the HTTP request pipeline.
/// </summary>
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

//抛出异常测试
app.MapGet("/throw", () => { throw new Exception("Exception occured"); });

//注册swagger路由   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
app.UseSwagger();

//注册Swagger UI 路由   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/api/swagger.json", "Api v1"));

//注册静态文件
app.UseStaticFiles();

//注册路由
app.UseRouting();

//注册Session会话服务
app.UseSession();

//注册JWT验证 （权限验证）
app.UseAuthentication();

//注册UseHsts所有请求转换为HTTPS连接
//app.UseHsts();

//注册强制使用HTTPS 将 HTTP 请求重定向到 HTTPS
//app.UseHttpsRedirection();

//注册授权
app.UseAuthorization();

//注册获取防伪造令牌服务对象
var antiforgery = app.Services.GetRequiredService<IAntiforgery>();

//配置路由
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

app.Run();
