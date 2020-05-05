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


program Matematica;

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
