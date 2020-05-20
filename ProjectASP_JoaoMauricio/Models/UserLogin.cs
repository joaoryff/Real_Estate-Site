using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using ProjectASP_JoaoMauricio.DataAccess;

namespace ProjectASP_JoaoMauricio.Models
{
    public class UserLogin
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int LoginType { get; set; }


        public UserLogin FindLogin(string user, string pass)
        {
            return LoginDB.FindLogin(user, pass);
        }

    }
}