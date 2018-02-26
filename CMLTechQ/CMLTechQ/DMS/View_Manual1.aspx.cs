using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMLTechQ.DMS
{
    public partial class View_Manual1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string _prm = Request.QueryString[0].ToString();
                myframe.Attributes.Add("src", "http://www.cmltechniques.com/Documents/" + _prm);
            }
        }
    }
}