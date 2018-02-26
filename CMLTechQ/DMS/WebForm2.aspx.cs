using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMLTechQ.DMS
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (Session["closestatus"].ToString() == "5")
            {
                //Timer1.Enabled = false;
                ScriptManager.RegisterStartupScript(this, typeof(string), "onclose", "onclose();", true);
                

            }

        }
    }
}