
Partial Class WebUserControls_LoginStatus
    Inherits System.Web.UI.UserControl

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If My.User.IsAuthenticated Then
            Me.mvLoginStatus.ActiveViewIndex = 1
            Me.lblUsername.Text = "Welcome " & My.User.Name & "!"
        Else
            Me.mvLoginStatus.ActiveViewIndex = 0
        End If
    End Sub
End Class
