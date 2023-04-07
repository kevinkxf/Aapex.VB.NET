
Partial Class WebUserControls_DrugRecommendation
    Inherits System.Web.UI.UserControl

    Private strDrugs As String()

    Public Property Drugs() As String()
        Get
            Return Me.strDrugs
        End Get
        Set(ByVal value As String())
            Me.strDrugs = value
        End Set
    End Property

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.Drugs Is Nothing AndAlso Me.Drugs.Length > 0 Then
            For Each p As String In Me.Drugs
                Me.blDrugs.Items.Add(New ListItem(p, String.Format("~/{0}_Detail.html", p)))
            Next
        End If
    End Sub
End Class
