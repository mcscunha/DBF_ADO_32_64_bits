object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Principal'
  ClientHeight = 258
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 5
    Width = 226
    Height = 13
    Caption = 'String de Conex'#227'o - Sistema 64 bits - Abrir DBF'
  end
  object lblNumRegistros: TLabel
    Left = 8
    Top = 69
    Width = 167
    Height = 13
    Caption = 'N'#250'mero de Registros Encontrados:'
  end
  object lblNumReg: TLabel
    Left = 184
    Top = 69
    Width = 6
    Height = 13
    Caption = '0'
  end
  object btnAbrir: TButton
    Left = 456
    Top = 9
    Width = 75
    Height = 33
    Caption = 'Abrir DBF'
    TabOrder = 0
    OnClick = btnAbrirClick
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 87
    Width = 539
    Height = 171
    Align = alBottom
    DataSource = dsDBF
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnFechar: TButton
    Left = 456
    Top = 48
    Width = 75
    Height = 33
    Caption = 'Fechar DBF'
    TabOrder = 2
    OnClick = btnFecharClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 21
    Width = 442
    Height = 21
    TabOrder = 3
    Text = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=dBASE' +
      ' Files;Initial Catalog=%s'
  end
  object qryDBF: TADOQuery
    Connection = conDBF
    Parameters = <>
    SQL.Strings = (
      'select * from "subsol.dbf"')
    Left = 216
    Top = 128
  end
  object dsDBF: TDataSource
    DataSet = qryDBF
    Left = 264
    Top = 128
  end
  object conDBF: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=dBASE' +
      ' Files;Initial Catalog=D:\DBF\'
    CursorLocation = clUseServer
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 216
    Top = 16
  end
end
