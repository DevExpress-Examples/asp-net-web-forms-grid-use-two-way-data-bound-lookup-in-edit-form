<%@ Application Language="VB" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        DevExpress.Web.ASPxWebControl.CallbackError += Callback_Error;
    }
    protected void Callback_Error(object sender, EventArgs e)
    {
        var exception = HttpContext.Current.Server.GetLastError();

        if (exception is CallbackException)
        {
            DevExpress.Web.ASPxWebControl.SetCallbackErrorMessage(exception.Message);
        }
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
