
Partial Class WebUserControls_DrugDisclaimer
    Inherits System.Web.UI.UserControl

    Public Property ActiveViewIndex() As Integer
        Get
            Return Me.mvDrugMessage.ActiveViewIndex
        End Get
        Set(ByVal value As Integer)
            Me.mvDrugMessage.ActiveViewIndex = value
        End Set
    End Property

End Class
