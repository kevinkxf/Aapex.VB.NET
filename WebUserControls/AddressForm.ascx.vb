Imports QSLib.Entities
Partial Class WebUserControls_AddressForm
    Inherits System.Web.UI.UserControl
    Private strTitle As String
    Private oAddress As Patients.AddressInfo
    Private boolEditForm As Boolean

    Public Event OnAddAddressClicked(ByVal oAddress As Patients.AddressInfo)

    Public Property EditForm() As Boolean
        Get
            Return Me.boolEditForm
        End Get
        Set(ByVal value As Boolean)
            Me.boolEditForm = value
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

    Public Property Title() As String
        Get
            Return Me.strTitle
        End Get
        Set(ByVal value As String)
            Me.strTitle = value
        End Set
    End Property

#Region "Event Handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Me.lblTitle.Text = Me.strTitle
        If Not Me.AddressDataSource Is Nothing Then
            Me.txtCity.Text = Me.AddressDataSource.City
            Me.txtPostalCode.Text = Me.AddressDataSource.PostalCode
            Me.txtStreet1.Text = Me.AddressDataSource.Address
            Me.txtStreet2.Text = Me.AddressDataSource.AddressOther

            Try
                If Me.AddressDataSource.Country = "Other" Then
                    Me.ddlCountry.SelectedValue = "Other"
                    Me.txtCountry.Text = Me.AddressDataSource.Country
                Else
                    Me.ddlCountry.SelectedValue = Me.AddressDataSource.Country.ToUpper()
                    Me.txtCountry.Text = ""
                End If
                Me.ddlCountry.SelectedValue = Me.AddressDataSource.Country
                If Me.AddressDataSource.Country = "US" Then
                    Me.ddlState.SelectedValue = Me.oAddress.State
                Else
                    Me.ddlProvince.SelectedValue = Me.oAddress.State
                End If

            Catch ex As Exception

            End Try
        Else
            Me.txtCity.Text = ""
            Me.txtPostalCode.Text = ""
            Me.txtStreet1.Text = ""
            Me.txtStreet2.Text = ""
            Try
                Me.ddlState.SelectedValue = ""
            Catch ex As Exception

            End Try
        End If

        If Not Me.boolEditForm Then
            Me.btnSubmit.Visible = True
            Me.btnUpdate.Visible = False
        Else
            Me.btnUpdate.Visible = True
            Me.btnSubmit.Visible = False
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            Dim oAddress As New Patients.AddressInfo()
            If Me.ddlCountry.SelectedValue = "Other" Then
                oAddress.Country = Me.txtCountry.Text
            Else
                oAddress.Country = Me.ddlCountry.SelectedValue
            End If
            oAddress.Address = Me.txtStreet1.Text
            oAddress.AddressOther = Me.txtStreet2.Text
            If oAddress.Country = "US" Then
                oAddress.State = ddlState.SelectedValue
            ElseIf oAddress.Country = "CA" Then
                oAddress.State = ddlProvince.SelectedValue
            Else
                oAddress.State = Me.txtOtherState.Text
            End If
            oAddress.City = Me.txtCity.Text
            oAddress.PostalCode = Me.txtPostalCode.Text
            RaiseEvent OnAddAddressClicked(oAddress)
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdate.Click
        If Page.IsValid Then
            Dim oAddress As New Patients.AddressInfo()
            If Me.ddlCountry.SelectedValue = "Other" Then
                oAddress.Country = Me.txtCountry.Text
            Else
                oAddress.Country = Me.ddlCountry.SelectedValue
            End If
            oAddress.Address = Me.txtStreet1.Text
            oAddress.AddressOther = Me.txtStreet2.Text
            If oAddress.Country = "US" Then
                oAddress.State = ddlState.SelectedValue
            ElseIf oAddress.Country = "CA" Then
                oAddress.State = ddlProvince.SelectedValue
            Else
                oAddress.State = Me.txtOtherState.Text
            End If
            oAddress.City = Me.txtCity.Text
            oAddress.PostalCode = Me.txtPostalCode.Text
            RaiseEvent OnAddAddressClicked(oAddress)
        End If
    End Sub

    Protected Sub validatorState_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorState.ServerValidate
        If Me.ddlCountry.SelectedValue = "CA" Then
            args.IsValid = (Not Me.ddlProvince.SelectedValue = "")
        ElseIf Me.ddlCountry.SelectedValue = "US" Then
            args.IsValid = (Not Me.ddlState.SelectedValue = "")
        Else
            args.IsValid = (Not Me.txtCountry.Text = "")
        End If
    End Sub
#End Region
    
    Protected Sub validatorPostalCode_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorPostalCode.ServerValidate
        Dim strCountry As String = Me.ddlCountry.SelectedValue
        If strCountry = "CA" Then
            args.IsValid = Regex.IsMatch(args.Value, "^[ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]{1}\d{1}[A-Za-z]{1} *\d{1}[A-Za-z]{1}\d{1}$")
        ElseIf strCountry = "US" Then
            args.IsValid = Regex.IsMatch(args.Value, "^\d{5}([\-]\d{4})?$")
        Else
            args.IsValid = Not String.IsNullOrEmpty(args.Value)
        End If
    End Sub

    Protected Sub validatorCountry_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorCountry.ServerValidate
        Dim strCountry As String = Me.ddlCountry.SelectedValue
        If strCountry = "Other" Then
            args.IsValid = Not String.IsNullOrEmpty(Me.txtCountry.Text)
        Else
            args.IsValid = True
        End If
    End Sub
End Class
