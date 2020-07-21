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
    public class GradeDetailsController : ApiController
    {
        private SchoolManagementSystem_SE1405Context db = new SchoolManagementSystem_SE1405Context();

        // GET: api/GradeDetails
        public IQueryable<GradeDetail> GetGradeDetails()
        {
            return db.GradeDetails;
        }

        // GET: api/GradeDetails/5
        [ResponseType(typeof(GradeDetail))]
        public async Task<IHttpActionResult> GetGradeDetail(string id)
        {
            GradeDetail gradeDetail = await db.GradeDetails.FindAsync(id);
            if (gradeDetail == null)
            {
                return NotFound();
            }

            return Ok(gradeDetail);
        }

        // PUT: api/GradeDetails/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutGradeDetail(string id, GradeDetail gradeDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != gradeDetail.GradeId)
            {
                return BadRequest();
            }

            db.Entry(gradeDetail).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GradeDetailExists(id))
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

        // POST: api/GradeDetails
        [ResponseType(typeof(GradeDetail))]
        public async Task<IHttpActionResult> PostGradeDetail(GradeDetail gradeDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.GradeDetails.Add(gradeDetail);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (GradeDetailExists(gradeDetail.GradeId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = gradeDetail.GradeId }, gradeDetail);
        }

        // DELETE: api/GradeDetails/5
        [ResponseType(typeof(GradeDetail))]
        public async Task<IHttpActionResult> DeleteGradeDetail(string id)
        {
            GradeDetail gradeDetail = await db.GradeDetails.FindAsync(id);
            if (gradeDetail == null)
            {
                return NotFound();
            }

            db.GradeDetails.Remove(gradeDetail);
            await db.SaveChangesAsync();

            return Ok(gradeDetail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GradeDetailExists(string id)
        {
            return db.GradeDetails.Count(e => e.GradeId == id) > 0;
        }
    }
}