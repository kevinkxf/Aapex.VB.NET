Imports QSLib.Entities
Partial Class WebUserControls_EditUserProfile
    Inherits System.Web.UI.UserControl
    Private oPatient As Patients.PatientInfo
    Private strTitle As String = ""

    Public Property Title() As String
        Get
            Return Me.strTitle
        End Get
        Set(ByVal value As String)
            Me.strTitle = value
        End Set
    End Property

    Public Event OnUpdateClicked(ByVal oPatient As Patients.PatientInfo)

#Region "Properties"
    Public Property PatientDataSource() As Patients.PatientInfo
        Get
            Return Me.oPatient
        End Get
        Set(ByVal value As Patients.PatientInfo)
            Me.oPatient = value
        End Set
    End Property
#End Region

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

    Protected Sub validatorSex_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorSex.ServerValidate
        args.IsValid = Not (Me.ddlSex.SelectedValue = "")
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

    Protected Sub validatorCountry_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorCountry.ServerValidate
        Dim strCountry As String = Me.ddlCountry.SelectedValue
        If strCountry = "Other" Then
            args.IsValid = Not String.IsNullOrEmpty(Me.txtCountry.Text)
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oPatient Is Nothing Then
            Me.txtClinicName.Text = Me.oPatient.ClinicName
            Dim strPhone As String() = GetPhoneToArray(Me.oPatient.AltPhone)
            Me.txtAltPhone1.Text = strPhone(0)
            Me.txtAltPhone2.Text = strPhone(1)
            Me.txtAltPhone3.Text = strPhone(2)
            strPhone = GetPhoneToArray(Me.oPatient.HomePhone)
            Me.txtHomePhone1.Text = strPhone(0)
            Me.txtHomePhone2.Text = strPhone(1)
            Me.txtHomePhone3.Text = strPhone(2)
            strPhone = GetPhoneToArray(Me.oPatient.Fax)
            Me.txtFax1.Text = strPhone(0)
            Me.txtFax2.Text = strPhone(1)
            Me.txtFax3.Text = strPhone(2)

            Me.txtLicenseNo.Text = Me.oPatient.License
            Try
                Me.ddlLicenseState.SelectedValue = Me.oPatient.LicensureState
            Catch ex As Exception

            End Try

            Me.txtFirstName.Text = Me.oPatient.FirstName
            Me.txtLastName.Text = Me.oPatient.LastName
            Me.txtEmail.Text = Me.oPatient.Email
            If Me.oPatient.BirthDate > DateTime.MinValue Then
                Me.txtBirthDate.Text = String.Format("{0:d}", Me.oPatient.BirthDate)
            End If
            Try
                Me.ddlSex.SelectedValue = Me.oPatient.Sex
            Catch ex As Exception

            End Try

            Me.txtAddress.Text = Me.oPatient.ShippingAddress.Address
            Me.txtAddressOther.Text = Me.oPatient.ShippingAddress.AddressOther
            Me.txtCity.Text = Me.oPatient.ShippingAddress.City
            Try
                If Me.oPatient.ShippingAddress.Country = "US" Then
                    Me.ddlShippingState.SelectedValue = Me.oPatient.ShippingAddress.State
                ElseIf Me.oPatient.ShippingAddress.Country = "CA" Then
                    Me.ddlProvince.SelectedValue = Me.oPatient.ShippingAddress.State
                Else
                    Me.ddlCountry.SelectedValue = "Other"
                    Me.txtCountry.Text = Me.oPatient.ShippingAddress.Country
                    Me.txtOtherState.Text = Me.oPatient.ShippingAddress.State
                End If
            Catch ex As Exception

            End Try
            Me.txtPostalCode.Text = Me.oPatient.ShippingAddress.PostalCode
        End If
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSubmit.Click
        If My.User.IsAuthenticated Then
            Dim oPatient As Patients.PatientInfo = Patients.PatientController.GetPatientInfoByID(Session("PatientID"))
            oPatient.FirstName = Me.txtFirstName.Text
            oPatient.LastName = Me.txtLastName.Text
            oPatient.ClinicName = Me.txtClinicName.Text
            oPatient.HomePhone = GetPhone(Me.txtHomePhone1.Text, Me.txtHomePhone2.Text, Me.txtHomePhone3.Text)
            oPatient.AltPhone = GetPhone(Me.txtAltPhone1.Text, Me.txtAltPhone2.Text, Me.txtAltPhone3.Text)
            oPatient.Fax = GetPhone(Me.txtFax1.Text, Me.txtFax2.Text, Me.txtFax3.Text)
           
            oPatient.Email = Me.txtEmail.Text
            If Not DateTime.TryParse(Me.txtBirthDate.Text, oPatient.BirthDate) Then
                oPatient.BirthDate = DateTime.MinValue
            End If
            oPatient.Sex = Me.ddlSex.SelectedValue

            oPatient.ShippingAddress.Address = Me.txtAddress.Text
            oPatient.ShippingAddress.AddressOther = Me.txtAddressOther.Text
            oPatient.ShippingAddress.City = Me.txtCity.Text
            oPatient.ShippingAddress.PostalCode = Me.txtPostalCode.Text
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

            oPatient.PaymentAddress = oPatient.ShippingAddress

            oPatient.License = Me.txtLicenseNo.Text
            oPatient.LicensureState = Me.ddlLicenseState.SelectedValue
            RaiseEvent OnUpdateClicked(oPatient)
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

    Private Function GetPhoneToArray(ByVal strPhone As String) As String()
        Dim strResult As String() = {"", "", ""}
        Try
            strResult = strPhone.Split("-")
        Catch ex As Exception

        End Try
        Return strResult
    End Function
#End Region

   
    
    
End Class
