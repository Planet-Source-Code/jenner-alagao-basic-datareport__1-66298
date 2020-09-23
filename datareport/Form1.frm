VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7020
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9450
   LinkTopic       =   "Form1"
   ScaleHeight     =   7020
   ScaleWidth      =   9450
   StartUpPosition =   3  'Windows Default
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   330
      Left            =   240
      Top             =   1440
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "View Data report"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   1920
      Width           =   3015
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
DataReport1.Show
End Sub

Private Sub Form_Load()
'NOTE: the adodc properties not changed
' i set it in command line below

'database connection
Adodc1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\database.mdb;Persist Security Info=False"
'connect as client
Adodc1.CursorLocation = adUseClient
'select the table to use
    'SQL command
Adodc1.RecordSource = "Select * from Table1"
Adodc1.Refresh

'set the database source in adodc
    Set DataReport1.DataSource = Adodc1
    'set the text1-(which is object found in data report)
        'then set the field
    DataReport1.Sections("section1").Controls.Item("Text1").DataField = "field1"
    DataReport1.Sections("section1").Controls.Item("Text2").DataField = "field2"
    DataReport1.Sections("section1").Controls.Item("Text3").DataField = "field3"
End Sub

