<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
        Server.Transfer(Request.ApplicationPath & "/ErrMessage.aspx ")

    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
        If My.User.IsAuthenticated Then
            Dim strUsername As String = My.User.Name
            Dim oAcc As QSLib.Entities.Patients.PatientAccountInfo = QSLib.Entities.Patients.PatientAccountController.GetPatientAccountInfoByName(strUsername, Common.WebSetting.Setting.AffiliateID)
            If Not oAcc Is Nothing Then
                Session("PatientID") = oAcc.PatientID
            End If
        End If
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub

    Sub Application_PostRequestHandlerExecute(Sender as Object, e as EventArgs)
        Try
            Dim strU As String=Request .RawUrl
           ' If  Regex .IsMatch (Request .RawUrl ,"default.html\?a=1",RegexOptions.IgnoreCase ) then
            '    Dim c As New System .Web .HttpCookie ("Auth",1)
             '   Session("AuthForTest")=true
           '     Response .Redirect ("~/")
           ' ElseIf Session("AuthForTest") Then
           ' else
           '     Response .Redirect("error.htm")
           ' End If
        Catch ex As Exception 
        End Try
    End Sub
</script>