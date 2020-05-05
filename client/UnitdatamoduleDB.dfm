object dmDB: TdmDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 325
  Width = 402
  object DataSourceSoap: TDataSource
    DataSet = ClientDataSetSoap
    Left = 312
    Top = 128
  end
  object SoapConnection1: TSoapConnection
    Agent = 'Embarcadero SOAP 1.4'
    URL = 'http://localhost:20111/soap/IServiceDataBase1'
    SOAPServerIID = 'IAppServerSOAP - {C99F4735-D6D2-495C-8CA2-E53E5A439E61}'
    UseSOAPAdapter = True
    Left = 312
    Top = 16
  end
  object ClientDataSetSoap: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    RemoteServer = SoapConnection1
    AfterOpen = ClientDataSetSoapAfterOpen
    AfterClose = ClientDataSetSoapAfterClose
    AfterInsert = ClientDataSetSoapAfterInsert
    AfterEdit = ClientDataSetSoapAfterEdit
    AfterPost = ClientDataSetSoapAfterPost
    AfterCancel = ClientDataSetSoapAfterCancel
    AfterDelete = ClientDataSetSoapAfterDelete
    AfterExecute = ClientDataSetSoapAfterExecute
    Left = 312
    Top = 72
  end
end
