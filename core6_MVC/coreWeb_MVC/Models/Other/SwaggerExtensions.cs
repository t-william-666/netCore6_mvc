using Microsoft.OpenApi.Models;
using NSwag.Annotations;
using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerGen;
using System.Collections.Concurrent;
using System.Reflection;
using System.Xml;

namespace coreWeb_MVC.Models.Other
{
    /// <summary>
    /// 添加控制器swagger扩展类
    /// </summary>
    // DocumentFilter是文档过滤器，它是在获取swagger文档接口，返回结果前调用，也就是请求swagger.json时调用，它允许我们对即将返回的swagger文档信息做调整，
    // 比如上面的例子中添加的全局认证方式和AddSecurityRequirement添加的效果是一样的：　　
    public class ApplyTagDescriptions : IDocumentFilter
    {
        /// <summary>
        /// swagger汉化标签
        /// </summary>
        /// <param name="swaggerDoc"></param>
        /// <param name="context"></param>
        [Obsolete]
        public void Apply(OpenApiDocument swaggerDoc, DocumentFilterContext context)
        {
            var allTypes = AppDomain.CurrentDomain.GetAssemblies().SelectMany(i => i.GetTypes()).ToList();

            foreach (var definition in swaggerDoc.Components.Schemas)
            {
                var type = allTypes.FirstOrDefault(x => x.Name == definition.Key);
                if (type != null)
                {
                    var properties = type.GetProperties();
                    foreach (var prop in properties.ToList())
                    {
                        var ignoreAttribute = prop.GetCustomAttribute(typeof(SwaggerIgnoreAttribute), false);

                        if (ignoreAttribute != null)
                        {
                            definition.Value.Properties.Remove(prop.Name);
                        }
                    }
                }
            }
        }   
    }
}
