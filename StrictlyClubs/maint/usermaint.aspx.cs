using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace StrictlyClubs.maint
{
    public partial class usermaint : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(Common.GetConnectionString());

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                BindUserGrid();

                // BindUserGrid();

            }


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
            finally
            {
                conn.Close();
            }
        }






        protected void UserGridRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("detail"))     // edit button
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Globals.CurrentUser.nCurrentUser = (Int32)UserGrid.DataKeys[index].Value;

                var con = Common.GetConnectionString();

                using (SqlConnection myConnection = new SqlConnection(con))
                {
                    string oString = "Select * from [user] where UserID=@UserID";
                    SqlCommand oCmd = new SqlCommand(oString, myConnection);
                    oCmd.Parameters.AddWithValue("@UserID", Globals.CurrentUser.nCurrentUser);

                    myConnection.Open();
                    using (SqlDataReader oReader = oCmd.ExecuteReader())
                    {
                        while (oReader.Read())
                        {
                            userfirstname.Value = oReader["FirstName"].ToString();
                            userlastname.Value = oReader["lastname"].ToString();
                            userinitial.Value = oReader["initial"].ToString();
                            userusername.Value = oReader["username"].ToString();


                            //   userpassword.value = "";

                            useractive.Checked = (bool)oReader["active"];
                            usersuperuser.Checked = (bool)oReader["clubsuperuser"];

                            useremail.Value = oReader["email"].ToString();
                            //    useruseraddressID.Value = "";

                            userSSN.Value = oReader["ssn"].ToString();
                            userDLNumber.Value = oReader["dlnumber"].ToString();
                            userDLState.Value = oReader["dlstate"].ToString();
                            usernotes.Value = oReader["notes"].ToString();
                            //      userpwexpiredate.Value = "";
                            userworkphone.Value = oReader["workphone"].ToString();
                            userextension.Value = oReader["extension"].ToString();
                            usercellphone.Value = oReader["cellphone"].ToString();
                            userfaxphone.Value = oReader["faxphone"].ToString();
                            userhomephone.Value = oReader["homephone"].ToString();

                        }

                        myConnection.Close();
                    }
                }


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
                ClearDetail();

            }

        }


        protected void ClearDetail()
        {
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

        }
        protected void InsertUser_Click(object sender, EventArgs e)
        {
            Globals.CurrentUser.nCurrentUser = 0;

            ClearDetail();


     
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
                SqlConnection conn = new SqlConnection(Common.GetConnectionString()) ;

                using (conn)
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

    }
}