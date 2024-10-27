object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Budzik'
  ClientHeight = 147
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 148
    Height = 58
    Align = alLeft
    Caption = 'Aktualny czas'
    TabOrder = 0
    object LabelHour: TLabel
      Left = 20
      Top = 15
      Width = 30
      Height = 37
      Align = alCustom
      Alignment = taRightJustify
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 56
      Top = 15
      Width = 6
      Height = 37
      Align = alCustom
      Alignment = taCenter
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelMinute: TLabel
      Left = 65
      Top = 15
      Width = 30
      Height = 37
      Align = alCustom
      Alignment = taCenter
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 148
    Top = 0
    Width = 129
    Height = 58
    Align = alClient
    Caption = 'Alarm'
    TabOrder = 1
    object UpDown1: TUpDown
      Left = 48
      Top = 22
      Width = 17
      Height = 25
      TabOrder = 0
      OnClick = UpDown1Click
    end
    object EditH: TEdit
      Left = 16
      Top = 24
      Width = 34
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
    object EditM: TEdit
      Left = 71
      Top = 24
      Width = 34
      Height = 23
      NumbersOnly = True
      TabOrder = 2
    end
    object UpDown2: TUpDown
      Left = 102
      Top = 22
      Width = 17
      Height = 25
      TabOrder = 3
      OnClick = UpDown2Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 58
    Width = 277
    Height = 89
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 269
      Height = 21
      Align = alTop
      Caption = 'Powiadomienie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 106
    end
    object Edit1: TEdit
      Left = 1
      Top = 28
      Width = 275
      Height = 23
      Align = alTop
      TabOrder = 0
    end
    object Button1: TButton
      Left = 107
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = Button1Click
    end
    object MediaPlayer1: TMediaPlayer
      Left = 219
      Top = 51
      Width = 253
      Height = 30
      Align = alCustom
      DoubleBuffered = True
      Visible = False
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 232
    Top = 54
  end
end
