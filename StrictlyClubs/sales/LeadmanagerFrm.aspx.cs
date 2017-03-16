using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;



namespace StrictlyClubs.Lead
{
    public partial class LeadmanagerFrm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            // BindLeadGrid();


            if (!IsPostBack)
            {

                // BindUserGrid();
                BindLeadGrid();


            }


        }



        protected void BindLeadGrid()
        {

            DataTable dt;
            SqlConnection con = new SqlConnection(Common.GetConnectionString());

            try
            {
               

                SqlCommand cmd = new SqlCommand("sp_select_lead", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("ClientID", Globals.nClientID);
                cmd.Parameters.AddWithValue("SalespersonID", Globals.CurrentUser.nCurrentUser);
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adapter.Fill(ds);

                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                LeadGrid.DataSource = dt;
                LeadGrid.DataBind();

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                con.Close();
            }

        }



        protected void LeadGridRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("detail"))     // edit button
            {
                int index = Convert.ToInt32(e.CommandArgument);

                
                using (SqlConnection myConnection = new SqlConnection(Common.GetConnectionString()))
                {
                    string oString = "Select * from [lead] where leadID=@leadID";
                    SqlCommand oCmd = new SqlCommand(oString, myConnection);
                    oCmd.Parameters.AddWithValue("@leadID", (Int32)LeadGrid.DataKeys[index].Value );

                    myConnection.Open();
                    using (SqlDataReader oReader = oCmd.ExecuteReader())
                    {
                        while (oReader.Read())
                        {
                           // userfirstname.Value = oReader["FirstName"].ToString();
                            


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


        protected void InsertLead_Click(object sender, EventArgs e)
        {
   

            ClearDetail();



        }

        protected void ClearDetail()
        {

        }



    }
}