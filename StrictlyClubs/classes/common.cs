using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;


namespace StrictlyClubs
{ 

    public class Globals
    {
        //public static UserInfo CurrentUser;

        public static UserInfo CurrentUser = new UserInfo();

        public Globals()
        {           
            ClearAll();
        }

        public static void ClearAll()
        {
            _nClientID = 0;
            _nClubID = 0;
            _nBillingAddressID = 0;
            _nMailingAddressID = 0;
      

            CurrentUser.ClearUser();

        }

        static int _nMailingAddressID { get; set; }
  
        public static int nMailingAddressID
        {
            get
            {
                // Reads are usually simple
                return _nMailingAddressID;
            }
            set
            {
                // You can add logic here for race conditions,
                // or other measurements
                _nMailingAddressID = value;
            }
        }


        static int _nClubID { get; set; }
        public static int nClubID
        {
            get
            {
                // Reads are usually simple
                return _nClubID;
            }
            set
            {
                // You can add logic here for race conditions,
                // or other measurements
                _nClubID = value;
            }
        }

        static int _nBillingAddressID { get; set; }
        public static int nBillingAddressID
        {
            get
            {
                // Reads are usually simple
                return _nBillingAddressID;
            }
            set
            {
                // You can add logic here for race conditions,
                // or other measurements
                _nBillingAddressID = value;
            }
        }





        static int _nClientID { get; set; }
        public static int nClientID
        {
            get
            {
                // Reads are usually simple
                return _nClientID;
            }
            set
            {
                // You can add logic here for race conditions,
                // or other measurements
                _nClientID = value;
            }
        }


        
        
    }

}


public class Common
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



    public static string GetDataSource()
    {
        string connStr = "";

        // if you are running locally, use local database
        if (HttpContext.Current.Request.Url.Host.ToUpper() == "LOCALHOST")
        {
            connStr = "DEBUG";
        }
        else
        {
            connStr = "PRODUCTION";
        }



        return connStr;


    }

}

    
