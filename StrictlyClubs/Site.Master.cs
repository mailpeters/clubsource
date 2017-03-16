using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StrictlyClubs;
using System.Web.SessionState;


namespace StrictlyClubs
{
    public partial class Site : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            databaselbl.Text = Common.GetDataSource();
            // Session["newclientid"] = -1;


                frontdeskmenu.Visible = Globals.CurrentUser.lFrontDeskRole;
                salesmenu.Visible = Globals.CurrentUser.lSalesRole;
                membermenu.Visible = Globals.CurrentUser.lMemberRole;
                employeemenu.Visible = Globals.CurrentUser.lEmployeeRole;
                officemenu.Visible = Globals.CurrentUser.lOfficeRole;
                maintmenu.Visible = Globals.CurrentUser.lSetupRole;
            

        }
    }
}