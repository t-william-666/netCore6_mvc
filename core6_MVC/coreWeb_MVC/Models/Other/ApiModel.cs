namespace coreWeb_MVC.Models.Other
{
    public class ApiModel
    {
        /// <summary>
        /// api请求状态 1成功、2失败
        /// </summary>
        public int status { get; set; }
        /// <summary>
        /// api请求的数据
        /// </summary>
        public object? data { get; set; }
        /// <summary>
        /// api提示信息
        /// </summary>
        public string? msg { get; set; }
    }
}
