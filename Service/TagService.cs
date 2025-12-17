using pr15.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pr15.Service
{
    public class TagService
    {
        public readonly Pr15Context _db = DBService.Instance.Context;
        public static ObservableCollection<Tag> Users { get; set; } = new();
        public TagService()
        {
            GetAll();
        }
        public void Add(Tag user)
        {
            var _user = new Tag
            {
                Id = user.Id,
                Name = user.Name,

            };
            _db.Add<Tag>(_user);
            Commit();
            Users.Add(user);
            GetAll();
        }
        public int Commit() => _db.SaveChanges();
        public void GetAll()
        {
            var users = _db.Tags
.ToList();
            Users.Clear();
            foreach (var user in users)
            {
                Users.Add(user);
            }
        }
        public void Remove(Tag student)
        {
            _db.Remove<Tag>(student);
            if (Commit() > 0)
                if (Users.Contains(student))
                    Users.Remove(student);
        }
    }
}
