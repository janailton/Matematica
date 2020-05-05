//    Copyright (C) 2020 José Janaílton da Silva <josejanailton@gmail.com>
//
//    This program is free software; you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation; either version 2 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program; if not, write to the Free Software
//    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//---------------------------------------------------------------------------



unit UnitdatamoduleDB;

interface

uses
  System.SysUtils, VCL.Dialogs,
  System.Classes, Data.DB,
  Data.FMTBcd, Datasnap.DBClient, Soap.SOAPConn, Data.SqlExpr;

type
  TdmDB = class(TDataModule)
    DataSourceSoap: TDataSource;
    SoapConnection1: TSoapConnection;
    ClientDataSetSoap: TClientDataSet;
    procedure ClientDataSetSoapAfterExecute(Sender: TObject;
      var OwnerData: OleVariant);
    procedure ClientDataSetSoapAfterEdit(DataSet: TDataSet);
    procedure ClientDataSetSoapAfterDelete(DataSet: TDataSet);
    procedure ClientDataSetSoapAfterClose(DataSet: TDataSet);
    procedure ClientDataSetSoapAfterCancel(DataSet: TDataSet);
    procedure ClientDataSetSoapAfterInsert(DataSet: TDataSet);
    procedure ClientDataSetSoapAfterOpen(DataSet: TDataSet);
    procedure ClientDataSetSoapAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function get_dataset_questao1: TDataSet;
    // select COUNT(CORRECAO) FROM QUESTAO1 where CORRECAO = TRUE;
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitPrincipal;

{$R *.dfm}

procedure TdmDB.ClientDataSetSoapAfterCancel(DataSet: TDataSet);
begin
  //ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.ClientDataSetSoapAfterClose(DataSet: TDataSet);
begin
  //ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.ClientDataSetSoapAfterDelete(DataSet: TDataSet);
begin
  //ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.ClientDataSetSoapAfterEdit(DataSet: TDataSet);
begin
  //ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.ClientDataSetSoapAfterExecute(Sender: TObject;
  var OwnerData: OleVariant);
begin
  //ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.ClientDataSetSoapAfterInsert(DataSet: TDataSet);
begin
  //ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.ClientDataSetSoapAfterOpen(DataSet: TDataSet);
begin
  //ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.ClientDataSetSoapAfterPost(DataSet: TDataSet);
begin
  ClientDataSetSoap.ApplyUpdates(0);
end;

procedure TdmDB.DataModuleCreate(Sender: TObject);
begin
  SoapConnection1.URL:= 'http://' + '192.168.20.2' + ':20111/soap/IServiceDataBase1';
  SoapConnection1.Connected:= true;
  ClientDataSetSoap.Active:= true;
end;

procedure TdmDB.DataModuleDestroy(Sender: TObject);
begin
  ClientDataSetSoap.ApplyUpdates(0);
  ClientDataSetSoap.Active:= false;
  SoapConnection1.Connected:= false;
end;

function TdmDB.get_dataset_questao1: TDataSet;

begin
  Result:= ClientDataSetSoap;
end;

end.
