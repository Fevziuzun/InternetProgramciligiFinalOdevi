using SchoolProject.Connection;
using SchoolProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolProject.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        ProjectForSchoolEntities db = new ProjectForSchoolEntities();
        [HttpGet]
        public ActionResult StudentList()
        {
            var Students = db.Ogrenci.ToList();

            StudentModels studentModel = new StudentModels()
            {
                Students = Students
            };
            
            return View(studentModel);
        }

        [HttpGet]
        public ActionResult AddStudent(string AdSoyad, string OgrenciNo, string Bolum)
        {
           
            return View();
        }

        [HttpPost]
        public ActionResult AddStudent(string AdSoyad, string OgrenciNo, string Bolum, DateTime DTarih)
        {
            Connection.Ogrenci addStudent = new Connection.Ogrenci();
            addStudent.AdSoyad = AdSoyad;
            addStudent.OgrenciNo = OgrenciNo;
            addStudent.Bolum = Bolum;
            addStudent.DTarih = DTarih;
            addStudent.KayitTarih = DateTime.Now;

            db.Ogrenci.Add(addStudent);
            db.SaveChanges();
            TempData["Status"] = "Öğrenci Kayıdı Başarılı";
            return View();
        }

        [HttpGet]
        public ActionResult RemoveStudent(int id)
        {
            if (id > 0)
            {
                var removeStudent = db.Ogrenci.FirstOrDefault(x => x.Id == id);
                db.Ogrenci.Remove(removeStudent);
                db.SaveChanges();
                TempData["Status"] = "Delete Successed";
                return RedirectToAction("StudentList", "Student");
            }
            else
            {
                TempData["Status"] = "Delete Failed";
                return RedirectToAction("StudentList", "Student");
            }
          
        }
        [HttpGet]
        public ActionResult UpdateStudent(int id = 0)
        {
            
            if (id < 1)
            {
                return RedirectToAction("StudentList", "Student");
            }
            var StudentQueery = db.Ogrenci.FirstOrDefault(x => x.Id == id);
            if (StudentQueery == null)
            {
                return RedirectToAction("StudentList", "Student");
            }
            StudentModels model = new StudentModels()
            {
                Student = StudentQueery
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult UpdateStudent(StudentModels model, int Id)
        {
            var updatestudent = db.Ogrenci.FirstOrDefault(x => x.Id == Id);
            updatestudent.AdSoyad = model.Student.AdSoyad;
            updatestudent.OgrenciNo = model.Student.OgrenciNo;
            updatestudent.Bolum = model.Student.Bolum;
            updatestudent.DTarih = Convert.ToDateTime(Request["DTarih"]);
            db.SaveChanges();
            return RedirectToAction("StudentList", "Student");
        }
    }
}