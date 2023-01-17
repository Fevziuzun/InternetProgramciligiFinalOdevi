using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolProject.Models
{
    public class StudentLessonModels
    {
        public List<Connection.OgrenciDers> StudentLessons { get; set; }
        public List<Connection.Ogrenci> Ogrenciler { get; set; }
        public List<Connection.Ders> Dersler { get; set; }
    }
}