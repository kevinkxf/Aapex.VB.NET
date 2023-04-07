
Partial Class ErrorPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim domException As Exception = Server.GetLastError.InnerException.GetBaseException
        Me.lblExceptionURL.Text = Request.Url.ToString
        Me.lblExceptionMethodName.Text = domException.TargetSite.Name
        Me.lblExceptionMessage.Text = domException.Message.Replace(ControlChars.Lf, " <br> ")
        Me.lblExceptionTrackMessage.Text = domException.StackTrace.Replace(ControlChars.CrLf, " <br> ")

    End Sub
End Class
