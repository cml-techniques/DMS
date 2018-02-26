using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMLTechQ.DMS
{
    public partial class dms : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncreate_Click(object sender, EventArgs e)
        {
          // string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
           string script = "javascript:alert('hh');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
           Page.ClientScript.RegisterStartupScript(this.GetType(),"key",script);

        }

        protected void rbtfolder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}