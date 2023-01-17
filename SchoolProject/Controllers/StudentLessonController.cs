using SchoolProject.Connection;
using SchoolProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolProject.Controllers
{
    public class StudentLessonController : Controller
    {
        // GET: StudentLesson
        ProjectForSchoolEntities db = new ProjectForSchoolEntities();
        public ActionResult StudentLessonList()
        {
            var StudentLessons = db.OgrenciDers.ToList();

            StudentLessonModels studentlessonModel = new StudentLessonModels()
            {
                StudentLessons = StudentLessons
            };

            return View(studentlessonModel);
        }

        [HttpGet]
        public ActionResult RemoveStudentLesson(int id)
        {
            if (id > 0)
            {
                var removeit = db.OgrenciDers.FirstOrDefault(x => x.Id == id);
                db.OgrenciDers.Remove(removeit);
                db.SaveChanges();
                TempData["Status"] = "Delete Successed";
                return RedirectToAction("StudentLessonList", "StudentLesson");
            }
            else
            {
                TempData["Status"] = "Delete Failed";
                return RedirectToAction("StudentLessonList", "StudentLesson");
            }
        }

        [HttpGet]
        public ActionResult AddStudentLesson()
        {
            var dersler = db.Ders.ToList();
            var ogrenciler = db.Ogrenci.ToList();

            StudentLessonModels model = new StudentLessonModels()
            {
                Ogrenciler = ogrenciler,
                Dersler = dersler
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult AddStudentLesson(int DersId, int OgrenciId)
        {
            OgrenciDers additem = new OgrenciDers();
            additem.DersId = DersId;
            additem.OgrenciId = OgrenciId;
     
            db.OgrenciDers.Add(additem);
            db.SaveChanges();
            TempData["Status"] = "Öğrenci Ders Kayıdı Başarılı";
            return RedirectToAction("AddStudentLesson", "StudentLesson");
        }
    }
}