object Form1: TForm1
  Left = 118
  Top = 27
  Width = 831
  Height = 672
  Caption = 'Form1'
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
  object Panel1: TPanel
    Left = 8
    Top = 0
    Width = 309
    Height = 87
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 7
      Width = 21
      Height = 13
      Caption = 'Side'
    end
    object Label2: TLabel
      Left = 91
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Cylinder'
    end
    object Label3: TLabel
      Left = 169
      Top = 7
      Width = 28
      Height = 13
      Caption = 'Track'
    end
    object Label4: TLabel
      Left = 247
      Top = 7
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label5: TLabel
      Left = 58
      Top = 58
      Width = 37
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 10
      Top = 31
      Width = 55
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 82
      Top = 31
      Width = 55
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Edit3: TEdit
      Left = 159
      Top = 31
      Width = 55
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
    object Edit4: TEdit
      Left = 240
      Top = 31
      Width = 55
      Height = 21
      TabOrder = 3
      Text = 'Edit1'
    end
    object Button2: TButton
      Left = 8
      Top = 56
      Width = 44
      Height = 22
      Caption = '<'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 101
      Top = 57
      Width = 43
      Height = 22
      Caption = '>'
      TabOrder = 5
      OnClick = Button3Click
    end
    object Edit5: TEdit
      Left = 158
      Top = 57
      Width = 139
      Height = 21
      TabOrder = 6
      Text = 'Edit5'
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 324
    Top = 1
    Width = 485
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = 'File'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'D_0_Y'
      'D_1_Y')
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object memData: TMemo
    Left = 8
    Top = 91
    Width = 810
    Height = 258
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    HideSelection = False
    ParentFont = False
    TabOrder = 2
    OnClick = memDataClick
  end
  object PageControl1: TPageControl
    Left = 9
    Top = 352
    Width = 807
    Height = 292
    ActivePage = TabSheet3
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Chars'
      object memText: TMemo
        Left = 0
        Top = 0
        Width = 799
        Height = 264
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HideSelection = False
        ParentFont = False
        TabOrder = 0
        OnClick = memTextClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Disk Params'
      ImageIndex = 1
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 207
        Height = 264
        Align = alLeft
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object ListBox2: TListBox
        Left = 207
        Top = 0
        Width = 203
        Height = 264
        Align = alLeft
        ItemHeight = 13
        TabOrder = 1
        OnClick = ListBox1Click
      end
      object ListBox3: TListBox
        Left = 410
        Top = 0
        Width = 190
        Height = 264
        Align = alLeft
        ItemHeight = 13
        TabOrder = 2
      end
      object ListBox4: TListBox
        Left = 600
        Top = 0
        Width = 200
        Height = 264
        Align = alLeft
        ItemHeight = 13
        TabOrder = 3
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Directory'
      ImageIndex = 2
      object memDir: TMemo
        Left = 0
        Top = 43
        Width = 799
        Height = 221
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HideSelection = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnClick = memDataClick
      end
      object Show: TButton
        Left = 9
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Show'
        TabOrder = 1
        OnClick = ShowClick
      end
      object Button1: TButton
        Left = 105
        Top = 6
        Width = 75
        Height = 25
        Caption = 'FillTable'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button4: TButton
        Left = 210
        Top = 7
        Width = 75
        Height = 25
        Caption = 'Convert'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 317
        Top = 8
        Width = 75
        Height = 25
        Caption = 'MakeDisk'
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 423
        Top = 7
        Width = 75
        Height = 25
        Caption = 'MakeDir'
        TabOrder = 5
        OnClick = Button6Click
      end
    end
  end
end
