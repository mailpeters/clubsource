using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using System.Configuration;
using StrictlyClubs;


namespace StrictlyClubs
{
    public partial class LogonFrm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

            Globals.ClearAll();

        }


        private bool ValidateUser(string cuserName, string cpassWord)
        {

            bool lActive = false;
            int  nClientID = 0;
            bool lIsMatch = false;
            bool lIsSuperUser = false;
            int  nUserID = 0;

            // TODO get from a database
            bool lSalesRole     = false;
            bool lFrontDeskRole = false;
            bool lMemberRole    = false;
            bool lEmployeeRole  = false;
            bool lOfficeRole    = false;
            bool lSetupRole     = false;




            SqlConnection myConnection = new SqlConnection(Common.GetConnectionString());

            // Check for invalid userName.
            // userName must not be null and must be between 1 and 15 characters.
            if ((null == cuserName) || (0 == cuserName.Length) || (cuserName.Length > 15))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.");
                return false;
            }

            // Check for invalid passWord.
            // passWord must not be null and must be between 1 and 25 characters.
            if ((null == cpassWord) || (0 == cpassWord.Length) || (cpassWord.Length > 25))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.");
                return false;
            }

            try
            {

                using (myConnection)
                {

                    SqlCommand oCmd = new SqlCommand("sp_check_login", myConnection);
                    oCmd.CommandType = CommandType.StoredProcedure;

                    oCmd.Parameters.AddWithValue("@username", cuserName);
                    oCmd.Parameters.AddWithValue("@password", cpassWord);


                    myConnection.Open();

                    using (SqlDataReader oReader = oCmd.ExecuteReader())
                    {

                        // shoud only have 1 record
                        if (oReader.Read())
                        {
                            // if a record is returned, then there is a match
                            lIsMatch = true;

                            // todo get from a database
                            lSalesRole = true;
                            lFrontDeskRole = true;
                            lMemberRole = true;
                            lEmployeeRole = true;
                            lOfficeRole = true;
                            lSetupRole = true;

  
                            nUserID = (Int32)oReader["userID"];
                            nClientID = (Int32)oReader["clientID"];
                            lIsSuperUser = (Boolean)oReader["clubsuperuser"];


                            lActive = ((bool)oReader["active"]);
                            if (!lActive)
                            {
                                System.Diagnostics.Trace.WriteLine("[Userinactive] User not active.");
                                return false;
                            }

                        }
                        else
                        {
                            System.Diagnostics.Trace.WriteLine("[ValidateUser] no matching records.");
                            return false;
                        }

                        myConnection.Close();

                    }  // using

                }  // using


            }
            catch (Exception ex)
            {
                // Add error handling here for debugging.
                // This error message should not be sent back to the caller.
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Exception " + ex.Message);
            }


            if (lIsMatch)
            {
                Globals.nClientID = nClientID;

                Globals.CurrentUser.lIsSuperUser = lIsSuperUser;
                Globals.CurrentUser.nCurrentUser = nUserID;

                Globals.CurrentUser.lSalesRole = lSalesRole;
                Globals.CurrentUser.lFrontDeskRole = lFrontDeskRole;
                Globals.CurrentUser.lMemberRole = lMemberRole;
                Globals.CurrentUser.lEmployeeRole = lEmployeeRole;
                Globals.CurrentUser.lOfficeRole = lOfficeRole;
                Globals.CurrentUser.lSetupRole = lSetupRole;
            }

            // Compare lookupPassword and input passWord, using a case-sensitive comparison.
            // return (0 == string.Compare(lookupPassword, passWord, false));
            return lIsMatch;


        }



        protected void loginbtn_Click(object sender, EventArgs e)
        {

            if (ValidateUser(txtUserName.Value, txtUserPass.Value))
            {
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, txtUserName.Value, DateTime.Now,
          DateTime.Now.AddMinutes(30), chkPersistCookie.Checked, "your custom data");
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                if (chkPersistCookie.Checked)
                    ck.Expires = tkt.Expiration;
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);

                string strRedirect;
                strRedirect = Request["ReturnUrl"];
                if (strRedirect == null)
                    strRedirect = "default.aspx";

                Response.Redirect(strRedirect, true);
            }
            else
                Response.Redirect("logonFrm.aspx", true);

        }


        protected void forgotpass_Click(object sender, EventArgs e)
        {

        }


        protected void closelogonbtn_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

            Globals.ClearAll();

            Response.Redirect("default.aspx", true);
        }


    }
}