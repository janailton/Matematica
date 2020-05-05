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
  System.SysUtils, VCL.Dialogs, ZAbstractConnection, ZConnection,
  System.Classes, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Data.FMTBcd, Datasnap.DBClient, Soap.SOAPConn, Data.SqlExpr;

type
  TdmDB = class(TDataModule)
    ZConFireBird: TZConnection;
    ZQuery1: TZQuery;
    DataSourceSoap: TDataSource;
    SoapConnection1: TSoapConnection;
    ClientDataSetSoap: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ZConFireBirdBeforeConnect(Sender: TObject);
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

{$R *.dfm}

procedure TdmDB.DataModuleCreate(Sender: TObject);
begin
  ZConFireBird.Connect;
end;

procedure TdmDB.DataModuleDestroy(Sender: TObject);
begin
  ZConFireBird.Disconnect;
end;

function TdmDB.get_dataset_questao1: TDataSet;
var
  qry: TzQuery;
begin
  qry:= TzQuery.Create(nil);
  qry.Connection:= ZConFireBird;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select N1, N2, RESPOSTA, CORRECAO from QUESTAO1;');
  qry.ExecSQL;
  qry.Open;
  Result:= qry;
end;

procedure TdmDB.ZConFireBirdBeforeConnect(Sender: TObject);
var
  path: string;
begin
  ZConFireBird.Port:= 0;
  ZConFireBird.HostName:= '';
  ZConFireBird.User:= 'SYSDBA';
  ZConFireBird.Password:= 'masterkey';
  path:= ExtractFilePath(Paramstr(0));
  ZConFireBird.LibraryLocation:= path + 'fbclient.dll';
  ZConFireBird.Database:= path + 'database\MINIGAME.FDB';
end;

end.
