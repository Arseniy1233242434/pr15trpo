using pr15.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pr15.Service
{
    public class BrandService
    {
        private readonly Pr15Context _db = DBService.Instance.Context;
        public static ObservableCollection<Brand> Users { get; set; } = new();
        public BrandService()
        {
            GetAll();
        }
        public void Add(Brand user)
        {
            var _user = new Brand
            {
                Id = user.Id,
                Name = user.Name,

            };
            _db.Add<Brand>(_user);
            Commit();
            Users.Add(user);
            GetAll();
        }
        public int Commit() => _db.SaveChanges();
        public void GetAll()
        {
            var users = _db.Brands
.ToList();
            Users.Clear();
            foreach (var user in users)
            {
                Users.Add(user);
            }
        }
        public void Remove(Brand student)
        {
            _db.Remove<Brand>(student);
            if (Commit() > 0)
                if (Users.Contains(student))
                    Users.Remove(student);
        }
    }
}
