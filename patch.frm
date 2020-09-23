VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1410
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2655
   LinkTopic       =   "Form1"
   ScaleHeight     =   1410
   ScaleWidth      =   2655
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   240
      Top             =   600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemotePort      =   455
      LocalPort       =   455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'''''''' Gadi Elishayov ''''''''''
' I Assume You Read The Client.vpb Project File
' If Not Read Him Now
' If You Finish And Understand
' Come To My Site
' www.gadihomepage.com
' Bye Bye By The Legend: Gadi Elishayov!

Private Sub Form_Load()
' here it listen for any connection's to make
Winsock1.Listen
End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
' it's accept connection when any body ask him
    If Winsock1.State <> sckClosed Then Winsock1.Close
    Winsock1.Accept requestID
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
' it's save the data in a string
Dim strData As String
    Winsock1.GetData strData, vbString
    MsgBox (strData)
End Sub
