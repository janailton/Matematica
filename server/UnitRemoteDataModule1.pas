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


Unit UnitRemoteDataModule1;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm, UnitdatamoduleDB,
  ZAbstractConnection, ZConnection, Datasnap.Provider;

type
  IServiceDataBase1 = interface(IAppServerSOAP)
    ['{FC8C80E0-0E65-483C-9EBB-797945B71302}']
  end;

  TServiceDataBase1 = class(TSoapDataModule, IServiceDataBase1, IAppServerSOAP, IAppServer)
    DataSetProvider1: TDataSetProvider;
    procedure SoapDataModuleCreate(Sender: TObject);
    procedure SoapDataModuleDestroy(Sender: TObject);
  private
  
  public
  
  end;

implementation



{$R *.DFM}

procedure TServiceDataBase1CreateInstance(out obj: TObject);
begin
 obj := TServiceDataBase1.Create(nil);
end;

procedure TServiceDataBase1.SoapDataModuleCreate(Sender: TObject);
begin
  //ZConnection1.Free;
  //ZConnection1:= dmDB.ZConFireBird;
  DataSetProvider1.DataSet:= dmDB.get_dataset_questao1;
end;

procedure TServiceDataBase1.SoapDataModuleDestroy(Sender: TObject);
begin
  //ZConnection1:= nil;
  DataSetProvider1.DataSet:= nil;
end;

initialization
   InvRegistry.RegisterInvokableClass(TServiceDataBase1, TServiceDataBase1CreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IServiceDataBase1));
end.
