
Partial Class WebUserControls_SideBarLogin
    Inherits System.Web.UI.UserControl

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If My.User.IsAuthenticated Then
            Me.linkLogin.NavigateUrl = "~/Signout.html"
            Me.linkLogin.Text = "Sign out"
        Else
            Me.linkLogin.NavigateUrl = "~/Signin.html"
            Me.linkLogin.Text = "Sign in or Register"
        End If
    End Sub
End Class
