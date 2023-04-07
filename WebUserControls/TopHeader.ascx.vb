
Partial Class WebUserControls_TopHeader
    Inherits System.Web.UI.UserControl

    Protected Sub btnHeaderSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnHeaderSearch.Click
        'Response.Redirect("~/searchdrug.aspx?drugname=" & Me.txtSearchDrug.Text)
        Response.Redirect("~/Search_" & Server.UrlEncode(Me.txtSearchDrug.Text) & "_Detail.html")
    End Sub

    ''For URL Rewriter. Remove thr querry string, so the rewriter won't add them twice
    'Protected Sub oLoginStatus_LoggedOut(ByVal sender As Object, ByVal e As System.EventArgs) Handles oLoginStatus.LoggedOut
    '    Dim strReturn As String = Request.RawUrl
    '    Response.Redirect(strReturn, True)
    'End Sub

    
End Class
