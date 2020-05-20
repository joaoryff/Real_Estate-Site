using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using ProjectASP_JoaoMauricio.Models;

namespace ProjectASP_JoaoMauricio.DataAccess
{
    public class LoginDB
    {
        public static string cn = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        public static UserLogin FindLogin(string user, string pass)
        {
            UserLogin log = new UserLogin();
            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from Login where Username ='" + user
                    + "' and Password ='"+ pass+"'";
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    log.UserID = Convert.ToInt32(reader["UserID"]);
                    log.Username = reader["Username"].ToString();
                    log.Password = reader["Password"].ToString();
                    log.LoginType = Convert.ToInt32(reader["LoginType"]);

                    if (log.LoginType == 1)
                    {
                        //open admin form
                    }
                    if (log.LoginType == 2)
                    {
                        // open client form
                    }
                    else
                    {
                        Console.WriteLine("Wrong user or password");
                    }
                }
                reader.Close();
            }
            return log;
        }


    }
}