object Form1: TForm1
  Left = 292
  Top = 107
  Width = 383
  Height = 480
  Caption = 'Check NewBrain Roms'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 204
    Width = 375
    Height = 238
    Align = alBottom
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 289
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Scan Selected'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 273
    Height = 204
    Align = alLeft
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 2
  end
  object Button2: TButton
    Left = 290
    Top = 33
    Width = 75
    Height = 25
    Caption = 'Load Roms'
    TabOrder = 3
    OnClick = Button2Click
  end
end
