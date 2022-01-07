using coreWeb_MVC.Models;
using Microsoft.EntityFrameworkCore;

//
var builder = WebApplication.CreateBuilder(args);

/// <summary>
///  ��������ӵ�������  Add services to the container.
/// </summary>
builder.Services.AddControllersWithViews();

/// <summary>
/// ע���������ݿ�ķ���
/// </summary>
builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;"));

/// <summary>
/// ���Swagger   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
/// </summary>
builder.Services.AddSwaggerGen(c => 
{
    c.SwaggerDoc("api", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "Api", Version = "v1" });
});

/// <summary>
/// ע��Api���ֹ���   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
/// </summary>
builder.Services.AddEndpointsApiExplorer();



var app = builder.Build();

/// <summary>
/// ����HTTP����ܵ�  Configure the HTTP request pipeline.
/// </summary>
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

//�׳��쳣����
app.MapGet("/throw", () => { throw new Exception("Exception occured"); });

//ע��swagger·��   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
app.UseSwagger();

//ע��Swagger UI ·��   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/api/swagger.json","Api v1"));

//ע�ᾲ̬�ļ�
app.UseStaticFiles();

//ע��·��
app.UseRouting();

//ע����Ȩ
app.UseAuthorization();

//����·��
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

app.Run();
