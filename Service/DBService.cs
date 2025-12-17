using pr15.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pr15.Service
{
    public class DBService
    {
        private Pr15Context context;
        public Pr15Context Context => context;
        private static DBService? instance;
        public static DBService Instance
        {
            get
            {
                if (instance == null)
                    instance = new DBService();
                return instance;
            }
        }
        private DBService()
        {
            context = new Pr15Context();
        }
    }
}