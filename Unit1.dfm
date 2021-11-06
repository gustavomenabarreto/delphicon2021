object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Trabalhando com JSON no Delphi'
  ClientHeight = 547
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 265
    Height = 41
    Caption = 'Modo Mais Simples'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 71
    Width = 265
    Height = 41
    Caption = 'SuperObject'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 118
    Width = 265
    Height = 41
    Caption = 'JsonToDelphi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button5: TButton
    Left = 8
    Top = 165
    Width = 265
    Height = 41
    Caption = 'RESTResponseDataSetAdapter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button5Click
  end
  object MemoJson: TMemo
    Left = 304
    Top = 0
    Width = 403
    Height = 547
    Align = alRight
    Lines.Strings = (
      '{'
      '  "block_hash": '
      '"0000000000000000c504bdea36e531d8089d324f2d936c86e3274f97f8a4432'
      '8",'
      '  "inputs": ['
      '    {'
      '      "prev_hash": '
      '"583910b7bf90ab802e22e5c25a89b59862b20c8c1aeb24dfb94e7a508a70f12'
      '1",'
      '      "output_index": 1,'
      '      "script": "48304502210086de855e03008ab",'
      '      "output_value": 16450000,'
      '      "sequence": 4294967295,'
      '      "addresses": ['
      '        "1GbMfYui17L5m6sAy3L3WXAtf1P32bxJXq"'
      '      ],'
      '      "script_type": "pay-to-pubkey-hash",'
      '      "age": 292997'
      '    },'
      '    {'
      '      "prev_hash": '
      '"f6966bb3d3ba0eb97fd11b223fb13c793c0b4a1b3deb575e8ae38d666c1d00d'
      '9",'
      '      "output_index": 36,'
      '      "script": "48304502210086de855e03008ab",'
      '      "output_value": 10061545,'
      '      "sequence": 4294967295,'
      '      "addresses": ['
      '        "19YtzZdcfs1V2ZCgyRWo8i2wLT8ND1Tu4L"'
      '      ],'
      '      "script_type": "pay-to-pubkey-hash",'
      '      "age": 292998'
      '    }'
      '  ]'
      '}'
      '')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object MemoResultado: TMemo
    Left = 8
    Top = 416
    Width = 281
    Height = 123
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 272
    Width = 281
    Height = 120
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button4: TButton
    Left = 8
    Top = 212
    Width = 265
    Height = 37
    Caption = 'TJSONMarshal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button4Click
  end
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://api.blockcypher.com/v1/btc/main/txs/f854aebae95150b379cc' +
      '1187d848d58225f3c4157fe992bcd166f58bd5063449'
    Params = <>
    Left = 616
    Top = 440
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 504
    Top = 440
  end
  object RESTResponse1: TRESTResponse
    Left = 640
    Top = 496
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 504
    Top = 496
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 376
    Top = 496
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 192
    Top = 288
  end
end
