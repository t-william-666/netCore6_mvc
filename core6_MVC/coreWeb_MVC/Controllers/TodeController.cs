using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace coreWeb_MVC.Controllers
{
    //Api路由格式
    [Route("api/[controller]")]
    [ApiController]
    public class TodeController : ControllerBase
    {
        // GET: api/<TodeController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "数据1", "数据2" };
        }

        // GET api/<TodeController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            var name = "";
            return "value";
        }

        // POST api/<TodeController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<TodeController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<TodeController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
