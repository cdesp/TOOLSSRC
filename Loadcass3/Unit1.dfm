object Form1: TForm1
  Left = 290
  Top = 98
  Width = 702
  Height = 604
  Caption = 'NewBrain Cassette Digitizer Version 1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 512
    Width = 35
    Height = 13
    Caption = 'Sample'
  end
  object Button1: TButton
    Left = 8
    Top = 432
    Width = 85
    Height = 25
    Caption = '1. Load Wave'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 694
    Height = 425
    Align = alTop
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 0
      Top = 13
      Width = 8000
      Height = 349
      Color = clBlack
      ParentColor = False
      OnPaint = PaintBox1Paint
    end
  end
  object Button2: TButton
    Left = 104
    Top = 432
    Width = 81
    Height = 25
    Caption = '2. Digitize'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 200
    Top = 432
    Width = 185
    Height = 130
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
  object Button3: TButton
    Left = 9
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Save Patterns'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 104
    Top = 472
    Width = 80
    Height = 25
    Caption = 'Load Patterns'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 528
    Width = 73
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object Button5: TButton
    Left = 96
    Top = 528
    Width = 75
    Height = 25
    Caption = '<-- GOTO'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Memo2: TMemo
    Left = 416
    Top = 432
    Width = 273
    Height = 130
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 8
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.wav'
    Filter = 'Wav Files|*.wav'
    Options = [ofHideReadOnly, ofNoChangeDir, ofFileMustExist, ofNoNetworkButton, ofEnableSizing]
    Title = 'Select Wave File for Import'
    Left = 72
    Top = 472
  end
end
