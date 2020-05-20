using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using ProjectASP_JoaoMauricio.DataAccess;

namespace ProjectASP_JoaoMauricio.Models
{
    public class House
    {
        public int HouseID { get; set; }
        public string Region { get; set; }
        public string City { get; set; }
        public double Price { get; set; }
        public int Rooms { get; set; }
        public int Bathrooms { get; set; }
        public int Garage { get; set; }
        public int Pool { get; set; }
        public int Fireplace { get; set; }
        public string Image { get; set; }

        public List<House> GetAllHouse()
        {
            return HouseDB.GetAllHouse();
        }


        public DataTable ReadHouse()
        {
            return HouseDB.ReadHouse();
        }
        public bool SaveHouse(House hou)
        {
            return HouseDB.SaveHouse(hou);
        }

        public void DeleteHouse(int id)
        {
            HouseDB.DeleteHouse(id);
        }
       
        public House FindHouse(int id)
        {
            return HouseDB.FindHouse(id);
        }

        public List <House> FindPicture(House hou)
        {
            return HouseDB.FindPicture(hou);
        }

        public bool UpdateHouse(House house)
        {
            return HouseDB.UpdateHouse(house);
        }

       public House MaxIdHouse()
        {
            return HouseDB.MaxIdHouse();
        }

    }
}