using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectASP_JoaoMauricio.Models;

namespace ProjectASP_JoaoMauricio.Presentation
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void bttLogin_Click(object sender, EventArgs e)
        {
            string user = TxtUser.Text;
            string pass = TxtPass.Text;
            UserLogin userlogin = new UserLogin();
            userlogin = userlogin.FindLogin(user,pass);
            if (userlogin.LoginType == 1)
            {
                Response.Redirect("~/Presentation/AdminForm.aspx");
            }
            if (userlogin.LoginType == 2)
            {
                Response.Redirect("~/Presentation/ClientForm.aspx");
            }
            else
            {
                LabelWarning.Text = "No Admin or Client acc Found!";
            }

        }
    }
}