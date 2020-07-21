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
    public class AccountInfoesController : ApiController
    {
        private SchoolManagementSystem_SE1405Context db = new SchoolManagementSystem_SE1405Context();

        // GET: api/AccountInfoes
        public IQueryable<AccountInfo> GetAccountInfoes()
        {
            return db.AccountInfoes;
        }

        // GET: api/AccountInfoes/5
        [ResponseType(typeof(AccountInfo))]
        public async Task<IHttpActionResult> GetAccountInfo(string id)
        {
            AccountInfo accountInfo = await db.AccountInfoes.FindAsync(id);
            if (accountInfo == null)
            {
                return NotFound();
            }

            return Ok(accountInfo);
        }

        // PUT: api/AccountInfoes/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAccountInfo(string id, AccountInfo accountInfo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != accountInfo.Id)
            {
                return BadRequest();
            }

            db.Entry(accountInfo).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AccountInfoExists(id))
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

        // POST: api/AccountInfoes
        [ResponseType(typeof(AccountInfo))]
        public async Task<IHttpActionResult> PostAccountInfo(AccountInfo accountInfo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.AccountInfoes.Add(accountInfo);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (AccountInfoExists(accountInfo.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = accountInfo.Id }, accountInfo);
        }

        // DELETE: api/AccountInfoes/5
        [ResponseType(typeof(AccountInfo))]
        public async Task<IHttpActionResult> DeleteAccountInfo(string id)
        {
            AccountInfo accountInfo = await db.AccountInfoes.FindAsync(id);
            if (accountInfo == null)
            {
                return NotFound();
            }

            db.AccountInfoes.Remove(accountInfo);
            await db.SaveChangesAsync();

            return Ok(accountInfo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AccountInfoExists(string id)
        {
            return db.AccountInfoes.Count(e => e.Id == id) > 0;
        }
    }
}