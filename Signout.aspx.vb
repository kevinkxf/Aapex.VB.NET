
Partial Class Signout
    Inherits System.Web.UI.Page

    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If My.User.IsAuthenticated Then
            FormsAuthentication.SignOut()
            'Redirect to Home page
            Response.Redirect("~/", True)
            Session.Clear()
            'Dim strReturn As String = Session("ReturnUrl")
            'If Not String.IsNullOrEmpty(strReturn) Then
            '    Response.Redirect(strReturn, True)
            'Else
            '    Response.Redirect("~/", True)
            'End If
            Return
        End If
        Response.Redirect("~/", True)
    End Sub
End Class
