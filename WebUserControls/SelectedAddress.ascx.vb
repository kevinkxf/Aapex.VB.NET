Imports QSLib.Entities
Partial Class WebUserControls_SelectedAddress
    Inherits System.Web.UI.UserControl
    Private oAddress As Patients.AddressInfo
    Private strTitle As String
    Private boolHideButton As Boolean

    Public Event OnChangeClicked()

    Public Property HideButton() As Boolean
        Get
            Return Me.boolHideButton
        End Get
        Set(ByVal value As Boolean)
            Me.boolHideButton = value
        End Set
    End Property

    Public Property Title() As String
        Get
            Return Me.strTitle
        End Get
        Set(ByVal value As String)
            Me.strTitle = value
        End Set
    End Property

    Public Property AddressDataSource() As Patients.AddressInfo
        Get
            Return Me.oAddress
        End Get
        Set(ByVal value As Patients.AddressInfo)
            Me.oAddress = value
        End Set
    End Property

#Region "Event handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oAddress Is Nothing Then
            Me.lblTitle.Text = Me.strTitle
            Me.lblCity.Text = Me.oAddress.City & ", " & Me.oAddress.State
            Me.lblCountry.Text = Me.oAddress.Country & ", " & Me.oAddress.PostalCode
            'Me.lblPostalCode.Text = Me.oAddress.PostalCode
            'Me.lblState.Text = Me.oAddress.State
            Me.lblStreet1.Text = Me.oAddress.Address & " " & Me.oAddress.AddressOther
            'Me.lblStreet2.Text = Me.oAddress.AddressOther
        End If
        Me.trButton.Visible = Not Me.boolHideButton
        Me.trLink.Visible = Me.boolHideButton
        Me.linkChange.Text = "Change " & Me.Title
    End Sub

    Protected Sub btnChange_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnChange.Click
        RaiseEvent OnChangeClicked()
    End Sub


    Protected Sub linkChange_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkChange.Click
        RaiseEvent OnChangeClicked()
    End Sub
#End Region
End Class
