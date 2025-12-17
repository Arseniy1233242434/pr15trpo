using Microsoft.EntityFrameworkCore;
using pr15.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pr15.Service
{
    public class CategoryService
    {
        private readonly Pr15Context _db = DBService.Instance.Context;
        public static ObservableCollection<Category> Users { get; set; } = new();
        public CategoryService()
        {
            GetAll();
        }
        public void Add(Category user)
        {
            var _user = new Category
            {
                Id = user.Id,
                Name = user.Name,
                
            };
            _db.Add<Category>(_user);
            Commit();
            Users.Add(user);
            GetAll();
        }
        public int Commit() => _db.SaveChanges();
        public void GetAll()
        {
            var users = _db.Categories
.ToList();
            Users.Clear();
            foreach (var user in users)
            {
                Users.Add(user);
            }
        }
        public void Remove(Category student)
        {
            _db.Remove<Category>(student);
            if (Commit() > 0)
                if (Users.Contains(student))
                    Users.Remove(student);
        }
    }
}
