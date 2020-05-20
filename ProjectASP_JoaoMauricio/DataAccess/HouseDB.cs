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
    public class HouseDB
    {
        public static string cn = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        public static DataTable ReadHouse()
        {

            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from House";
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                reader.Close();
                return dt;

            }
        }




        public static bool SaveHouse(House house)
        {
            bool result = true;
            try
            {
                using (SqlConnection con = new SqlConnection(cn))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = string.Format("insert into House (Region, City , Price, Rooms, Bathrooms, Garage, Pool, Fireplace, Image) values('{0}','{1}',{2},{3},{4},{5},{6},{7},'{8}')", house.Region, house.City, house.Price, house.Rooms,house.Bathrooms,house.Garage,house.Pool,house.Fireplace,house.Image);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                result = false;
                // throw;
            }
            return result;

        }

        public static List<House> GetAllHouse()
        {
            List<House> lstHouse = new List<House>();

            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from House";
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    House house = new House();

                    house.HouseID = Convert.ToInt32(reader["HouseID"]);
                    house.Region = reader["Region"].ToString();
                    house.City = reader["City"].ToString();
                    house.Price = Convert.ToInt64(reader["Price"]);
                    house.Rooms = Convert.ToInt32(reader["Rooms"]);
                    house.Bathrooms = Convert.ToInt32(reader["Bathrooms"]);
                    house.Garage = Convert.ToInt32(reader["Garage"]);
                    house.Pool = Convert.ToInt32(reader["Garage"]);
                    house.Fireplace = Convert.ToInt32(reader["Fireplace"]);
                    house.Image = reader["Image"].ToString();
                 
                    lstHouse.Add(house);

                }
                reader.Close();
            }
            return lstHouse;
        }
        public static void DeleteHouse(int id)
        {
            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "delete from House where HouseID=" + id;
                con.Open();
                cmd.ExecuteNonQuery();
            }

        }

        public static House FindHouse(int id)
        {
            House house = new House();
            using (SqlConnection connDB = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connDB;
                cmd.CommandText = "select * from House where HouseID= " + id;
                connDB.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    house.HouseID = Convert.ToInt32(reader["HouseID"]);
                    house.Region = reader["Region"].ToString();
                    house.City = reader["City"].ToString();
                    house.Price = Convert.ToDouble(reader["Price"]);
                    house.Rooms = Convert.ToInt32(reader["Rooms"]);
                    house.Bathrooms = Convert.ToInt32(reader["Bathrooms"]);
                    house.Garage = Convert.ToInt32(reader["Garage"]);
                    house.Pool = Convert.ToInt32(reader["Garage"]);
                    house.Fireplace = Convert.ToInt32(reader["Fireplace"]);
                    house.Image = reader["Image"].ToString();

                }
                reader.Close();

            }
            return house;
        }

        public static bool UpdateHouse(House house)
        {


            bool result = true;
            try
            {
                using (SqlConnection con = new SqlConnection(cn))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    //cmd.CommandText = string.Format("insert into customer (FirstName , LastName, Age , Email,City,Gender) values('{0}','{1}','{2}','{3}','{4}','{5}')", customer.FirstName, customer.LastName, customer.Age, customer.Email, customer.City, customer.Gender);

                    cmd.CommandText = string.Format("Update House set Region='{0}', City='{1}',Price={2},Rooms={3},Bathrooms={4},Garage={5},Pool={6},Fireplace={7},Image='{8}' where HouseID ={9}", house.Region, house.City, house.Price, house.Rooms, house.Bathrooms,house.Garage,house.Pool,house.Fireplace,house.Image,house.HouseID);




                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                result = false;
                // throw;
            }
            return result;

        }

        public static List <House> FindPicture(House hou)
        {
            List<House> houList = new List<House>();

            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                string queryRegion, queryCity, queryGarage, queryPool, queryFire;

                if (hou.Region == "All")
                {
                    queryRegion = " ";
                }
                else { queryRegion = " and Region = '"+hou.Region+"' "; }

                if (hou.City == "All")
                {
                    queryCity = " ";
                }
                else { queryCity = " and City = '"+hou.City+"' "; }

                if (hou.Garage == 0)
                {
                    queryGarage = " ";
                }
                else { queryGarage = " and Garage = '"+hou.Garage+"' "; }

                if (hou.Pool == 0)
                {
                    queryPool = " ";
                }
                else { queryPool = " and Pool = '"+hou.Pool+"' "; }

                if (hou.Fireplace == 0)
                {
                    queryFire = " ";
                }
                else { queryFire = " and Fireplace = '"+hou.Fireplace+"' "; }


                cmd.CommandText = string.Format("select * from House where Price <=" + hou.Price
                 + " and Rooms >=" + hou.Rooms + " and Bathrooms >=" + hou.Bathrooms + " "+ queryRegion+ queryCity+ queryGarage+ queryPool+ queryFire);


                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();



                while (reader.Read())
                {
                    House house = new House();
                    house.HouseID = Convert.ToInt32(reader["HouseID"]);
                    house.Region = reader["Region"].ToString();
                    house.City = reader["City"].ToString();
                    house.Price = Convert.ToDouble(reader["Price"]);
                    house.Rooms = Convert.ToInt32(reader["Rooms"]);
                    house.Bathrooms = Convert.ToInt32(reader["Bathrooms"]);
                    house.Garage = Convert.ToInt32(reader["Garage"]);
                    house.Pool = Convert.ToInt32(reader["Pool"]);
                    house.Fireplace = Convert.ToInt32(reader["Fireplace"]);
                    house.Image = reader["Image"].ToString();
                    houList.Add(house);
                }
                reader.Close();
            }
            return houList;
        }


        public static House MaxIdHouse()
        {
            House house = new House();
            using (SqlConnection connDB = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connDB;
                cmd.CommandText = "SELECT *FROM House WHERE HouseID = (SELECT MAX(HouseID) FROM House)";
                connDB.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    house.HouseID = Convert.ToInt32(reader["HouseID"]);
                    house.Region = reader["Region"].ToString();
                    house.City = reader["City"].ToString();
                    house.Price = Convert.ToDouble(reader["Price"]);
                    house.Rooms = Convert.ToInt32(reader["Rooms"]);
                    house.Bathrooms = Convert.ToInt32(reader["Bathrooms"]);
                    house.Garage = Convert.ToInt32(reader["Garage"]);
                    house.Pool = Convert.ToInt32(reader["Garage"]);
                    house.Fireplace = Convert.ToInt32(reader["Fireplace"]);
                    house.Image = reader["Image"].ToString();

                }
                reader.Close();

            }
            return house;
        }




    }
}