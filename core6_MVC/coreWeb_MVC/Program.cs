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


//===============================================================����ӷ���============================================================================
//WebApplicationBuilder���캯��
var builder = WebApplication.CreateBuilder(args);

/// <summary>
///  ��������ӵ�������  Add services to the container.
/// </summary>
builder.Services.AddControllersWithViews();

/// <summary>
/// ��������б���� MVC ����
/// </summary>
builder.Services.AddMvc();

/// <summary>
/// ע���������ݿ�ķ���
/// </summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;"));
builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection")));

/// <summary>
///MySQLע���������ݿ�ķ���
///</summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseMySql(builder.Configuration.GetConnectionString("SqlServerConnection")));

/// <summary>
/// Session���Ự������
/// </summary>
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
/// Session���Ự������
/// </summary>
builder.Services.AddHttpContextAccessor();

/// <summary>
///��α���������Ϊ���� X-XSRF-TOKEN ��ͷ�� ��Ϊ X-XSRF-TOKEN ������ͷ�з�������
///ʹ�� JavaScript ����������Ӧ��ͷ�� AJAX ���� ��ͷ�ͱ���Ϊ ��������--X-XSRF-TOKEN
////// </summary>
//builder.Services.AddAntiforgery(options => options.HeaderName = "X-XSRF-TOKEN");

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
            // ÿ�ΰ䷢���ƣ�������Чʱ�� 60����
            ClockSkew = TimeSpan.FromMinutes(60)
        };
});







//===============================================================��ע�����============================================================================
var app = builder.Build();

/// <summary>
/// ����HTTP����ܵ� �쳣�����м��  Configure the HTTP request pipeline.
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

//ע��UseHsts��������ת��ΪHTTPS����
//app.UseHsts();

//ע��ǿ��ʹ��HTTPS �� HTTP �����ض��� HTTPS
//app.UseHttpsRedirection();

//ע����Ȩ
app.UseAuthorization();

//ע���ȡ��α�����Ʒ������
var antiforgery = app.Services.GetRequiredService<IAntiforgery>();

//����·��
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

app.Run();
