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
    public class AccountsController : ApiController
    {
        private SchoolManagementSystem_SE1405Context db = new SchoolManagementSystem_SE1405Context();

        // GET: api/Accounts
        public IQueryable<Account> GetAccounts()
        {
            return db.Accounts.Include(b => b.Role).Include(b=>b.Status).Include(b => b.AccountInfo);
        }

        // GET: api/Accounts/5
        [Route("api/accounts/login")]
        [ResponseType(typeof(Account))]
        public async Task<IHttpActionResult> GetAccount(Account user)
        {
            Account account = await db.Accounts.Include(a => a.Status).Include(a => a.Role)
                .Include(a => a.AccountInfo)
                .FirstOrDefaultAsync(a => a.Id == user.Id && a.Password == user.Password);
            if (account == null || account.Status.StatusName == "DEACTIVE")
            {
                return NotFound();
            }

            account.Password = null;

            return Ok(account);
        }

        [HttpPut]
        [Route("api/accounts/{id}/deactivate")]
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> DeactivateAccount(String id)
        {
            var account = await db.Accounts.FindAsync(id);

            if (account != null)
            {
                account.StatusId = 2;
                await db.SaveChangesAsync();
            }
            else
            {
                return NotFound();
            }
            return StatusCode(HttpStatusCode.NoContent);
        }

        // PUT: api/Accounts/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAccount(string id, Account account)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != account.Id)
            {
                return BadRequest();
            }

            db.Entry(account).State = EntityState.Modified;
            db.Entry(account.AccountInfo).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AccountExists(id))
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

        // POST: api/Accounts
        [ResponseType(typeof(Account))]
        public async Task<IHttpActionResult> PostAccount(Account account)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Accounts.Add(account);
            db.AccountInfoes.Add(account.AccountInfo);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (AccountExists(account.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = account.Id }, account);
        }

        // DELETE: api/Accounts/5
        [ResponseType(typeof(Account))]
        public async Task<IHttpActionResult> DeleteAccount(string id)
        {
            Account account = await db.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }

            db.Accounts.Remove(account);
            await db.SaveChangesAsync();

            return Ok(account);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AccountExists(string id)
        {
            return db.Accounts.Count(e => e.Id == id) > 0;
        }
    }
}