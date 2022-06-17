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
//Swagger 自定义和扩展
using Microsoft.OpenApi.Models;
using System.Reflection;
using Microsoft.Extensions.PlatformAbstractions;
using coreWeb_MVC.Models.Other;


//===============================================================【添加服务】============================================================================
//WebApplicationBuilder构造函数
var builder = WebApplication.CreateBuilder(args);

//// <summary>
////  将服务添加到容器中  Add services to the container.
//// </summary>
builder.Services.AddControllersWithViews();

//// <summary>
//// 添加了所有必需的 MVC 服务
//// </summary>
builder.Services.AddMvc();

//// <summary>
//// 注册连接数据库的服务
//// </summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;"));
builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection")));

//// <summary>
////MySQL注册连接数据库的服务
////</summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseMySql(builder.Configuration.GetConnectionString("SqlServerConnection")));

//// <summary>
////分布式内存缓存
/////// <summary>
builder.Services.AddDistributedMemoryCache();
//// <summary>
//// Session（会话）服务
//// </summary>
builder.Services.AddSession(options =>
{
    options.Cookie.Name = ".AdventureWorks.Session";//会话使用cookie跟踪和标识来自单个浏览器的请求。默认情况下cookie 名为 .AspNetCore.Session，并使用路径 / 
    options.IdleTimeout = TimeSpan.FromMinutes(60);//设置session的过期时间
    options.Cookie.HttpOnly = true;//设置在浏览器不能通过js获得该cookie的值 

    ////SameSite用来防止 CSRF 攻击 和用户追踪（第三方恶意获取cookie），限制第三方 Cookie，从而减少安全风险。
    //options.Cookie.SameSite = SameSiteMode.None;//设置了Strict或Lax以后，基本就杜绝了 CSRF 攻击；  None：没有限制。
    ////是否只能通过HTTPS请求来传输Cookie信息。
    options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
    ////指示此 Cookie 是否对于应用程序正常运行至关重要。 如果为 true，则可能会绕过同意策略检查。 默认值为 false。
    options.Cookie.IsEssential = false;
});
//// <summary>
//// Session（会话）服务
//// </summary>
builder.Services.AddHttpContextAccessor();



//// <summary>
////防伪造服务配置为查找 X-XSRF-TOKEN 标头： 名为 X-XSRF-TOKEN 的请求头中发送令牌
////使用 JavaScript 发出带有相应标头的 AJAX 请求 表头就必须为 下面命名--X-XSRF-TOKEN
//// </summary>
//builder.Services.AddAntiforgery(options => options.HeaderName = "X-XSRF-TOKEN");

//// <summary>
//// 添加Swagger   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
//// 将 Swagger 生成器添加到 Program.cs 中的服务集合：
//// </summary>
builder.Services.AddSwaggerGen(options =>
{
    //Api标题
    options.SwaggerDoc("api", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "应用程序接口（api）",
        Version = "v1",
        Description = "接口文档说明"
    });

    ////AddServer用于全局的添加接口域名和前缀（虚拟路径）部分信息，默认情况下，如果我们在SwaggerUi页面使用Try it out去调用接口时，
    ////默认使用的是当前swaggerUI页面所在的地址域名信息：
    options.AddServer(new OpenApiServer() { Url = "http://localhost:4460", Description = "地址1" });
    options.AddServer(new OpenApiServer() { Url = "http://127.0.0.1:5001", Description = "地址2" });
    options.AddServer(new OpenApiServer() { Url = "http://192.168.28.213:5002", Description = "地址3" });


    //////安装Microsoft.Extensions.PlatformAbstractions组件
    //// 获取xml文件名
    //var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    //// 获取xml文件路径
    //var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
    //// 添加控制器层注释，true表示显示控制器注释
    //options.IncludeXmlComments(xmlPath, true);


    //解决相同类名会报错的问题
    options.CustomSchemaIds(type => type.FullName);
    //API接口文件路径
    var filePath = Path.Combine(PlatformServices.Default.Application.ApplicationBasePath, "coreWeb_MVC.xml");
    // 添加控制器层注释，true表示显示控制器注释
    options.IncludeXmlComments(filePath);
    //请求实体路径
    var requestfilePath = Path.Combine(PlatformServices.Default.Application.ApplicationBasePath, "coreWeb_MVC.xml");
    // 添加控制器层注释，true表示显示控制器注释
    options.IncludeXmlComments(requestfilePath);
    //options.DescribeAllEnumsAsStrings();
    //添加对控制器的标签(描述)
    options.DocumentFilter<ApplyTagDescriptions>();
});

//// <summary>
//// 添加Api发现功能   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
//// </summary>
builder.Services.AddEndpointsApiExplorer();


//// <summary>
////添加JWT验证  需要添加 NuGet包==》Authentication.JwtBearer组件
////</summary>
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







//===============================================================【注册服务的中间件】============================================================================
var app = builder.Build();

//// <summary>
//// 配置HTTP请求管道 异常处理中间件  Configure the HTTP request pipeline.
//// </summary>
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

//抛出异常测试
app.MapGet("/throw", () => { throw new Exception("Exception occured"); });

//启用中间件为生成的 JSON 文档 和 Swagger UI 提供服务
//注册swagger路由   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
//app.UseSwagger();
app.UseSwagger(options =>
{
    //若要选择采用 2.0 格式
    options.SerializeAsV2 = true;
});

//注册Swagger UI 路由   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
app.UseSwaggerUI(options =>
{
    options.SwaggerEndpoint("/swagger/api/swagger.json", "Api v3");

    ////注入汉化js文件
    options.InjectJavascript("/js/jquery-3.5.1.min.js");
    options.InjectJavascript("/swagger-ui/swagger-chinese.js");

    ////注入css文件
    options.InjectStylesheet("/swagger-ui/swagger.css");
});

//注册静态文件
app.UseStaticFiles();
//注册默认文件映射
app.UseDefaultFiles();

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
    //启动时默认路由-Home控制器-Index页面
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

app.Run();
