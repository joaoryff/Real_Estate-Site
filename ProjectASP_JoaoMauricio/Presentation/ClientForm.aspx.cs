using ProjectASP_JoaoMauricio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectASP_JoaoMauricio.Presentation;

namespace ProjectASP_JoaoMauricio.Presentation
{
    public partial class ClientForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           //House house = new House();
           // var lst = house.GetAllHouse();
           // DropDownListPrice = house.Region.ToString();
           // GridView1.DataSource = dt;
           // GridView1.DataBind();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            House hou = new House();
            List<House> houList = new List<House>();

            hou.Region = DropDownListRegion.SelectedItem.Text;
            hou.City = DropDownListCity.SelectedItem.Text;
            hou.Price = Convert.ToDouble(DropDownListPrice.SelectedItem.Text);
            hou.Rooms = Convert.ToInt32(DropDownListRooms.SelectedItem.Text);
            hou.Bathrooms = Convert.ToInt32(DropDownListBathroom.SelectedItem.Text);

            if (RadioButtonGarageYes.Checked)
            {
                hou.Garage = 1;
            }
            else { hou.Garage = 0; }

            

            if (RadioButtonPollYes.Checked)
            {
                hou.Pool = 1;
            }
            else { hou.Pool = 0; }


            ////hou.Pool = Convert.ToInt32(DropDownPool.SelectedItem.Text);

            if (RadioButtonFirePlaceYes.Checked)
            {
                hou.Fireplace = 1;
            }
            else { hou.Fireplace = 0; }
            ////  hou.Fireplace = Convert.ToInt32(DropDownFireplace.SelectedItem.Text);

            ////hou.Fireplace = Convert.ToInt32(DropDownFireplace.SelectedItem.Text);

            ////if(FileUpload1.HasFile)
            ////{
            ////hou.Image = System.IO.Path.GetExtension(FileUpload1.FileName);


            //hou.Image = Server.MapPath("Images\\");

            ///////////////////////////////////////////////



            //int id = Convert.ToInt32(DropTest.Text.Trim());
            //hiddenField1.Value = id.ToString();
            //House hou= new House();
            houList = hou.FindPicture(hou);

            
            

            if (houList != null)
            {
                
                //StatusLbl.Text = "House found!";
                GridView1.DataSource = houList;
                GridView1.DataBind();


               // houseimage1.Src = hou.Image;
            }

            else
            {

                StatusLbl.Text = "House is not found!";

            }







           // int id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            //House hou = new House();
           // hou = hou.FindHouse(id);

           
           // houseimage1.DataBind();





        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            DropDownListRegion.SelectedItem.Text = "All";
            DropDownListCity.SelectedItem.Text = "All";
            DropDownListPrice.SelectedItem.Text = "99999999.99";
            DropDownListRooms.SelectedItem.Text = "0";
            DropDownListBathroom.SelectedItem.Text = "0";
            RadioButtonGarageNo.Checked=true;
            RadioButtonPollNo.Checked = true;
            RadioButtonFirePlaceNo.Checked=true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ViewBtn_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            House hou = new House();
            hou = hou.FindHouse(id);

            //houseimage1.Src = hou.Image;
            //houseimage1.DataBind();
        }
    }
}