
Partial Class WebUserControls_CreditCardLogos
    Inherits System.Web.UI.UserControl

    Public Property ShowStockText() As Boolean
        Get
            Return Me.tdStock.Visible
        End Get
        Set(ByVal value As Boolean)
            Me.tdStock.Visible = value
        End Set
    End Property

    Public Property ShowProductGuaranteeButton() As Boolean
        Get
            Return Me.linkCert.Visible
        End Get
        Set(ByVal value As Boolean)
            Me.linkCert.Visible = value
        End Set
    End Property

    Public Property ShowMcAfeeSeal() As Boolean
        Get
            Return Me.oSeal.Visible
        End Get
        Set(ByVal value As Boolean)
            Me.oSeal.Visible = value
        End Set
    End Property

    Public Property ShowGeoTrust() As Boolean
        Get
            Return Me.image4.Visible
        End Get
        Set(ByVal value As Boolean)
            Me.image4.Visible = value
        End Set
    End Property

End Class
