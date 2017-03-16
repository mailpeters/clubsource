using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public struct UserInfo
{

    private int _nCurrentUser;
    private bool _lIsSuperUser;

    // user roles
    private bool _lSalesRole;
    private bool _lFrontDeskRole;
    private bool _lMemberRole;
    private bool _lEmployeeRole;
    private bool _lOfficeRole;
    private bool _lSetupRole;

    public void ClearUser()
    {

        _lIsSuperUser = false;
        _nCurrentUser = 0;

        _lEmployeeRole = false;
        _lFrontDeskRole = false;
        _lMemberRole = false;
        _lOfficeRole = false;
        _lSalesRole = false;
        _lSetupRole = false;

    }

    public bool lIsSuperUser
    {
        get
        {
            return _lIsSuperUser;
        }
        set
        {
            _lIsSuperUser = value;
        }

    }


    public int  nCurrentUser
    {
        get
        {
            return _nCurrentUser;
        }
        set
        {
            _nCurrentUser = value;
        }

    }


    public bool lSalesRole
    {
        get
        {
            return _lSalesRole;
        }
        set
        {
            _lSalesRole = value;
        }

    }


    public bool lFrontDeskRole
    {
        get
        {
            return _lFrontDeskRole;
        }
        set
        {
            _lFrontDeskRole = value;
        }

    }



    public bool lMemberRole
    {
        get
        {
            return _lMemberRole;
        }
        set
        {
            _lMemberRole = value;
        }

    }



    public bool lEmployeeRole
    {
        get
        {
            return _lEmployeeRole;
        }
        set
        {
            _lEmployeeRole = value;
        }

    }

    public bool lOfficeRole
    {
        get
        {
            return _lOfficeRole;
        }
        set
        {
            _lOfficeRole = value;
        }

    }


    public bool lSetupRole
    {
        get
        {
            return _lSetupRole;
        }
        set
        {
            _lSetupRole = value;
        }

    }


}



