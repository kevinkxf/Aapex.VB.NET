
Partial Class WebUserControls_TopBanner
    Inherits System.Web.UI.UserControl

    Public Sub ChangeBanner(ByVal intIndex As Integer)
        Me.mvBanner.ActiveViewIndex = intIndex
    End Sub

End Class
