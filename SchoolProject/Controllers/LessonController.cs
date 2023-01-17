using SchoolProject.Connection;
using SchoolProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolProject.Controllers
{
    public class LessonController : Controller
    {
        // GET: Lesson
        ProjectForSchoolEntities db = new ProjectForSchoolEntities();

        [HttpGet]
        public ActionResult LessonList()
        {
            var AllLessons = db.Ders.ToList();
            var Teachers = db.Personel.ToList();

            LessonModels LessonList = new LessonModels()
            {
                Lessons = AllLessons,
                Teachers = Teachers
            };
            return View(LessonList);
        }

        [HttpGet]
        public ActionResult RemoveLesson(int id)
        {
            if (id > 0)
            {
                var removelesson = db.Ders.FirstOrDefault(x => x.Id == id);
                db.Ders.Remove(removelesson);
                db.SaveChanges();
                TempData["Status"] = "Delete Successed";
                return RedirectToAction("LessonList", "Lesson");
            }
            else
            {
                TempData["Status"] = "Delete Failed";
                return RedirectToAction("LessonList", "Lesson");
            }

        }

        [HttpGet]
        public ActionResult AddLesson()
        {
            var lessonTeacher = db.Personel.ToList();
            LessonModels LessonList = new LessonModels()
            {
                
                Teachers = lessonTeacher
            };
            return View(LessonList);
        }

        [HttpPost]
        public ActionResult AddLesson(string Ad, int Kredisi, int OkulYonetimId)
        {
            Ders addlesson = new Ders();
            addlesson.Ad = Ad;
            addlesson.Kredisi = Kredisi;
            addlesson.OkulYonetimId = OkulYonetimId;
            db.Ders.Add(addlesson);
            db.SaveChanges();
            TempData["Status"] = "Ders Kayıdı Başarılı";
            return RedirectToAction("AddLesson", "Lesson");
        }

        public ActionResult UpdateLesson(int id = 0)
        {

            if (id < 1)
            {
                return RedirectToAction("LessonList", "Lesson");
            }

            var LessonQueery = db.Ders.FirstOrDefault(x => x.Id == id);
            var Teachers = db.Personel.ToList();
            var Lessons = db.Ders.ToList();
            if (LessonQueery == null)
            {
                return RedirectToAction("LessonList", "Lesson");
            }

            LessonModels model = new LessonModels()
            {
                Lesson = LessonQueery,
                Teachers = Teachers,
                Lessons = Lessons
            };
            return View(model);

        }

        [HttpPost]
        public ActionResult UpdateLesson(LessonModels model, int id, int OkulYonetimId)
        {
            var updatelesson = db.Ders.FirstOrDefault(x => x.Id == id);
            updatelesson.Ad = model.Lesson.Ad;
            updatelesson.Kredisi = model.Lesson.Kredisi;
            updatelesson.OkulYonetimId = OkulYonetimId;
            db.SaveChanges();
            return RedirectToAction("LessonList", "Lesson");
        }
    }
}