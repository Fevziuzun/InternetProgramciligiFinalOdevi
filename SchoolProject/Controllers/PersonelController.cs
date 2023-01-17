using SchoolProject.Connection;
using SchoolProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolProject.Controllers
{
    public class PersonelController : Controller
    {
        // GET: Personel
        ProjectForSchoolEntities db = new ProjectForSchoolEntities();
        [HttpGet]
        public ActionResult PersonelList()
        {
            var AllPersonels = db.Personel.ToList();

            PersonelModels PersonelList = new PersonelModels()
            {
                Personels = AllPersonels
            };
            return View(PersonelList);
        }

        [HttpGet]
        public ActionResult RemovePersonel(int id)
        {
            if (id > 0)
            {
                var removePersonel = db.Personel.FirstOrDefault(x => x.Id == id);
                db.Personel.Remove(removePersonel);
                db.SaveChanges();
                TempData["Status"] = "Delete Successed";
                return RedirectToAction("PersonelList", "Personel");
            }
            else
            {
                TempData["Status"] = "Delete Failed";
                return RedirectToAction("PersonelList", "Personel");
            }

        }

        [HttpGet]
        public ActionResult AddPersonel()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddPersonel(string AdSoyad, string Gorevi, string YonetimTip)
        {
            Personel addpersonel = new Personel();
            addpersonel.AdSoyad = AdSoyad;
            addpersonel.Gorevi = Gorevi;
            addpersonel.YonetimTip = YonetimTip;
            db.Personel.Add(addpersonel);
            db.SaveChanges();
            TempData["Status"] = "Personel Kayıdı Başarılı";
            return View();
        }

        [HttpGet]
        public ActionResult UpdatePersonel(int id = 0)
        {
            
            if (id < 1)
            {
                return RedirectToAction("PersonelList", "Personel");
            }

            var PersonelQueery = db.Personel.FirstOrDefault(x => x.Id == id);

            if (PersonelQueery == null)
            {
                return RedirectToAction("StudentList", "Student");
            }

            PersonelModels model = new PersonelModels()
            {
                Personel = PersonelQueery
            };
            return View(model);
     
        }

        [HttpPost]
        public ActionResult UpdatePersonel(PersonelModels model, int id, string YonetimTip)
        {
            var updatepersonel = db.Personel.FirstOrDefault(x => x.Id == id);
            updatepersonel.AdSoyad = model.Personel.AdSoyad;
            updatepersonel.Gorevi = model.Personel.Gorevi;
            updatepersonel.YonetimTip = YonetimTip;
            db.SaveChanges();
            return RedirectToAction("PersonelList", "Personel");
        }
    }
}