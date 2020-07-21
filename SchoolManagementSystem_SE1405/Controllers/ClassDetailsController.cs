using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using SchoolManagementSystem_SE1405.Data;
using SchoolManagementSystem_SE1405.Models;

namespace SchoolManagementSystem_SE1405.Controllers
{
    public class ClassDetailsController : ApiController
    {
        private SchoolManagementSystem_SE1405Context db = new SchoolManagementSystem_SE1405Context();

        // GET: api/ClassDetails
        public IQueryable<ClassDetail> GetClassDetails()
        {
            return db.ClassDetails;
        }

        // GET: api/ClassDetails/5
        [ResponseType(typeof(ClassDetail))]
        public async Task<IHttpActionResult> GetClassDetail(string id)
        {
            ClassDetail classDetail = await db.ClassDetails.FindAsync(id);
            if (classDetail == null)
            {
                return NotFound();
            }

            return Ok(classDetail);
        }

        // PUT: api/ClassDetails/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutClassDetail(string id, ClassDetail classDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != classDetail.AccountId)
            {
                return BadRequest();
            }

            db.Entry(classDetail).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClassDetailExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ClassDetails
        [ResponseType(typeof(ClassDetail))]
        public async Task<IHttpActionResult> PostClassDetail(ClassDetail classDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ClassDetails.Add(classDetail);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ClassDetailExists(classDetail.AccountId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = classDetail.AccountId }, classDetail);
        }

        // DELETE: api/ClassDetails/5
        [ResponseType(typeof(ClassDetail))]
        public async Task<IHttpActionResult> DeleteClassDetail(string id)
        {
            ClassDetail classDetail = await db.ClassDetails.FindAsync(id);
            if (classDetail == null)
            {
                return NotFound();
            }

            db.ClassDetails.Remove(classDetail);
            await db.SaveChangesAsync();

            return Ok(classDetail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ClassDetailExists(string id)
        {
            return db.ClassDetails.Count(e => e.AccountId == id) > 0;
        }
    }
}