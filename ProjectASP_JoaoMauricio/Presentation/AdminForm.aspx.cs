using ProjectASP_JoaoMauricio.DataAccess;
using ProjectASP_JoaoMauricio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectASP_JoaoMauricio.Presentation
{
    public partial class AdminForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton1.Attributes.Add("onClick", "document.getElementById('" + FileUploadControl.ClientID + "').click();return false");
           
        }

        public void FillDrops()
        {
           Response.Redirect(Request.RawUrl);
            House house = new House();
           house = house.MaxIdHouse();
            DropDownID.Text = house.HouseID.ToString();

        }


        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string filename;
                House hou = new House();

                hou.Region = DropDownListRegion.SelectedItem.Text;
                hou.City = DropDownListCity.SelectedItem.Text;
                hou.Price = Convert.ToDouble(DropDownListPrice.SelectedItem.Text);
                hou.Rooms = Convert.ToInt32(DropDownListRooms.SelectedItem.Text);
                hou.Bathrooms = Convert.ToInt32(DropDownListBathroom.SelectedItem.Text);

                if (DropDownGarage.SelectedItem.Text == "Yes")
                {
                    hou.Garage = 1;
                }
                else { hou.Garage = 0; }



                if (DropDownPool.SelectedItem.Text == "Yes")
                {
                    hou.Pool = 1;
                }
                else { hou.Pool = 0; }


                //hou.Pool = Convert.ToInt32(DropDownPool.SelectedItem.Text);

                if (DropDownFireplace.SelectedItem.Text == "Yes")
                {
                    hou.Fireplace = 1;
                }
                else { hou.Fireplace = 0; }
                //  hou.Fireplace = Convert.ToInt32(DropDownFireplace.SelectedItem.Text);

                //hou.Fireplace = Convert.ToInt32(DropDownFireplace.SelectedItem.Text);

                //if(FileUpload1.HasFile)
                //{
                //hou.Image = System.IO.Path.GetExtension(FileUpload1.FileName);



                if (FileUploadControl.HasFile)
                {
                    string absolutePath;
                    filename = FileUploadControl.FileName;
                    FileUploadControl.SaveAs(Server.MapPath("./houseIMG/") + filename);
                    absolutePath = Server.MapPath("./houseIMG/") + filename;
                    string relativePath = absolutePath.Replace(HttpContext.Current.Server.MapPath("~/"), "~/").Replace(@"\", "/");
                    hou.Image = relativePath;
                }
                else
                {
                    hou.Image = "NoImage";
                }




                

                //FileUpload1.SaveAs(hou.Image + FileUpload1.FileName);
                //}

                //else { }
                
                if (hou.SaveHouse(hou))
                {
                    StatusLbl.Text = "Data saved";
                    StatusLbl.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    StatusLbl.ForeColor = System.Drawing.Color.Red;
                    StatusLbl.Text = "Data not saved";

                }
            }
            else
            {
                StatusLbl.Text = "Data was not saved";
                StatusLbl.ForeColor = System.Drawing.Color.Red;
            }
            Response.Redirect(Request.RawUrl);
            // FillDrops();


            //FillGridview();
        }

        protected void ButtonUpadate_Click(object sender, EventArgs e)
        {
            House house = new House();
            string filename;



            if (Page.IsValid)
            {
                house.HouseID = Convert.ToInt32(DropDownID.SelectedItem.Text);

                house.Region = DropDownListRegion.SelectedItem.Text;
                house.City = DropDownListCity.SelectedItem.Text;
                house.Price = Convert.ToDouble(DropDownListPrice.SelectedItem.Text);
                house.Rooms = Convert.ToInt32(DropDownListRooms.SelectedItem.Text);
                house.Bathrooms = Convert.ToInt32(DropDownListBathroom.SelectedItem.Text);

                if (DropDownGarage.SelectedItem.Text == "Yes")
                {
                    house.Garage = 1;
                }
                else { house.Garage = 0; }



                if (DropDownPool.SelectedItem.Text == "Yes")
                {
                    house.Pool = 1;
                }
                else { house.Pool = 0; }


                //hou.Pool = Convert.ToInt32(DropDownPool.SelectedItem.Text);

                if (DropDownFireplace.SelectedItem.Text == "Yes")
                {
                    house.Fireplace = 1;
                }
                else { house.Fireplace = 0; }


                //hou.Fireplace = Convert.ToInt32(DropDownFireplace.SelectedItem.Text);

                //if(FileUpload1.HasFile)
                //{
                //hou.Image = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (FileUploadControl.HasFile)
                {
                    string absolutePath;
                    filename = FileUploadControl.FileName;
                    FileUploadControl.SaveAs(Server.MapPath("./houseIMG/") + filename);
                    absolutePath = Server.MapPath("./houseIMG/") + filename;
                    string relativePath = absolutePath.Replace(HttpContext.Current.Server.MapPath("~/"), "~/").Replace(@"\", "/");
                    house.Image = relativePath;
                }
                else
                {
                    house.Image = "NoImage";
                }







                if (house.UpdateHouse(house))
                {
                    StatusLbl.Text = "Data update";
                    StatusLbl.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    StatusLbl.ForeColor = System.Drawing.Color.Red;
                    StatusLbl.Text = "Data not updated";

                }
            }
            else
            {
                StatusLbl.Text = "Data was not saved";
                StatusLbl.ForeColor = System.Drawing.Color.Red;
            }
            //FillGridview();
          
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            House hou = new House();
            // int customerId = Convert.ToInt32(hiddenField1.Value);
            hou.DeleteHouse(Convert.ToInt32(DropDownID.SelectedItem.Text));

           // FillGridview();

            //GridView1.DataSource = cust.ReadCustomer();
            // GridView1.DataBind();
            StatusLbl.Text = "Record deleted id: " + DropDownID.SelectedItem.Text;
            Response.Redirect(Request.RawUrl);
        }

        protected void DropDownID_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownListRegion.Items.Clear();
           // DropDownListCity.Items.Clear();
            House hou = new House();
            hou=hou.FindHouse(Convert.ToInt32(DropDownID.Text));
          
            DropDownListRegion.Text = hou.Region;           
            DropDownListCity.Text = hou.City;
            DropDownListPrice.Text = Convert.ToString(hou.Price);
            DropDownListRooms.Text = Convert.ToString(hou.Rooms);
            DropDownListBathroom.Text = Convert.ToString(hou.Bathrooms);

          if(hou.Garage==1)
            {
                DropDownGarage.SelectedItem.Text = "Yes";
            }
          else
            { DropDownGarage.SelectedItem.Text = "No"; }

            if (hou.Pool == 1)
            {
                DropDownPool.SelectedItem.Text = "Yes";
            }
            else
            { DropDownPool.SelectedItem.Text = "No"; }

            if (hou.Fireplace == 1)
            {
               DropDownFireplace.SelectedItem.Text = "Yes";
            }
            else
            { DropDownFireplace.SelectedItem.Text = "No"; }

            Image1.ImageUrl = hou.Image;
           
        }
    }
    }
 
