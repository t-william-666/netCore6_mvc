using coreWeb_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql;
using System.Configuration;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authentication.Cookies;

//
var builder = WebApplication.CreateBuilder(args);

/// <summary>
///  ��������ӵ�������  Add services to the container.
/// </summary>
builder.Services.AddControllersWithViews();

/// <summary>
/// ע���������ݿ�ķ���
/// </summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;"));
builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection")));

/// <summary>
///MySQLע���������ݿ�ķ���
///</summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseMySql(builder.Configuration.GetConnectionString("SqlServerConnection")));

builder.Services.AddSession(options =>
{
    options.Cookie.Name = ".AdventureWorks.Session";//�Ựʹ��cookie���ٺͱ�ʶ���Ե��������������Ĭ�������cookie ��Ϊ .AspNetCore.Session����ʹ��·�� / 
    options.IdleTimeout = TimeSpan.FromMinutes(60);//����session�Ĺ���ʱ��
    options.Cookie.HttpOnly = true;//���������������ͨ��js��ø�cookie��ֵ 

    //SameSite������ֹ CSRF ���� ���û�׷�٣������������ȡcookie�������Ƶ����� Cookie���Ӷ����ٰ�ȫ���ա�
    options.Cookie.SameSite = SameSiteMode.None;//������Strict��Lax�Ժ󣬻����Ͷž��� CSRF ������  None��û�����ơ�
    //�Ƿ�ֻ��ͨ��HTTPS����������Cookie��Ϣ��
    options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
    //ָʾ�� Cookie �Ƿ����Ӧ�ó�����������������Ҫ�� ���Ϊ true������ܻ��ƹ�ͬ����Լ�顣 Ĭ��ֵΪ false��
    options.Cookie.IsEssential = true;
});

/// <summary>
/// ���Swagger   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
/// </summary>
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("api", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "Api", Version = "v1" });
});

/// <summary>
/// ���Api���ֹ���   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
/// </summary>
builder.Services.AddEndpointsApiExplorer();


/// <summary>
///���JWT��֤  ��Ҫ��� NuGet��==��Authentication.JwtBearer���
///</summary>
// ������֤��ʽΪ Bearer Token
// ��Ҳ������� using Microsoft.AspNetCore.Authentication.JwtBearer;
// ʹ�� JwtBearerDefaults.AuthenticationScheme ���� �ַ��� "Brearer"
builder.Services.AddAuthentication("Bearer").AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("abcdABCD1234abcdABCD1234")),    // ���ܽ���Token����Կ

            // �Ƿ���֤������
            ValidateIssuer = true,
            // ����������
            ValidIssuer = "server",

            // �Ƿ���֤������
            ValidateAudience = true,
            // ����������
            ValidAudience = "client007",

            // �Ƿ���֤������Ч��
            ValidateLifetime = true,
            // ÿ�ΰ䷢���ƣ�������Чʱ�� 2Сʱ
            ClockSkew = TimeSpan.FromMinutes(120)
        };
    });

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
app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/api/swagger.json", "Api v1"));

//ע�ᾲ̬�ļ�
app.UseStaticFiles();

//ע��·��
app.UseRouting();

//ע��Session�Ự����
app.UseSession();

//ע��JWT��֤ ��Ȩ����֤��
app.UseAuthentication();

//ע����Ȩ
app.UseAuthorization();



//����·��
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

app.Run();
