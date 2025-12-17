using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using pr15.Models;
namespace pr15.Service
{
    public class ProductService
    {
        private readonly Pr15Context _db = DBService.Instance.Context;
        public ObservableCollection<Product> Users { get; set; } = new();
        public ProductService()
        {
            GetAll();
        }
        public void Add(Product user)
        {
            var _user = new Product
            {
                Id = user.Id,
                Name = user.Name,
                Description = user.Description,
                Price = user.Price,
                Stock = user.Stock,
                CreatedAt = user.CreatedAt,
                Rating = user.Rating,
                CategoryId = user.CategoryId,
                BrandId = user.BrandId,
                Brand=user.Brand,
                Category=user.Category,
                Tags= user.Tags,
            };
            _db.Add<Product>(_user);
            Commit();
            Users.Add(user);
        }
        public int Commit() => _db.SaveChanges();
        public void GetAll()
        {
            var users = _db.Products.Include(s => s.Category)
.Include(s => s.Brand).Include(d=>d.Tags)
.ToList();
            Users.Clear();
            foreach (var user in users)
            {
                
                Users.Add(user);
                
            }
        }
        public void Remove(Product student)
        {
            _db.Remove<Product>(student);
            if (Commit() > 0)
                if (Users.Contains(student))
                    Users.Remove(student);
        }
        
    }
}
