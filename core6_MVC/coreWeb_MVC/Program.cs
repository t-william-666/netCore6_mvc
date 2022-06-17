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
//Swagger �Զ������չ
using Microsoft.OpenApi.Models;
using System.Reflection;
using Microsoft.Extensions.PlatformAbstractions;
using coreWeb_MVC.Models.Other;


//===============================================================����ӷ���============================================================================
//WebApplicationBuilder���캯��
var builder = WebApplication.CreateBuilder(args);

//// <summary>
////  ��������ӵ�������  Add services to the container.
//// </summary>
builder.Services.AddControllersWithViews();

//// <summary>
//// ��������б���� MVC ����
//// </summary>
builder.Services.AddMvc();

//// <summary>
//// ע���������ݿ�ķ���
//// </summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;"));
builder.Services.AddDbContext<TestDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection")));

//// <summary>
////MySQLע���������ݿ�ķ���
////</summary>
//builder.Services.AddDbContext<TestDBContext>(options => options.UseMySql(builder.Configuration.GetConnectionString("SqlServerConnection")));

//// <summary>
////�ֲ�ʽ�ڴ滺��
/////// <summary>
builder.Services.AddDistributedMemoryCache();
//// <summary>
//// Session���Ự������
//// </summary>
builder.Services.AddSession(options =>
{
    options.Cookie.Name = ".AdventureWorks.Session";//�Ựʹ��cookie���ٺͱ�ʶ���Ե��������������Ĭ�������cookie ��Ϊ .AspNetCore.Session����ʹ��·�� / 
    options.IdleTimeout = TimeSpan.FromMinutes(60);//����session�Ĺ���ʱ��
    options.Cookie.HttpOnly = true;//���������������ͨ��js��ø�cookie��ֵ 

    ////SameSite������ֹ CSRF ���� ���û�׷�٣������������ȡcookie�������Ƶ����� Cookie���Ӷ����ٰ�ȫ���ա�
    //options.Cookie.SameSite = SameSiteMode.None;//������Strict��Lax�Ժ󣬻����Ͷž��� CSRF ������  None��û�����ơ�
    ////�Ƿ�ֻ��ͨ��HTTPS����������Cookie��Ϣ��
    options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
    ////ָʾ�� Cookie �Ƿ����Ӧ�ó�����������������Ҫ�� ���Ϊ true������ܻ��ƹ�ͬ����Լ�顣 Ĭ��ֵΪ false��
    options.Cookie.IsEssential = false;
});
//// <summary>
//// Session���Ự������
//// </summary>
builder.Services.AddHttpContextAccessor();



//// <summary>
////��α���������Ϊ���� X-XSRF-TOKEN ��ͷ�� ��Ϊ X-XSRF-TOKEN ������ͷ�з�������
////ʹ�� JavaScript ����������Ӧ��ͷ�� AJAX ���� ��ͷ�ͱ���Ϊ ��������--X-XSRF-TOKEN
//// </summary>
//builder.Services.AddAntiforgery(options => options.HeaderName = "X-XSRF-TOKEN");

//// <summary>
//// ���Swagger   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
//// �� Swagger ��������ӵ� Program.cs �еķ��񼯺ϣ�
//// </summary>
builder.Services.AddSwaggerGen(options =>
{
    //Api����
    options.SwaggerDoc("api", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "Ӧ�ó���ӿڣ�api��",
        Version = "v1",
        Description = "�ӿ��ĵ�˵��"
    });

    ////AddServer����ȫ�ֵ���ӽӿ�������ǰ׺������·����������Ϣ��Ĭ������£����������SwaggerUiҳ��ʹ��Try it outȥ���ýӿ�ʱ��
    ////Ĭ��ʹ�õ��ǵ�ǰswaggerUIҳ�����ڵĵ�ַ������Ϣ��
    options.AddServer(new OpenApiServer() { Url = "http://localhost:4460", Description = "��ַ1" });
    options.AddServer(new OpenApiServer() { Url = "http://127.0.0.1:5001", Description = "��ַ2" });
    options.AddServer(new OpenApiServer() { Url = "http://192.168.28.213:5002", Description = "��ַ3" });


    //////��װMicrosoft.Extensions.PlatformAbstractions���
    //// ��ȡxml�ļ���
    //var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    //// ��ȡxml�ļ�·��
    //var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
    //// ��ӿ�������ע�ͣ�true��ʾ��ʾ������ע��
    //options.IncludeXmlComments(xmlPath, true);


    //�����ͬ�����ᱨ�������
    options.CustomSchemaIds(type => type.FullName);
    //API�ӿ��ļ�·��
    var filePath = Path.Combine(PlatformServices.Default.Application.ApplicationBasePath, "coreWeb_MVC.xml");
    // ��ӿ�������ע�ͣ�true��ʾ��ʾ������ע��
    options.IncludeXmlComments(filePath);
    //����ʵ��·��
    var requestfilePath = Path.Combine(PlatformServices.Default.Application.ApplicationBasePath, "coreWeb_MVC.xml");
    // ��ӿ�������ע�ͣ�true��ʾ��ʾ������ע��
    options.IncludeXmlComments(requestfilePath);
    //options.DescribeAllEnumsAsStrings();
    //��ӶԿ������ı�ǩ(����)
    options.DocumentFilter<ApplyTagDescriptions>();
});

//// <summary>
//// ���Api���ֹ���   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
//// </summary>
builder.Services.AddEndpointsApiExplorer();


//// <summary>
////���JWT��֤  ��Ҫ��� NuGet��==��Authentication.JwtBearer���
////</summary>
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







//===============================================================��ע�������м����============================================================================
var app = builder.Build();

//// <summary>
//// ����HTTP����ܵ� �쳣�����м��  Configure the HTTP request pipeline.
//// </summary>
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

//�׳��쳣����
app.MapGet("/throw", () => { throw new Exception("Exception occured"); });

//�����м��Ϊ���ɵ� JSON �ĵ� �� Swagger UI �ṩ����
//ע��swagger·��   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
//app.UseSwagger();
app.UseSwagger(options =>
{
    //��Ҫѡ����� 2.0 ��ʽ
    options.SerializeAsV2 = true;
});

//ע��Swagger UI ·��   ��Ҫ��� NuGet�� ==��  Swashbuckle.AspNetCore ���
app.UseSwaggerUI(options =>
{
    options.SwaggerEndpoint("/swagger/api/swagger.json", "Api v3");

    ////ע�뺺��js�ļ�
    options.InjectJavascript("/js/jquery-3.5.1.min.js");
    options.InjectJavascript("/swagger-ui/swagger-chinese.js");

    ////ע��css�ļ�
    options.InjectStylesheet("/swagger-ui/swagger.css");
});

//ע�ᾲ̬�ļ�
app.UseStaticFiles();
//ע��Ĭ���ļ�ӳ��
app.UseDefaultFiles();

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
    //����ʱĬ��·��-Home������-Indexҳ��
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

app.Run();
