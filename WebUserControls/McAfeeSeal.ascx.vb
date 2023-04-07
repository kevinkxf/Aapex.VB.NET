
Partial Class WebUserControls_McAfeeSeal
    Inherits System.Web.UI.UserControl

    Public Property ActiveViewIndex() As Integer
        Get
            Return Me.mvSeal.ActiveViewIndex
        End Get
        Set(ByVal value As Integer)
            Me.mvSeal.ActiveViewIndex = value
        End Set
    End Property

End Class
