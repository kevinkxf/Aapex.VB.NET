
Partial Class WebUserControls_SearchBar
    Inherits System.Web.UI.UserControl

#Region "Event Handlers"
    Protected Sub btnSearchBar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSearchBar.Click
        'Response.Redirect("~/searchdrug.aspx?drugname=" & Me.txtSearchDrug.Text)
        Response.Redirect("~/Search_" & Server.UrlEncode(Me.txtSearchDrug.Text) & "_Detail.html")
    End Sub
#End Region

    
End Class
