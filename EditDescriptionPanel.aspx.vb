Imports QSLib.Entities
Partial Class EditDescriptionPanel
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim strDrugname As String = Me.txtSKUID.Text
            Drugs.DrugDescriptionController.AddDrugDescription(strDrugname, Me.oEditor.Value, Me.txtFileName.Text, Me.oUploadFile.FileBytes, Me.txtVendor.Text)
            'Dim oDrugs As Drugs.DrugCollection = Drugs.DrugController.GetDrugInfoByName(Common.WebSetting.Setting.AffiliateID, strDrugname, False)
            'For Each oDrug As Drugs.DrugInfo In oDrugs
            '    Try
            '        Drugs.DrugDescriptionController.DeleteDrugDescription(oDrug.ID)
            '        Drugs.DrugDescriptionController.AddDrugDescription(oDrug.ID, Me.oEditor.Value, Me.txtFileName.Text, Me.oUploadFile.FileBytes, Me.txtVendor.Text)
            '    Catch ex As Exception

            '    End Try
            'Next

        Catch ex As Exception

        End Try
    End Sub
End Class
