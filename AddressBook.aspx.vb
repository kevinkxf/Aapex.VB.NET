Imports QSLib.Entities

Partial Class AddressBook
    Inherits System.Web.UI.Page

#Region "Event Handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If My.User.IsAuthenticated Then
            BindAddressList()
        End If
    End Sub

    Protected Sub oAddressForm_OnAddAddressClicked(ByVal oAddress As QSLib.Entities.Patients.AddressInfo) Handles oAddressForm.OnAddAddressClicked
        Try
            If My.User.IsAuthenticated Then
                oAddress.PatientID = Session("PatientID")
                Dim strID As String = ViewState("EditAddressID")
                Dim intID As Integer
                If Not Integer.TryParse(strID, intID) Then
                    If Patients.AddressController.AddAddress(oAddress) Then
                        'BindAddressList()
                    End If
                Else
                    If Patients.AddressController.UpdateAddressByID(intID, oAddress) Then
                        ViewState.Remove("EditAddressID")
                        'BindAddressList()
                    End If
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub oAddressList_OnDeleteClicked(ByVal intID As Integer) Handles oAddressList.OnDeleteClicked
        If Patients.AddressController.DeleteAddressByID(intID) Then
            BindAddressList()
        End If
    End Sub

    Protected Sub oAddressList_OnEditClicked(ByVal intID As Integer) Handles oAddressList.OnEditClicked
        ViewState.Add("EditAddressID", intID)
        Me.oAddressForm.EditForm = True
        Me.oAddressForm.AddressDataSource = Patients.AddressController.GetAddressByID(intID)
    End Sub
#End Region

#Region "Private Methods"
    Private Sub BindAddressList()
        Me.oAddressList.AddressDataSource = Patients.AddressController.GetAddressByPatientID(Session("PatientID"))
    End Sub
#End Region
End Class
