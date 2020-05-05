object dmDB: TdmDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 325
  Width = 402
  object ZConFireBird: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    BeforeConnect = ZConFireBirdBeforeConnect
    HostName = ''
    Port = 0
    Database = 'D:\Programa'#231#227'o\jan\Matematica\bin\database\MINIGAME.FDB'
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebirdd-3.0'
    LibraryLocation = 'D:\Programa'#231#227'o\jan\Matematica\bin\fbclient.dll'
    Left = 24
    Top = 8
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 24
    Top = 56
  end
  object DataSourceSoap: TDataSource
    DataSet = ClientDataSetSoap
    Left = 312
    Top = 128
  end
  object SoapConnection1: TSoapConnection
    SOAPServerIID = 'IAppServerSOAP - {C99F4735-D6D2-495C-8CA2-E53E5A439E61}'
    UseSOAPAdapter = True
    Left = 312
    Top = 16
  end
  object ClientDataSetSoap: TClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = SoapConnection1
    Left = 312
    Top = 72
  end
end
