using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace StrictlyClubs.classes
{
    public class common
    {


        public static string GetConnectionString()
        {
            string connStr = "";

                // if you are running locally, use local database
                if (HttpContext.Current.Request.Url.Host.ToUpper() == "LOCALHOST")
                {
                    connStr = ConfigurationManager.ConnectionStrings["debug_strictlyclubsConnectionString"].ToString();
                }
                else
                {
                    connStr = ConfigurationManager.ConnectionStrings["prod_strictlyclubsConnectionString"].ToString();
                }

            

            return connStr;


        }

    }
}