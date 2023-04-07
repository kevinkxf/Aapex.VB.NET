Imports QSLib.Entities
Imports QSLib.Providers.LogProvider
Partial Class WebUserControls_AddressList
    Inherits System.Web.UI.UserControl

    Private oAddresses As Patients.AddressCollection
    Private boolHideSelectButton As Boolean

    Public Event OnUseClicked(ByVal intID As Integer)
    Public Event OnDeleteClicked(ByVal intID As Integer)
    Public Event OnEditClicked(ByVal intID As Integer)

    Public Property HideSelectButton() As Boolean
        Get
            Return Me.boolHideSelectButton
        End Get
        Set(ByVal value As Boolean)
            Me.boolHideSelectButton = value
        End Set
    End Property

    Public Property AddressDataSource() As Patients.AddressCollection
        Get
            Return Me.oAddresses
        End Get
        Set(ByVal value As Patients.AddressCollection)
            Me.oAddresses = value
        End Set
    End Property

#Region "Event Handlers"

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oAddresses Is Nothing AndAlso Me.oAddresses.Count > 0 Then
            Me.rpAddressList.DataSource = Me.oAddresses
            Me.rpAddressList.DataBind()
            Me.mvAddressList.ActiveViewIndex = 0
        Else
            Me.mvAddressList.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub rpAddressList_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpAddressList.ItemCommand
        Dim intID As Integer = 0
        If Integer.TryParse(e.CommandArgument, intID) Then
            If e.CommandName = "Remove" Then
                RaiseEvent OnDeleteClicked(intID)
            ElseIf e.CommandName = "Use" Then
                RaiseEvent OnUseClicked(intID)
            ElseIf e.CommandName = "Edit" Then
                RaiseEvent OnEditClicked(intID)
            End If
        End If
        
    End Sub

    Protected Sub rpAddressList_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpAddressList.ItemDataBound
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Try
                Dim oAddress As Patients.AddressInfo = e.Item.DataItem
                CType(e.Item.FindControl("lblAddress"), Literal).Text = String.Format("{0} {1}, {2}, {3}, {4}, {5}", oAddress.Address, oAddress.AddressOther, oAddress.City, oAddress.State, oAddress.Country, oAddress.PostalCode)
                'CType(e.Item.FindControl("lblStreet1"), Label).Text = oAddress.Address
                'CType(e.Item.FindControl("lblStreet2"), Label).Text = oAddress.AddressOther
                'CType(e.Item.FindControl("lblCity"), Label).Text = oAddress.City
                'CType(e.Item.FindControl("lblState"), Label).Text = oAddress.State
                'CType(e.Item.FindControl("lblCountry"), Label).Text = oAddress.Country
                'CType(e.Item.FindControl("lblPostalCode"), Label).Text = oAddress.PostalCode
                Dim oButton As LinkButton
                oButton = CType(e.Item.FindControl("linkSelect"), LinkButton)
                oButton.CommandName = "Use"
                oButton.CommandArgument = oAddress.ID
                oButton.Visible = Not HideSelectButton

                oButton = CType(e.Item.FindControl("linkEdit"), LinkButton)
                oButton.CommandName = "Edit"
                oButton.CommandArgument = oAddress.ID

                oButton = CType(e.Item.FindControl("linkDelete"), LinkButton)
                oButton.CommandName = "Remove"
                oButton.CommandArgument = oAddress.ID
            Catch ex As Exception
                e.Item.Visible = False
                LoggerManager.LogError("AddressList.ascx||" & ex.Message)
            End Try
        End If
    End Sub
#End Region


End Class
