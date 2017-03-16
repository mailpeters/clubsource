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
using System.Web.SessionState;
using StrictlyClubs;



using System.Collections;

using System.Collections.Specialized;



namespace StrictlyClubs.Club
{
    public partial class ClubWizard : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(Common.GetConnectionString());
        //  SqlDataSource userdatasrc = new SqlDataSource();

        

        protected void Page_Load(object sender, EventArgs e)
        {
            Wizard1.PreRender += new EventHandler(Wizard1_PreRender);

            if (!IsPostBack)
            {
            
                Globals.nMailingAddressID = 0;
                Globals.nBillingAddressID = 0;
                Globals.nClientID = 0;
                Globals.nClubID = 0;


                BindContactMethod();
                BindClientType();
                BindUserGrid();

            }


        }

        protected void Wizard1_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizard1.WizardSteps;
            SideBarList.DataBind();
        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }
            int stepIndex = Wizard1.WizardSteps.IndexOf(step);

            if (stepIndex < Wizard1.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizard1.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            Globals.nClientID = -1;
            Globals.CurrentUser.nCurrentUser = -1;

            Globals.nMailingAddressID = 0;
            Globals.nBillingAddressID = 0;

            Response.Redirect("/default.aspx");
        }

        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
       
            // save feedback to the database


            int nCurrentStep = Wizard1.ActiveStepIndex;

            if (nCurrentStep == 0)   // save and continue from page 1 should insert or update the basic client info
            {

                if (Globals.nClientID == 0)  // you are inserting
                {
          
                    try
                    {
                        SqlCommand cmd;

                       // conn = new SqlConnection(common.GetConnectionString());


                        conn.Open();
                        cmd = new SqlCommand("sp_insert_client", conn);

                        cmd.CommandType = CommandType.StoredProcedure;


                        // Create output parameter 
                        SqlParameter insertIDparam = new SqlParameter("@insertID", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };                
                        cmd.Parameters.Add(insertIDparam);

                        // normal parameters
                        cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = firstname.Value;
                        cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = lastname.Value;
                        cmd.Parameters.Add("@companyname", SqlDbType.VarChar).Value = companyname.Value;
                        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email.Value;
                        cmd.Parameters.Add("@masterpassword", SqlDbType.VarChar).Value = password.Value;

                        cmd.Parameters.Add("@slogan", SqlDbType.VarChar).Value = slogan.Value;
                        cmd.Parameters.Add("@cellphone", SqlDbType.VarChar).Value = cellphone.Value;
                        cmd.Parameters.Add("@homephone", SqlDbType.VarChar).Value = homephone.Value;
                        cmd.Parameters.Add("@workphone", SqlDbType.VarChar).Value = workphone.Value;
                        cmd.Parameters.Add("@extension", SqlDbType.VarChar).Value = extension.Value;
                        cmd.Parameters.Add("@faxphone", SqlDbType.VarChar).Value = faxphone.Value;

                        // dont set these after the initial record creation

                        cmd.Parameters.Add("@contactmethodID", SqlDbType.Int).Value = contactmethod.SelectedValue;
                        cmd.Parameters.Add("@clienttypeID", SqlDbType.VarChar).Value = clienttypelist.SelectedValue;

                        cmd.ExecuteNonQuery();

                        Globals.nClientID =  (Int32)cmd.Parameters["@insertID"].Value;
                    }
                    finally
                    {
                        if (conn != null)
                        {
                            conn.Close();
                        }

                    }


                }  // inserting
                else
                {
                    // updating


                    try
                    {
                        SqlCommand cmd;

                      //  conn = new SqlConnection(common.GetConnectionString());


                        conn.Open();
                        cmd = new SqlCommand("sp_update_client", conn);

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@clientID", SqlDbType.Int).Value = Globals.nClientID;
                        cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = firstname.Value;
                        cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = lastname.Value;
                        cmd.Parameters.Add("@companyname", SqlDbType.VarChar).Value = companyname.Value;
                        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email.Value;
                        cmd.Parameters.Add("@masterpassword", SqlDbType.VarChar).Value = password.Value;

                        cmd.Parameters.Add("@slogan", SqlDbType.VarChar).Value = slogan.Value;
                        cmd.Parameters.Add("@cellphone", SqlDbType.VarChar).Value = cellphone.Value;
                        cmd.Parameters.Add("@homephone", SqlDbType.VarChar).Value = homephone.Value;
                        cmd.Parameters.Add("@workphone", SqlDbType.VarChar).Value = workphone.Value;
                        cmd.Parameters.Add("@extension", SqlDbType.VarChar).Value = extension.Value;
                        cmd.Parameters.Add("@faxphone", SqlDbType.VarChar).Value = faxphone.Value;
                        cmd.Parameters.Add("@contactmethodID", SqlDbType.Int).Value = contactmethod.SelectedValue;                        
                        cmd.Parameters.Add("@clienttypeID", SqlDbType.VarChar).Value = clienttypelist.SelectedValue;
                        
                        cmd.ExecuteScalar();


                    }
                    finally
                    {
                   

                        if (conn != null)
                        {
                            conn.Close();
                        }

                    }

                }



            }  // current page 0


            if (nCurrentStep == 1)   // address page
            {


                if (address1.Value.Length != 0)   // if a mailing address is filled in at all, need 
                {

                    if (Globals.nMailingAddressID == 0)    // is there a mailing address record?
                    {

                            try
                            {
                                SqlCommand cmd;

                                conn.Open();
                                cmd = new SqlCommand("sp_insert_address", conn);
                                cmd.CommandType = CommandType.StoredProcedure;


                                // Create output parameter 
                                SqlParameter insertIDparam = new SqlParameter("@insertID", SqlDbType.Int)
                                {
                                    Direction = ParameterDirection.Output
                                };

                                cmd.Parameters.Add(insertIDparam);

                                // normal parameters
                                cmd.Parameters.Add("@address1", SqlDbType.VarChar).Value = address1.Value;
                                cmd.Parameters.Add("@address2", SqlDbType.VarChar).Value = address2.Value;
                                cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = city.Value;
                                cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = DropDownListState.SelectedValue;
                                cmd.Parameters.Add("@ZIP", SqlDbType.VarChar).Value = zip.Value;

                                cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = Globals.nClientID;
                                cmd.Parameters.Add("@AddressType", SqlDbType.Char).Value = "M";

                                cmd.ExecuteNonQuery();

                                Globals.nMailingAddressID = (Int32)cmd.Parameters["@insertID"].Value;

                            }
                            finally
                            {


                                if (conn != null)
                                {
                                    conn.Close();
                                }

                            }



                    }
                    else     // updating an existing address
                    {
                        try
                        {
                            SqlCommand cmd;

                            conn.Open();
                            cmd = new SqlCommand("sp_update_address", conn);
                            cmd.CommandType = CommandType.StoredProcedure;

                            // normal parameters
                            cmd.Parameters.Add("@address1", SqlDbType.VarChar).Value = address1.Value;
                            cmd.Parameters.Add("@address2", SqlDbType.VarChar).Value = address2.Value;
                            cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = city.Value;
                            cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = DropDownListState.SelectedValue;
                            cmd.Parameters.Add("@ZIP", SqlDbType.VarChar).Value = zip.Value;
                            cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = Globals.nMailingAddressID;


                            cmd.ExecuteNonQuery();

        
                      
                        }
                        finally
                        {


                            if (conn != null)
                            {
                                conn.Close();
                            }

                        }

                    }
                    

                }




            }




            if (billaddress1.Value.Length != 0)   // if a bill address is filled in at all, need 
            {

                if (Globals.nBillingAddressID == 0)    // is there a bill address record?
                {

                    try
                    {
                        SqlCommand cmd;

                        conn.Open();
                        cmd = new SqlCommand("sp_insert_address", conn);
                        cmd.CommandType = CommandType.StoredProcedure;


                        // Create output parameter 
                        SqlParameter insertIDparam = new SqlParameter("@insertID", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };

                        cmd.Parameters.Add(insertIDparam);

                        // normal parameters
                        cmd.Parameters.Add("@address1", SqlDbType.VarChar).Value = billaddress1.Value;
                        cmd.Parameters.Add("@address2", SqlDbType.VarChar).Value = billaddress2.Value;
                        cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = billcity.Value;
                        cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = DropDownListState.SelectedValue;
                        cmd.Parameters.Add("@ZIP", SqlDbType.VarChar).Value = billzip.Value;

                        cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = Globals.nClientID;
                        cmd.Parameters.Add("@AddressType", SqlDbType.Char).Value = "B";

                        cmd.ExecuteNonQuery();

                        Globals.nBillingAddressID = (Int32)cmd.Parameters["@insertID"].Value;

                    }
                    finally
                    {


                        if (conn != null)
                        {
                            conn.Close();
                        }

                    }



                }
                else     // updating an existing address
                {
                    try
                    {
                        SqlCommand cmd;

                        conn.Open();
                        cmd = new SqlCommand("sp_update_address", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        // normal parameters
                        cmd.Parameters.Add("@address1", SqlDbType.VarChar).Value = billaddress1.Value;
                        cmd.Parameters.Add("@address2", SqlDbType.VarChar).Value = billaddress2.Value;
                        cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = billcity.Value;
                        cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = DropDownListBillState.SelectedValue;
                        cmd.Parameters.Add("@ZIP", SqlDbType.VarChar).Value = zip.Value;
                        cmd.Parameters.Add("@AddressID", SqlDbType.Int).Value = Globals.nBillingAddressID;
                        cmd.ExecuteNonQuery();

                    }
                    finally
                    {


                        if (conn != null)
                        {
                            conn.Close();
                        }

                    }

                }


            }


            if (nCurrentStep == 3)   // user edit page
            {


                if (Globals.nClubID == 0)  // you are inserting
                {

                    try
                    {
                        SqlCommand cmd;

                        // conn = new SqlConnection(common.GetConnectionString());


                        conn.Open();
                        cmd = new SqlCommand("sp_insert_club", conn);

                        cmd.CommandType = CommandType.StoredProcedure;


                        // Create output parameter 
                        SqlParameter insertIDparam = new SqlParameter("@insertID", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(insertIDparam);

                        // normal parameters
                        cmd.Parameters.Add("@clubname", SqlDbType.VarChar).Value = clubname.Value;
                        cmd.Parameters.Add("@managerfirstname", SqlDbType.VarChar).Value = managerfirst.Value;
                        cmd.Parameters.Add("@managerlastname", SqlDbType.VarChar).Value = managerlast.Value;
                        cmd.Parameters.Add("@active", SqlDbType.Bit).Value = 1;
                        cmd.Parameters.Add("@clubemail", SqlDbType.VarChar).Value = clubemail.Value;
                        cmd.Parameters.Add("@managerphone", SqlDbType.VarChar).Value = managerphone.Value;
                        cmd.Parameters.Add("@manageremail", SqlDbType.VarChar).Value = manageremail.Value;
                        cmd.Parameters.Add("@logofilelocation", SqlDbType.VarChar).Value = logofilelocation.Value;
                        cmd.Parameters.Add("@address1", SqlDbType.VarChar).Value = clubaddress1.Value;
                        cmd.Parameters.Add("@address2", SqlDbType.VarChar).Value = clubaddress2.Value;
                        cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = clubcity.Value;
                        cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = clubstateDDL.SelectedValue;
                        cmd.Parameters.Add("@ZIP", SqlDbType.VarChar).Value = clubzip.Value;

                        cmd.Parameters.Add("@ClientID", SqlDbType.VarChar).Value = Globals.nClientID;

            
                        cmd.ExecuteNonQuery();

                        Globals.nClubID = (Int32)cmd.Parameters["@insertID"].Value;

                    }
                    catch (SqlException ex)
                    {

                    }
                    finally
                    {
                       if (conn != null)
                        {
                            conn.Close();
                        }

                    }


                }  // inserting
                else
                {
                    // updating


                    try
                    {
                        SqlCommand cmd;

                        //  conn = new SqlConnection(common.GetConnectionString());


                        conn.Open();
                        cmd = new SqlCommand("sp_update_club", conn);

                        cmd.CommandType = CommandType.StoredProcedure;

                        // normal parameters
                        cmd.Parameters.Add("@clubname", SqlDbType.VarChar).Value = clubname.Value;
                        cmd.Parameters.Add("@managerfirstname", SqlDbType.VarChar).Value = managerfirst.Value;
                        cmd.Parameters.Add("@managerlastname", SqlDbType.VarChar).Value = managerlast.Value;
                        cmd.Parameters.Add("@active", SqlDbType.Bit).Value = 1;
                        cmd.Parameters.Add("@clubemail", SqlDbType.VarChar).Value = clubemail.Value;
                        cmd.Parameters.Add("@managerphone", SqlDbType.VarChar).Value = managerphone.Value;
                        cmd.Parameters.Add("@manageremail", SqlDbType.VarChar).Value = manageremail.Value;
                        cmd.Parameters.Add("@logofilelocation", SqlDbType.VarChar).Value = logofilelocation.Value;
                        cmd.Parameters.Add("@address1", SqlDbType.VarChar).Value = clubaddress1.Value;
                        cmd.Parameters.Add("@address2", SqlDbType.VarChar).Value = clubaddress2.Value;
                        cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = clubcity.Value;
                        cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = clubstateDDL.SelectedValue;
                        cmd.Parameters.Add("@ZIP", SqlDbType.VarChar).Value = clubzip.Value;

                        cmd.Parameters.Add("@clubID", SqlDbType.VarChar).Value = Globals.nClubID;

                        cmd.Parameters.Add("@isbadaddress", SqlDbType.Bit).Value = 0;

                        cmd.ExecuteScalar();


                    }
                    catch (SqlException ex)
                    {

                    }
                    finally
                    {


                        if (conn != null)
                        {
                            conn.Close();
                        }

                    }

                }


            }


        }




        protected void CopyAddressBtn_Click1(object sender, EventArgs e)
        {
            billaddress1.Value = address1.Value;
            billaddress2.Value = address2.Value;
            billcity.Value = city.Value;
            DropDownListBillState.SelectedValue = DropDownListState.SelectedValue;     
            billzip.Value = zip.Value;

        }




        protected void BindClientType()
        {
            DataSet ds = new DataSet();


            string cmdstr = "select clienttypeid, clienttype, isdefault from clienttype order by displayorder";


            SqlDataAdapter adp = new SqlDataAdapter(cmdstr, conn);

            adp.Fill(ds);

            clienttypelist.DataSource = ds;

            clienttypelist.DataTextField = "clienttype";

            clienttypelist.DataValueField = "clienttypeid";

            clienttypelist.DataBind();


            SqlCommand cmd;

            conn.Open();
            cmd = new SqlCommand("select clienttypeid from clienttype where isdefault = 1", conn);
            cmd.CommandType = CommandType.Text;
            clienttypelist.SelectedValue = cmd.ExecuteScalar().ToString();
            conn.Close();


        }


        protected void BindContactMethod()
        {
            DataSet ds = new DataSet();
            string cmdstr = "select contactmethodid, contactmethod, isdefault from contactmethod order by sortorder";
            SqlDataAdapter adp = new SqlDataAdapter(cmdstr, conn);
            adp.Fill(ds);

            contactmethod.DataSource = ds;
            contactmethod.DataTextField = "contactmethod";
            contactmethod.DataValueField = "contactmethodid";
            contactmethod.DataBind();


            SqlCommand cmd;

            conn.Open();
            cmd = new SqlCommand("select contactmethodid from contactmethod where isdefault = 1", conn);
            cmd.CommandType = CommandType.Text;
            contactmethod.SelectedValue = cmd.ExecuteScalar().ToString();

            conn.Close();

        }
        
        protected void BindUserGrid()
        {

            DataTable dt;

            try
            {
                SqlConnection con = new SqlConnection(Common.GetConnectionString());

                SqlCommand cmd = new SqlCommand("sp_select_userbyclientID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("ClientID", Globals.nClientID);

                conn.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                                
                DataSet ds = new DataSet();
                adapter.Fill(ds);

                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                UserGrid.DataSource = dt;
                UserGrid.DataBind();

            }
            catch (SqlException ex)
            {

            }

        }


        protected void btnSaveUser_Click(object sender, EventArgs e)
        {

            if (Globals.CurrentUser.nCurrentUser == 0)    // inserting
            {

                using (SqlConnection conn = new SqlConnection(Common.GetConnectionString()))
                {
                    SqlCommand cmd = new SqlCommand("sp_insert_user", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (cmd)
                    {

                        // Create output parameter 
                        SqlParameter insertIDparam = new SqlParameter("@insertID", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };

                        cmd.Parameters.Add(insertIDparam);


                        cmd.Parameters.AddWithValue("username", userusername.Value);
                        cmd.Parameters.AddWithValue("firstname", userfirstname.Value);
                        cmd.Parameters.AddWithValue("lastname", userlastname.Value);
                        cmd.Parameters.AddWithValue("initial", userlastname.Value);
                        cmd.Parameters.AddWithValue("email", useremail.Value);


                        if (usersuperuser.Checked)
                            cmd.Parameters.AddWithValue("clubsuperuser", 1);
                        else
                            cmd.Parameters.AddWithValue("clubsuperuser", 0);


                        cmd.Parameters.AddWithValue("SSN", userSSN.Value);
                        cmd.Parameters.AddWithValue("DLNumber", userDLNumber.Value);
                        cmd.Parameters.AddWithValue("DLState", userDLState.Value);
                        cmd.Parameters.AddWithValue("notes", usernotes.Value);
                        cmd.Parameters.AddWithValue("workphone", userworkphone.Value);
                        cmd.Parameters.AddWithValue("extension", userextension.Value);
                        cmd.Parameters.AddWithValue("cellphone", userlastname.Value);
                        cmd.Parameters.AddWithValue("faxphone", userfaxphone.Value);
                        cmd.Parameters.AddWithValue("homephone", userhomephone.Value);
                        cmd.Parameters.AddWithValue("clientID", Globals.nClientID);

                        if (useractive.Checked)
                            cmd.Parameters.AddWithValue("active", 1);
                        else
                            cmd.Parameters.AddWithValue("active", 0);


                        try
                        {
                            conn.Open();

                            cmd.ExecuteNonQuery();

                            Globals.CurrentUser.nCurrentUser = (Int32)cmd.Parameters["@insertID"].Value;

                        }
                        catch (SqlException ex)
                        {

                        }
                        finally
                        {
                            conn.Close();
                        }

                    }
                }
            }
            else   // updating
            {
                using (SqlConnection conn = new SqlConnection(Common.GetConnectionString()))
                {
                    SqlCommand cmd = new SqlCommand("sp_update_newuser", conn);
                    cmd.CommandType = CommandType.StoredProcedure;


                    using (cmd)
                    {

                        cmd.Parameters.AddWithValue("userID", Globals.CurrentUser.nCurrentUser);
                        cmd.Parameters.AddWithValue("username", userusername.Value);
                        cmd.Parameters.AddWithValue("firstname", userfirstname.Value);
                        cmd.Parameters.AddWithValue("lastname", userlastname.Value);
                        cmd.Parameters.AddWithValue("initial", userlastname.Value);
                        cmd.Parameters.AddWithValue("email", useremail.Value);

                        if (usersuperuser.Checked)
                            cmd.Parameters.AddWithValue("clubsuperuser", 1);
                        else
                            cmd.Parameters.AddWithValue("clubsuperuser", 0);

                        cmd.Parameters.AddWithValue("SSN", userSSN.Value);
                        cmd.Parameters.AddWithValue("DLNumber", userDLNumber.Value);
                        cmd.Parameters.AddWithValue("DLState", userDLState.Value);
                        cmd.Parameters.AddWithValue("notes", usernotes.Value);
                        cmd.Parameters.AddWithValue("workphone", userworkphone.Value);
                        cmd.Parameters.AddWithValue("extension", userextension.Value);
                        cmd.Parameters.AddWithValue("cellphone", userlastname.Value);
                        cmd.Parameters.AddWithValue("faxphone", userfaxphone.Value);
                        cmd.Parameters.AddWithValue("homephone", userhomephone.Value);

                        if (useractive.Checked)
                            cmd.Parameters.AddWithValue("active", 1);
                        else
                            cmd.Parameters.AddWithValue("active", 0);



                        try
                        {
                            conn.Open();

                            cmd.ExecuteNonQuery();


                        }
                        catch (SqlException ex)
                        {

                        }
                        finally
                        {
                            conn.Close();
                        }

                    }
                }
            }   // end of updating

            BindUserGrid();

        }


        protected void UserGridRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("detail"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Globals.CurrentUser.nCurrentUser = (Int32)UserGrid.DataKeys[index].Value;

                var con = Common.GetConnectionString();

                using (SqlConnection myConnection = new SqlConnection(con))
                {
                    string oString = "Select * from [user] where UserID=@UserID";
                    SqlCommand oCmd = new SqlCommand(oString, myConnection);
                    oCmd.Parameters.AddWithValue("@UserID", Globals.CurrentUser.nCurrentUser );

                    myConnection.Open();
                    using (SqlDataReader oReader = oCmd.ExecuteReader())
                    {
                        while (oReader.Read())
                        {
                            userfirstname.Value = oReader["FirstName"].ToString();
                            userlastname.Value = oReader["lastname"].ToString();
                            userinitial.Value = oReader["initial"].ToString();
                            userusername.Value = oReader["username"].ToString();


                            //                          userpassword.value = "";

                            useractive.Checked = (bool) oReader["active"];
                            usersuperuser.Checked = (bool) oReader["clubsuperuser"]; 

                            useremail.Value =  oReader["email"].ToString();
//                            useruseraddressID.Value = "";
 
                            userSSN.Value = oReader["ssn"].ToString();
                            userDLNumber.Value = oReader["dlnumber"].ToString();
                            userDLState.Value = oReader["dlstate"].ToString();
                            usernotes.Value = oReader["notes"].ToString();
//                            userpwexpiredate.Value = "";
                            userworkphone.Value  = oReader["workphone"].ToString();
                            userextension.Value  = oReader["extension"].ToString();
                            usercellphone.Value = oReader["cellphone"].ToString();
                            userfaxphone.Value = oReader["faxphone"].ToString();
                            userhomephone.Value = oReader["homephone"].ToString();

                        }

                        myConnection.Close();
                    }
                }

      
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModal2').modal('show');");
                sb.Append(@"</script>");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModalScript", sb.ToString(), false);

            }
            else
            if (e.CommandName.Equals("Insert"))
            {
                
            }       
            else
            if (e.CommandName.Equals("Delete"))
            {

            }
            else 
            if (e.CommandName.Equals("Cancel"))
            {
                // clear out  edit boxes

            }

        }



        protected void UserDetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {

        }//end of Event 


        protected void InsertUser_Click(object sender, EventArgs e)
        {
            Globals.CurrentUser.nCurrentUser = 0;

            userusername.Value = "";
            userfirstname.Value = "";
            userlastname.Value = "";
            userinitial.Value = "";
            //      useractive.Value = "";
            useractive.Checked = true;
            usersuperuser.Checked = false;
            

       //     userpassword.Value = "";
            useremail.Value = "";
//            useruseraddressID.Value = "";
  //          userclubsuperuser.Value = "";
            userSSN.Value = "";
            userDLNumber.Value = "";
            userDLState.Value = "";
            usernotes.Value = "";
            // userpwexpiredate.Value = "";
            userworkphone.Value = "";
            userextension.Value = "";
            usercellphone.Value = "";
            userfaxphone.Value = "";
            userhomephone.Value = "";

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#myModal2').modal('show');");
            sb.Append(@"</script>");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModalScript", sb.ToString(), false);

        }


    }
}



