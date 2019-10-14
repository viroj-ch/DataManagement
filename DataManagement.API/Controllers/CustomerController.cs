﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DataManagement.Entities;
using DataManagement.Repository.Interfaces;

namespace DataManagement.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        IRepository<Customer> _customerRepository;
        public CustomerController(IRepository<Customer> customerRepository)
        {
            _customerRepository = customerRepository;
        }
        [HttpGet]
        public IEnumerable<Customer> Get()
        {
            return _customerRepository.Get();
        }
        [HttpGet("{id}")]
        public Customer Get(int id)
        {
            return _customerRepository.Get(id);
        }
        [HttpPost]
        public void Post([FromBody] Customer customer)
        {
            _customerRepository.Add(customer);
        }
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Customer customer)
        {
            _customerRepository.Update(customer);
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            _customerRepository.Delete(id);
        }
    }
}