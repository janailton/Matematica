program Questao2;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form1},
  UnitdatamoduleDB in 'UnitdatamoduleDB.pas' {dmDB: TDataModule},
  UnitDialogo1 in 'UnitDialogo1.pas' {FormDialogo1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmDB, dmDB);
  Application.CreateForm(TFormDialogo1, FormDialogo1);
  Application.Run;
end.
