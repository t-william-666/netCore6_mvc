using Microsoft.EntityFrameworkCore;
namespace coreWeb_MVC.Models
{
    public class OADbContext:DbContext
    {
        public DbSet<students> theStudents { get; set; }

        //生成构造函数
        public OADbContext(DbSet<students> theStudents)
        {
            this.theStudents = theStudents;
        }
    }
}
