﻿using System;
using System.Collections.Generic;
using System.Web.Http;

namespace WebApi2WithoutMVC.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        public IEnumerable<string> Get()
        {
            return new string[] {$"Guid 1: {Guid.NewGuid()}", $"Guid 2: {Guid.NewGuid()}" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
