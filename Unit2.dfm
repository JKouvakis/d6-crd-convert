object Form2: TForm2
  Left = 422
  Top = 219
  BorderStyle = bsToolWindow
  Caption = 'Settings...'
  ClientHeight = 247
  ClientWidth = 397
  Color = clBtnFace
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 2
    Top = 0
    Width = 395
    Height = 81
    Caption = 'Text :'
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 48
      Width = 113
      Height = 15
      Caption = 'This Is a Text Sample'
      Font.Charset = GREEK_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object TextFSTB: TSpeedButton
      Left = 228
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = TextFSTBClick
    end
    object TextFSTI: TSpeedButton
      Left = 252
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = TextFSTIClick
    end
    object TextFSTU: TSpeedButton
      Left = 276
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 3
      Caption = 'U'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = TextFSTUClick
    end
    object TextFS: TFontSizeComboBox
      Left = 172
      Top = 20
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = TextFSChange
    end
    object TextC: TColorBox
      Left = 308
      Top = 20
      Width = 81
      Height = 22
      ItemHeight = 16
      TabOrder = 1
      OnChange = TextCChange
    end
    object Text: TComboBox
      Left = 10
      Top = 20
      Width = 157
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = TextChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 2
    Top = 82
    Width = 395
    Height = 81
    Caption = 'Chords :'
    TabOrder = 1
    object Label2: TLabel
      Left = 10
      Top = 48
      Width = 119
      Height = 16
      Caption = 'This Is a Text Sample'
      Font.Charset = GREEK_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object ChordFSTB: TSpeedButton
      Left = 228
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ChordFSTBClick
    end
    object ChordFSTI: TSpeedButton
      Left = 252
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = ChordFSTIClick
    end
    object ChordFSTU: TSpeedButton
      Left = 276
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 3
      Caption = 'U'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = ChordFSTUClick
    end
    object ChordC: TColorBox
      Left = 308
      Top = 20
      Width = 81
      Height = 22
      ItemHeight = 16
      TabOrder = 0
      OnChange = ChordCChange
    end
    object ChordFS: TFontSizeComboBox
      Left = 172
      Top = 20
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = ChordFSChange
    end
    object Chord: TComboBox
      Left = 10
      Top = 20
      Width = 157
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = ChordChange
    end
  end
  object GroupBox3: TGroupBox
    Left = 2
    Top = 164
    Width = 395
    Height = 81
    Caption = 'Other :'
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 48
      Width = 99
      Height = 14
      Caption = 'This Is a Text Sample'
      Font.Charset = GREEK_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object OtherFSTB: TSpeedButton
      Left = 228
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = OtherFSTBClick
    end
    object OtherFSTI: TSpeedButton
      Left = 252
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      OnClick = OtherFSTIClick
    end
    object OtherFSTU: TSpeedButton
      Left = 276
      Top = 20
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 3
      Caption = 'U'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = OtherFSTUClick
    end
    object OtherFS: TFontSizeComboBox
      Left = 172
      Top = 20
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = OtherFSChange
    end
    object OtherC: TColorBox
      Left = 308
      Top = 20
      Width = 81
      Height = 22
      ItemHeight = 16
      TabOrder = 1
      OnChange = OtherCChange
    end
    object Other: TComboBox
      Left = 10
      Top = 20
      Width = 157
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = OtherChange
    end
  end
end
