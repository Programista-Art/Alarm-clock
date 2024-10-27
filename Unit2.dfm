object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Powiadomienie'
  ClientHeight = 96
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnActivate = FormActivate
  TextHeight = 15
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 262
    Height = 96
    Align = alClient
    Alignment = taCenter
    Caption = 'Uwaga'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 160
    ExplicitTop = 80
    ExplicitWidth = 83
    ExplicitHeight = 37
  end
  object Button1: TButton
    Left = 88
    Top = 63
    Width = 75
    Height = 25
    Caption = 'ok'
    TabOrder = 0
    OnClick = Button1Click
  end
end
