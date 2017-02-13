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

namespace StrictlyClubs
{
    public partial class FeedbackFrm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {

            // save feedback to the database
            SqlConnection conn = null;

            try
            {
                SqlCommand cmd;

                conn = new SqlConnection(classes.common.GetConnectionString());
              

                conn.Open();
                cmd = new SqlCommand("sp_insert_feedback", conn);
                cmd.CommandType = CommandType.StoredProcedure;
       
                cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = Request.Form["first_name"];
                cmd.Parameters.Add("@lastname ", SqlDbType.VarChar).Value = Request.Form["last_name"];
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = Request.Form["email"];
                cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = Request.Form["phone"];
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = Request.Form["address"];
                cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = Request.Form["city"];
                cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = Request.Form["state"];
                cmd.Parameters.Add("@zipcode", SqlDbType.VarChar).Value = Request.Form["zip"];
                cmd.Parameters.Add("@website", SqlDbType.VarChar).Value = Request.Form["website"];

                if (Request.Form["hosting"] == "YES")
                    cmd.Parameters.Add("@hosting", SqlDbType.Bit).Value = 1;
                else
                  cmd.Parameters.Add("@hosting", SqlDbType.Bit).Value = 1;

                cmd.Parameters.Add("@notes", SqlDbType.VarChar).Value = Request.Form["comment"];

     
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