Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Xml.XPath
Imports QSLib.Common.Utilities

Namespace Common
    ''' <summary>
    ''' This class can handle the setting file
    ''' </summary>
    ''' <remarks></remarks>
    Public Class WebSetting
        ''' <summary>
        ''' Store the physical location of the setting file
        ''' </summary>
        ''' <remarks>Store the physical location of the setting file</remarks>
        Private _strXMLLocation As String = New String(HttpRuntime.AppDomainAppPath + "\\Setting\\setting.xml")

        ''' <summary>
        ''' Instanlize the Singleton
        ''' </summary>
        ''' <remarks>Instanlize the Singleton</remarks>
        Public Shared Setting As WebSetting = New WebSetting()

        ''' <summary>
        ''' Singileton constructor
        ''' </summary>
        ''' <remarks>Singileton constructor</remarks>
        Private Sub New()

        End Sub

#Region "Properties"
	Public ReadOnly Property VolumeDiscountEmail() As String
            Get
                Dim strKey As String = "VolumeDiscountEmail"
                Dim strAuthorizedPage As String = ""
                strAuthorizedPage = DataCache.GetCache(strKey)
                If String.IsNullOrEmpty(strAuthorizedPage) Then
                    Try
                        strAuthorizedPage = CType(WebSetting.Setting(strKey), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache(strKey, strAuthorizedPage, _strXMLLocation)
                End If
                Return strAuthorizedPage
            End Get
        End Property

        Public ReadOnly Property PartnershipEmail() As String
            Get
                Dim strKey As String = "PartnershipEmail"
                Dim strAuthorizedPage As String = ""
                strAuthorizedPage = DataCache.GetCache(strKey)
                If String.IsNullOrEmpty(strAuthorizedPage) Then
                    Try
                        strAuthorizedPage = CType(WebSetting.Setting(strKey), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache(strKey, strAuthorizedPage, _strXMLLocation)
                End If
                Return strAuthorizedPage
            End Get
        End Property

        Public ReadOnly Property SecurePage() As String
            Get
                Dim strKey As String = "SecurePage"
                Dim strAuthorizedPage As String = ""
                strAuthorizedPage = DataCache.GetCache(strKey)
                If String.IsNullOrEmpty(strAuthorizedPage) Then
                    Try
                        strAuthorizedPage = CType(WebSetting.Setting(strKey), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache(strKey, strAuthorizedPage, _strXMLLocation)
                End If
                Return strAuthorizedPage
            End Get
        End Property

        Public ReadOnly Property EnforceHTTPSForSecurePage() As Boolean
            Get
                Dim strKey As String = "EnforceHTTPSForSecurePage"
                If DataCache.GetCache(strKey) Is Nothing Then
                    Dim boolResult As Boolean
                    Try
                        boolResult = CType(WebSetting.Setting(strKey), Boolean)
                    Catch ex As Exception

                    End Try
                    DataCache.SetCache(strKey, boolResult, _strXMLLocation)
                End If
                Try
                    Return CType(DataCache.GetCache(strKey), Boolean)
                Catch ex As Exception
                    Return False
                End Try
            End Get
        End Property

        Public ReadOnly Property AffiliateID() As Integer
            Get
                Dim strAffiliateID As String = DataCache.GetCache("AffiliateID")
                Dim intAffiliateID As Integer = 0
                If String.IsNullOrEmpty(strAffiliateID) Then
                    Try
                        intAffiliateID = CType(WebSetting.Setting("AffiliateID"), Integer)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("AffiliateID", intAffiliateID, _strXMLLocation)
                End If
                Try
                    intAffiliateID = CType(strAffiliateID, Integer)
                Catch ex As Exception
                End Try
                Return intAffiliateID
            End Get
        End Property

        Public ReadOnly Property AuthorizedPage() As String
            Get
                Dim strAuthorizedPage As String = ""
                strAuthorizedPage = DataCache.GetCache("AuthorizedPage")
                If String.IsNullOrEmpty(strAuthorizedPage) Then
                    Try
                        strAuthorizedPage = CType(WebSetting.Setting("AuthorizedPage"), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("AuthorizedPage", strAuthorizedPage, _strXMLLocation)
                End If
                Return strAuthorizedPage
            End Get
        End Property

        Public ReadOnly Property AgentID() As String
            Get
                Dim strAgentID As String = ""
                strAgentID = DataCache.GetCache("AgentID")
                If String.IsNullOrEmpty(strAgentID) Then
                    Try
                        strAgentID = CType(WebSetting.Setting("AgentID"), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("AgentID", strAgentID, _strXMLLocation)
                End If
                Return strAgentID
            End Get
        End Property

        Public ReadOnly Property DefaultShippingFee() As Decimal
            Get
                Dim strDefaultShippingFee As String = DataCache.GetCache("DefaultShippingFee")
                Dim fDefaultShippingFee As Decimal = 0
                If String.IsNullOrEmpty(strDefaultShippingFee) Then
                    Try
                        fDefaultShippingFee = CType(WebSetting.Setting("DefaultShippingFee"), Decimal)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("DefaultShippingFee", fDefaultShippingFee, _strXMLLocation)
                Else
                    Try
                        fDefaultShippingFee = CType(strDefaultShippingFee, Decimal)
                    Catch ex As Exception
                    End Try
                End If
                Return fDefaultShippingFee
            End Get
        End Property

        Public ReadOnly Property TollFreeTel() As String
            Get
                Dim strTollFreeTel As String = ""
                strTollFreeTel = DataCache.GetCache("TollFreeTel")
                If String.IsNullOrEmpty(strTollFreeTel) Then
                    Try
                        strTollFreeTel = CType(WebSetting.Setting("TollFreeTel"), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("TollFreeTel", strTollFreeTel, _strXMLLocation)
                End If
                Return strTollFreeTel
            End Get
        End Property

        Public ReadOnly Property TollFreeFax() As String
            Get
                Dim strTollFreeFax As String = ""
                strTollFreeFax = DataCache.GetCache("TollFreeFax")
                If String.IsNullOrEmpty(strTollFreeFax) Then
                    Try
                        strTollFreeFax = CType(WebSetting.Setting("TollFreeFax"), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("TollFreeFax", strTollFreeFax, _strXMLLocation)
                End If
                Return strTollFreeFax
            End Get
        End Property

        Public ReadOnly Property CompanyName() As String
            Get
                Dim strCompanyName As String = ""
                strCompanyName = DataCache.GetCache("CompanyName")
                If String.IsNullOrEmpty(strCompanyName) Then
                    Try
                        strCompanyName = CType(WebSetting.Setting("CompanyFullName"), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("CompanyName", strCompanyName, _strXMLLocation)
                End If
                Return strCompanyName
            End Get
        End Property

        Public ReadOnly Property WebSiteName() As String
            Get
                Dim strWebSiteName As String = ""
                strWebSiteName = DataCache.GetCache("WebSiteName")
                If String.IsNullOrEmpty(strWebSiteName) Then
                    Try
                        strWebSiteName = CType(WebSetting.Setting("WebSiteName"), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("WebSiteName", strWebSiteName, _strXMLLocation)
                End If
                Return strWebSiteName
            End Get
        End Property

        Public ReadOnly Property ContactEmail() As String
            Get
                Dim strContactEmail As String = ""
                strContactEmail = DataCache.GetCache("ContactEmail")
                If String.IsNullOrEmpty(strContactEmail) Then
                    Try
                        strContactEmail = CType(WebSetting.Setting("ContactEmail"), String)
                    Catch ex As Exception
                    End Try
                    DataCache.SetCache("ContactEmail", strContactEmail, _strXMLLocation)
                End If
                Return strContactEmail
            End Get
        End Property
#End Region

        ''' <summary>
        ''' Test if the Setting file is in the declared location
        ''' </summary>
        ''' <returns>true, if it is accessible</returns>
        ''' <remarks>Test if the Setting file is in the declared location</remarks>
        Public Function Exists() As Boolean
            If DataCache.GetCache("WebSetting") Is Nothing Then
                If File.Exists(_strXMLLocation) Then
                    DataCache.SetCache("WebSetting", New XPathDocument(_strXMLLocation), _strXMLLocation)
                    Return True
                Else
                    Return False
                End If
            Else
                Return True
            End If

        End Function

        ''' <summary>
        ''' Return a single value for a input XPath
        ''' </summary>
        ''' <param name="xpath">xpath is the input XPath query</param>
        ''' <returns>
        ''' Nothing if XPath query is invalid, or the XML file in setting is not found.
        ''' Return all found values in a string aray
        ''' </returns>
        ''' <remarks></remarks>
        Private Function findSettings(ByVal xpath As String) As String()
            'Return nothing if singleton is broken
            If Setting Is Nothing Then
                Return Nothing
            End If

            Dim xnodes As XPathNodeIterator = Setting.getXPathNavigator().Select(xpath)
            'Return nothing if XPath query return nothing
            If xnodes.Count = 0 Then
                Return Nothing
            End If
            Dim result(xnodes.Count - 1) As String
            Dim i As Integer = 0
            While xnodes.MoveNext()
                result(i) = xnodes.Current.InnerXml
                i += 1
            End While
            Return result
        End Function

        Default Public ReadOnly Property Item(ByVal name As String) As String
            Get
                Dim r As String() = Me.findSettings("//" + name)
                If Not (r Is Nothing) Then
                    Return r(0)
                Else
                    Return ""
                End If
            End Get
        End Property

        'Return a XML document navigator based on given file
        Private Function getXPathNavigator() As XPathNavigator
            If Exists() Then
                Try
                    'Dim doc As XPathDocument = New XPathDocument(_strXMLLocation)
                    Dim doc As XPathDocument = CType(DataCache.GetCache("WebSetting"), XPathDocument)
                    Return doc.CreateNavigator
                Catch ex As Exception
                    'Process exceptions
                    Return Nothing
                Finally
                    'Do something 
                End Try
            Else
                Return Nothing
            End If
        End Function

        ''' <summary>
        ''' If this drug name is excluded
        ''' </summary>
        ''' <param name="name"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Function IsExcludeDrug(ByVal name As String, ByVal groupid As Integer) As Boolean
            Dim s As String() = Me.findSettings("//ExcludeDrugs/ExcludeDrug")
            If Not s Is Nothing Then
                For Each ss As String In s
                    If name.ToLower().Contains(ss.ToLower()) Then
                        Return True
                    End If
                Next
            End If

            Dim sid As String() = Me.findSettings("//ExcludeDrugs/ExcludeDrugGroupID")
            If Not sid Is Nothing Then
                For Each ss As String In sid
                    Try
                        If groupid = CType(ss, Integer) Then
                            Return True
                        End If
                    Catch ex As Exception
                        Return True
                    End Try
                Next

            End If
            Return False
        End Function


        ''' <summary>
        ''' Check if this Drug Group is a promotion Group
        ''' </summary>
        ''' <param name="groupID"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Function IsPromoDrugGroup(ByVal groupID As Integer) As Boolean
            If (groupID < 59 Or groupID > 67) And (groupID < 70 Or groupID > 80) Then
                Return False
            Else : Return True
            End If
        End Function

        Public Function IsBlockedFromUS(ByVal dname As String, ByVal groupid As Integer) As Boolean
            Dim s As String() = Me.findSettings("//ExcludeFromUSDrugs/ExcludeDrug")
            If Not s Is Nothing Then
                For Each ss As String In s
                    If dname.ToLower().Contains(ss.ToLower()) Then
                        Return True
                    End If
                Next
            End If

            Dim sid As String() = Me.findSettings("//ExcludeFromUSDrugs/ExcludeDrugGroupID")
            If Not sid Is Nothing Then
                For Each ss As String In sid
                    Try
                        If groupid = CType(ss, Integer) Then
                            Return True
                        End If
                    Catch ex As Exception
                        Return True
                    End Try
                Next

            End If
            Return False
        End Function

        Public Function IsBlockedFromCanada(ByVal dname As String, ByVal groupid As Integer) As Boolean
            Dim s As String() = Me.findSettings("//ExcludeFromCanadaDrugs/ExcludeDrug")
            If Not s Is Nothing Then
                For Each ss As String In s
                    If dname.ToLower().Contains(ss.ToLower()) Then
                        Return True
                    End If
                Next
            End If

            Dim sid As String() = Me.findSettings("//ExcludeFromCanadaDrugs/ExcludeDrugGroupID")
            If Not sid Is Nothing Then
                For Each ss As String In sid
                    Try
                        If groupid = CType(ss, Integer) Then
                            Return True
                        End If
                    Catch ex As Exception
                        Return True
                    End Try
                Next
            End If
            Return False
        End Function

        Public Function IsAccutane(ByVal intDrugid As Integer) As Boolean
            Dim s As String() = Me.findSettings("//Accutane/ID")
            If Not s Is Nothing Then
                For Each ss As String In s
                    If intDrugid = CType(ss, Integer) Then
                        Return True
                    End If
                Next
            End If
            Return False
        End Function

        Public Function GetWebMasterEmail() As String()
            Return Me.findSettings("//WebMaster/Email")
        End Function
    End Class
End Namespace

