Imports QSLib.Entities
Partial Class WebUserControls_UserProfileForm
    Inherits System.Web.UI.UserControl

    Private strTitle As String = ""

    Public Event OnRegisterClicked(ByVal strUsername As String, ByVal strPassword As String, ByVal oPatient As Patients.PatientInfo)

    Public Property Title() As String
        Get
            Return Me.strTitle
        End Get
        Set(ByVal value As String)
            Me.strTitle = value
        End Set
    End Property

#Region "Event Handlers"
    Protected Sub validatorAltPhone_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorAltPhone.ServerValidate
        If String.IsNullOrEmpty(Me.txtAltPhone1.Text) AndAlso String.IsNullOrEmpty(Me.txtAltPhone2.Text) AndAlso String.IsNullOrEmpty(Me.txtAltPhone3.Text) Then
            args.IsValid = True
        Else
            args.IsValid = HasNDigits(Me.txtAltPhone1.Text, 3) And HasNDigits(Me.txtAltPhone2.Text, 3) And HasNDigits(Me.txtAltPhone3.Text, 4)
        End If
    End Sub

    Protected Sub validatorFax_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorFax.ServerValidate
        If String.IsNullOrEmpty(Me.txtFax1.Text) AndAlso String.IsNullOrEmpty(Me.txtFax2.Text) AndAlso String.IsNullOrEmpty(Me.txtFax3.Text) Then
            args.IsValid = True
        Else
            args.IsValid = HasNDigits(Me.txtFax1.Text, 3) And HasNDigits(Me.txtFax2.Text, 3) And HasNDigits(Me.txtFax3.Text, 4)
        End If
    End Sub

    Protected Sub validatorLicenseState_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorLicenseState.ServerValidate
        args.IsValid = Not Me.ddlLicenseState.SelectedValue = ""
    End Sub

    Protected Sub validatorPassword2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorPassword2.ServerValidate
        args.IsValid = Me.txtPassword.Text = Me.txtPassword2.Text
    End Sub

    Protected Sub validatorShippingState_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorShippingState.ServerValidate
        If Me.ddlCountry.SelectedValue = "CA" Then
            args.IsValid = (Not Me.ddlProvince.SelectedValue = "")
        ElseIf Me.ddlCountry.SelectedValue = "US" Then
            args.IsValid = (Not Me.ddlShippingState.SelectedValue = "")
        Else
            args.IsValid = (Not Me.txtCountry.Text = "")
        End If
    End Sub

    Protected Sub validatorTelephone_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorTelephone.ServerValidate
        args.IsValid = HasNDigits(Me.txtHomePhone1.Text, 3) And HasNDigits(Me.txtHomePhone2.Text, 3) And HasNDigits(Me.txtHomePhone3.Text, 4)
    End Sub

    Protected Sub validatorUsername_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorUsername.ServerValidate
        args.IsValid = Not Patients.PatientAccountController.HasUsername(args.Value, Common.WebSetting.Setting.AffiliateID)
    End Sub

    Protected Sub validatorSex_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorSex.ServerValidate
        args.IsValid = Not (Me.ddlSex.SelectedValue = "")
    End Sub

    Protected Sub validatorCountry_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorCountry.ServerValidate
        Dim strCountry As String = Me.ddlCountry.SelectedValue
        If strCountry = "Other" Then
            args.IsValid = Not String.IsNullOrEmpty(Me.txtCountry.Text)
        Else
            args.IsValid = True
        End If
    End Sub

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

    Protected Sub validatorType_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorType.ServerValidate
        args.IsValid = Not (Me.ddlPractType.SelectedValue = "")
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSubmit.Click
        If Me.Page.IsValid Then
            Dim oPatient As New Patients.PatientInfo
            oPatient.FirstName = Me.txtFirstName.Text
            oPatient.LastName = Me.txtLastName.Text
            oPatient.BirthDate = DateTime.MinValue
            oPatient.ClinicName = Me.txtClinicName.Text
            oPatient.Consent = True
            'oPatient.ContactPerson = Me.txtContactPerson.Text
            oPatient.CustomerType = "PRACT"
            oPatient.Email = Me.txtEmail.Text
            oPatient.AgentID = Common.WebSetting.Setting.AgentID
            oPatient.License = Me.txtLicenseNo.Text
            oPatient.LicenseVerified = False
            oPatient.LicenseVerifiedBy = IIf(oPatient.LicenseVerified, Common.WebSetting.Setting.WebSiteName, "")
            oPatient.LicenseVerifiedFrom = ""
            oPatient.LicenseVerifiedWhen = IIf(oPatient.LicenseVerified, DateTime.Now, DateTime.Now)
            oPatient.LicensureState = Me.ddlLicenseState.SelectedValue
            oPatient.OrgID = Common.WebSetting.Setting.AffiliateID

            oPatient.PractType = IIf(ddlPractType.SelectedValue = "OTHER", ddlPractTypeValue.Text, ddlPractType.SelectedValue)
            oPatient.ShippingAddress = New Patients.AddressInfo
            oPatient.ShippingAddress.Address = Me.txtAddress.Text
            oPatient.ShippingAddress.AddressOther = Me.txtAddressOther.Text
            oPatient.ShippingAddress.City = Me.txtCity.Text
            If Me.ddlCountry.SelectedValue = "US" Then
                oPatient.ShippingAddress.State = Me.ddlShippingState.SelectedValue
                oPatient.ShippingAddress.Country = "US"
            ElseIf Me.ddlCountry.SelectedValue = "CA" Then
                oPatient.ShippingAddress.State = Me.ddlProvince.SelectedValue
                oPatient.ShippingAddress.Country = "CA"
            Else
                oPatient.ShippingAddress.State = Me.txtOtherState.Text
                oPatient.ShippingAddress.Country = txtCountry.Text
            End If
            oPatient.ShippingAddress.PostalCode = Me.txtPostalCode.Text
            oPatient.PaymentAddress = oPatient.ShippingAddress
            oPatient.HomePhone = GetPhone(Me.txtHomePhone1.Text, Me.txtHomePhone2.Text, Me.txtHomePhone3.Text)
            oPatient.AltPhone = GetPhone(Me.txtAltPhone1.Text, Me.txtAltPhone2.Text, Me.txtAltPhone3.Text)
            oPatient.Fax = GetPhone(Me.txtFax1.Text, Me.txtFax2.Text, Me.txtFax3.Text)
            oPatient.Sex = Me.ddlSex.SelectedValue
            oPatient.BirthDate = DateTime.Parse(Me.txtBirthDate.Text)
            RaiseEvent OnRegisterClicked(Me.txtUsername.Text, Me.txtPassword.Text, oPatient)
        End If
    End Sub
#End Region

#Region "Private Functions"
    Private Function HasNDigits(ByVal strInput As String, ByVal intCount As Integer) As Boolean
        Return Regex.IsMatch(strInput, "^[0-9]{" & intCount & "}")
    End Function

    Private Function GetPhone(ByVal strP1 As String, ByVal strP2 As String, ByVal strP3 As String) As String
        GetPhone = Nothing
        If Not String.IsNullOrEmpty(strP1) AndAlso Not String.IsNullOrEmpty(strP2) AndAlso Not String.IsNullOrEmpty(strP3) Then
            Dim sb As New Text.StringBuilder(strP1)
            sb.Append("-")
            sb.Append(strP2)
            sb.Append("-")
            sb.Append(strP3)
            GetPhone = sb.ToString()
            sb.Length = 0
        End If
    End Function
#End Region

    
   
End Class
