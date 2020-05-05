program ServerSoapMtematica;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUnit1 in 'FormUnit1.pas' {Form1},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  Service1Impl in 'Service1Impl.pas',
  Service1Intf in 'Service1Intf.pas',
  UnitRemoteDataModule1 in 'UnitRemoteDataModule1.pas' {ServiceDataBase1: TSoapDataModule},
  UnitdatamoduleDB in '..\UnitdatamoduleDB.pas' {dmDB: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmDB, dmDB);
  Application.Run;
end.
