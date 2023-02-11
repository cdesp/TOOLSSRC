object fnbdig: Tfnbdig
  Left = -2
  Top = 133
  Width = 1024
  Height = 572
  Caption = 'NB Digitizer 2.7'
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 1016
    Height = 269
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = PaintBox1Click
    OnDblClick = PaintBox1DblClick
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
    OnPaint = PaintBox1Paint
  end
  object Panel1: TPanel
    Left = 0
    Top = 375
    Width = 1016
    Height = 140
    Align = alBottom
    TabOrder = 0
    object Bevel5: TBevel
      Left = 2
      Top = 5
      Width = 215
      Height = 124
    end
    object Bevel4: TBevel
      Left = 226
      Top = 5
      Width = 252
      Height = 75
    end
    object Bevel3: TBevel
      Left = 480
      Top = 6
      Width = 150
      Height = 131
    end
    object Label3: TLabel
      Left = 12
      Top = 11
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label5: TLabel
      Left = 495
      Top = 8
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label6: TLabel
      Left = 94
      Top = 38
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object Label7: TLabel
      Left = 486
      Top = 99
      Width = 47
      Height = 13
      Caption = 'Sensitivity'
    end
    object lblprc: TLabel
      Left = 568
      Top = 32
      Width = 11
      Height = 20
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 7
      Top = 31
      Width = 75
      Height = 25
      Hint = 'Select a Wav File for Open'
      Caption = 'Select File'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Repaint'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 242
      Top = 12
      Width = 51
      Height = 25
      Hint = 'Previous Page'
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 399
      Top = 12
      Width = 53
      Height = 25
      Hint = 'Next Page'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 293
      Top = 12
      Width = 51
      Height = 25
      Hint = 'Previous Sample'
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 345
      Top = 12
      Width = 53
      Height = 25
      Hint = 'Next Sample'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 485
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Do Detection'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Button8Click
    end
    object Button10: TButton
      Left = 242
      Top = 44
      Width = 51
      Height = 25
      Hint = 'Previous Detected Byte'
      Caption = '< Byte'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 401
      Top = 44
      Width = 53
      Height = 25
      Hint = 'Next Detected Byte'
      Caption = 'Byte >'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 485
      Top = 63
      Width = 75
      Height = 25
      Caption = 'Continue'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = Button12Click
    end
    object Button13: TButton
      Left = 296
      Top = 44
      Width = 102
      Height = 25
      Caption = 'Fix Selected Byte'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = Button13Click
    end
    object Button15: TButton
      Left = 568
      Top = 63
      Width = 56
      Height = 25
      Caption = 'Stop'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = Button15Click
    end
    object Button16: TButton
      Left = 6
      Top = 89
      Width = 75
      Height = 25
      Hint = 'Save the detected file'
      Caption = 'Save File'
      TabOrder = 12
      OnClick = Button16Click
    end
    object StepBar: TTrackBar
      Left = 116
      Top = 31
      Width = 89
      Height = 26
      Max = 20
      Min = 5
      Orientation = trHorizontal
      Frequency = 1
      Position = 5
      SelEnd = 0
      SelStart = 0
      TabOrder = 13
      TickMarks = tmBottomRight
      TickStyle = tsAuto
      OnChange = StepBarChange
    end
    object Button17: TButton
      Left = 242
      Top = 94
      Width = 150
      Height = 25
      Hint = 'Delete ALL Bytes After Detected Byte No '
      Caption = 'Delete Bytes After Byte No : '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = Button17Click
    end
    object Edit1: TEdit
      Left = 396
      Top = 96
      Width = 35
      Height = 21
      TabOrder = 15
      Text = '0'
    end
    object Sens: TTrackBar
      Left = 537
      Top = 89
      Width = 94
      Height = 29
      Max = 6
      Min = 2
      Orientation = trHorizontal
      Frequency = 1
      Position = 2
      SelEnd = 0
      SelStart = 0
      TabOrder = 16
      TickMarks = tmTopLeft
      TickStyle = tsAuto
    end
    object PageControl1: TPageControl
      Left = 632
      Top = 1
      Width = 383
      Height = 138
      ActivePage = TabSheet1
      Align = alRight
      TabOrder = 17
      object TabSheet1: TTabSheet
        Caption = 'Selection Tools'
        object Bevel1: TBevel
          Left = 10
          Top = 5
          Width = 359
          Height = 55
        end
        object Label4: TLabel
          Left = 26
          Top = 8
          Width = 64
          Height = 13
          Caption = 'Not Detected'
        end
        object Label1: TLabel
          Left = 205
          Top = 19
          Width = 23
          Height = 13
          Cursor = crHandPoint
          Caption = 'From'
          OnClick = Label1Click
        end
        object Label2: TLabel
          Left = 302
          Top = 19
          Width = 33
          Height = 13
          Caption = 'Length'
        end
        object Bevel2: TBevel
          Left = 9
          Top = 66
          Width = 360
          Height = 57
        end
        object Button3: TButton
          Left = 19
          Top = 30
          Width = 116
          Height = 25
          Hint = 'Try to Detect The selection'
          Caption = 'Detect Selection'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = Button3Click
        end
        object Button9: TButton
          Left = 138
          Top = 29
          Width = 38
          Height = 26
          Hint = 'Next Selection Detect'
          Caption = 'NXT'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = Button9Click
        end
        object frmsampl: TEdit
          Left = 182
          Top = 33
          Width = 80
          Height = 21
          Hint = 'Selection Start Sample'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = '0'
        end
        object lenSampl: TEdit
          Left = 273
          Top = 33
          Width = 94
          Height = 21
          Hint = 'Selection Length in Samples (Pilot 36, Bits 18)'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Text = '18'
        end
        object Button14: TButton
          Left = 45
          Top = 77
          Width = 88
          Height = 21
          Hint = 'Marks a byte Starting at the given sample'
          Caption = 'Mark Byte From'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Button14Click
        end
        object Edit2: TEdit
          Left = 134
          Top = 77
          Width = 54
          Height = 21
          TabOrder = 5
          Text = '0'
        end
        object Button18: TButton
          Left = 206
          Top = 75
          Width = 64
          Height = 25
          Hint = 'Mark Previous Byte'
          Caption = '< Byte'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = Button18Click
        end
        object Button19: TButton
          Left = 273
          Top = 75
          Width = 66
          Height = 25
          Hint = 'Mark Next Byte'
          Caption = 'Byte >'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = Button19Click
        end
        object Button30: TButton
          Left = 241
          Top = 8
          Width = 49
          Height = 17
          Caption = 'Fix Edge'
          TabOrder = 8
          Visible = False
          OnClick = Button30Click
        end
        object CheckBox4: TCheckBox
          Left = 104
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Pilot Detect'
          TabOrder = 9
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Patterns'
        ImageIndex = 1
        object ListBox3: TListBox
          Left = 184
          Top = 0
          Width = 191
          Height = 110
          Align = alRight
          ItemHeight = 13
          TabOrder = 0
        end
        object Button23: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Hint = 'View Pilot Pattern'
          Caption = 'Pilot'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = Button23Click
        end
        object Button24: TButton
          Left = 8
          Top = 32
          Width = 75
          Height = 25
          Hint = 'View One Pattern'
          Caption = 'One'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = Button24Click
        end
        object Button25: TButton
          Left = 8
          Top = 56
          Width = 75
          Height = 25
          Hint = 'View Zero Pattern'
          Caption = 'Zero'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = Button25Click
        end
        object Button26: TButton
          Left = 88
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Set Pattern From Selection'
          Caption = 'Set'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Button26Click
        end
        object Button27: TButton
          Left = 88
          Top = 32
          Width = 75
          Height = 25
          Hint = 'Set Pattern From Selection'
          Caption = 'Set'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = Button27Click
        end
        object Button28: TButton
          Left = 88
          Top = 56
          Width = 75
          Height = 25
          Hint = 'Set Pattern From Selection'
          Caption = 'Set'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = Button28Click
        end
        object Button29: TButton
          Left = 52
          Top = 85
          Width = 75
          Height = 25
          Hint = 'Save Patterns to file'
          Caption = 'Save Patterns'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = Button29Click
        end
      end
    end
    object CheckBox2: TCheckBox
      Left = 104
      Top = 98
      Width = 97
      Height = 17
      Hint = 'Show the samples after applying a filter or as it is'
      Caption = 'Filtered Samples'
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 18
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 72
      Width = 97
      Height = 17
      Caption = 'NamebyPart'
      TabOrder = 19
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 515
    Width = 1016
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 300
      end
      item
        Alignment = taCenter
        Width = 400
      end>
    SimplePanel = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 1016
    Height = 106
    Align = alBottom
    TabOrder = 2
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 296
      Height = 104
      Hint = 'Double click to position'
      Align = alLeft
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = ListBox1DblClick
    end
    object Panel3: TPanel
      Left = 297
      Top = 1
      Width = 718
      Height = 104
      Align = alClient
      TabOrder = 1
      object Label8: TLabel
        Left = 344
        Top = 8
        Width = 24
        Height = 13
        Caption = 'Parts'
      end
      object Label9: TLabel
        Left = 245
        Top = 42
        Width = 55
        Height = 13
        Caption = 'Part sample'
      end
      object Label10: TLabel
        Left = 96
        Top = 80
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label11: TLabel
        Left = 144
        Top = 80
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label12: TLabel
        Left = 192
        Top = 80
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Edit3: TEdit
        Left = 376
        Top = 8
        Width = 46
        Height = 21
        Hint = 'Enter Adds or removes Parts'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = '0'
        OnKeyUp = Edit3KeyUp
      end
      object ListBox2: TListBox
        Left = 430
        Top = 1
        Width = 287
        Height = 102
        Align = alRight
        ItemHeight = 13
        TabOrder = 1
        OnClick = ListBox2Click
      end
      object Edit4: TEdit
        Left = 304
        Top = 40
        Width = 121
        Height = 21
        Hint = 'Enter Replace value'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = '0'
        OnKeyUp = Edit4KeyUp
      end
      object CheckBox1: TCheckBox
        Left = 304
        Top = 71
        Width = 97
        Height = 17
        Caption = 'Part detection'
        TabOrder = 3
        Visible = False
      end
      object Button20: TButton
        Left = 240
        Top = 8
        Width = 81
        Height = 25
        Hint = 'Detect Selected Part Only'
        Caption = 'Detect Part'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = Button20Click
      end
      object Button21: TButton
        Left = 8
        Top = 34
        Width = 85
        Height = 25
        Hint = 'Saves the list of Pilot starts for every Part '
        Caption = 'Save Part List'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Button21Click
      end
      object Button22: TButton
        Left = 8
        Top = 8
        Width = 85
        Height = 25
        Hint = 'Detect all Parts'
        Caption = 'AllParts'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = Button22Click
      end
      object Button31: TButton
        Left = 8
        Top = 72
        Width = 75
        Height = 25
        Hint = 'Works Only for the First detected part'
        Caption = 'CHKSUM -- >'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = Button31Click
      end
      object btn: TButton
        Left = 144
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Add'
        TabOrder = 8
        Visible = False
        OnClick = btnClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'WAV|*.wav'
    Title = 'Open Wav File'
    Left = 47
    Top = 10
  end
end
