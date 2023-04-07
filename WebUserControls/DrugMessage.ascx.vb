
Partial Class WebUserControls_DrugMessage
    Inherits System.Web.UI.UserControl

    Public Sub ChangeMessage(ByVal intIndex As Integer)
        Try
            Me.mvDrugMessage.ActiveViewIndex = intIndex
        Catch ex As Exception
            Me.mvDrugMessage.ActiveViewIndex = 0
        End Try
    End Sub

End Class
