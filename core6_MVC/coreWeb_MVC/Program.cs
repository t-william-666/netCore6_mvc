using coreWeb_MVC.Models;
using Microsoft.EntityFrameworkCore;

//
var builder = WebApplication.CreateBuilder(args);

/// <summary>
///  将服务添加到容器中  Add services to the container.
/// </summary>
builder.Services.AddControllersWithViews();

/// <summary>
/// 注册连接数据库的服务
/// </summary>
builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;"));

/// <summary>
/// 添加Swagger   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
/// </summary>
builder.Services.AddSwaggerGen(c => 
{
    c.SwaggerDoc("api", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "Api", Version = "v1" });
});

/// <summary>
/// 注册Api发现功能   需要添加 NuGet包 ==》  Swashbuckle.AspNetCore 组件
/// </summary>
builder.Services.AddEndpointsApiExplorer();



var app = builder.Build();

/// <summary>
/// 配置HTTP请求管道  Configure the HTTP request pipeline.
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
app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/api/swagger.json","Api v1"));

//注册静态文件
app.UseStaticFiles();

//注册路由
app.UseRouting();

//注册授权
app.UseAuthorization();

//配置路由
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

app.Run();
