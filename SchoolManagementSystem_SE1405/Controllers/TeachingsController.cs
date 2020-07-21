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
    public class TeachingsController : ApiController
    {
        private SchoolManagementSystem_SE1405Context db = new SchoolManagementSystem_SE1405Context();

        // GET: api/Teachings
        public IQueryable<Teaching> GetTeachings()
        {
            return db.Teachings;
        }

        // GET: api/Teachings/5
        [ResponseType(typeof(Teaching))]
        public async Task<IHttpActionResult> GetTeaching(string id)
        {
            Teaching teaching = await db.Teachings.FindAsync(id);
            if (teaching == null)
            {
                return NotFound();
            }

            return Ok(teaching);
        }

        // PUT: api/Teachings/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutTeaching(string id, Teaching teaching)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != teaching.AccountId)
            {
                return BadRequest();
            }

            db.Entry(teaching).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TeachingExists(id))
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

        // POST: api/Teachings
        [ResponseType(typeof(Teaching))]
        public async Task<IHttpActionResult> PostTeaching(Teaching teaching)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Teachings.Add(teaching);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TeachingExists(teaching.AccountId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = teaching.AccountId }, teaching);
        }

        // DELETE: api/Teachings/5
        [ResponseType(typeof(Teaching))]
        public async Task<IHttpActionResult> DeleteTeaching(string id)
        {
            Teaching teaching = await db.Teachings.FindAsync(id);
            if (teaching == null)
            {
                return NotFound();
            }

            db.Teachings.Remove(teaching);
            await db.SaveChangesAsync();

            return Ok(teaching);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TeachingExists(string id)
        {
            return db.Teachings.Count(e => e.AccountId == id) > 0;
        }
    }
}