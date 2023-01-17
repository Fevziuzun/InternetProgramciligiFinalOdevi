using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolProject.Models
{
    public class LessonModels
    {
        public List<Connection.Ders> Lessons { get; set; }
        public List<Connection.Personel> Teachers { get; set; }
        public Connection.Ders Lesson { get; set; }
    }
}