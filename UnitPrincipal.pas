//    Copyright (C) 2020 Jos� Jana�lton da Silva <josejanailton@gmail.com>
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



unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RzLabel, RzDBLbl, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2MouseEnter(Sender: TObject);
    procedure DBEdit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    procedure nova_questao;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UnitdatamoduleDB, UnitDialogo1;

procedure TForm1.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  Exit;
end;

procedure TForm1.DBEdit2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Exit;
end;

procedure TForm1.DBEdit2MouseEnter(Sender: TObject);
begin
  Exit;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  DataSource1.DataSet:= dmDB.get_dataset_questao1;
  Randomize;
  nova_questao;
end;

procedure TForm1.nova_questao;
var
  i, j, a, b: integer;
begin
  j:= random(200);
  a:= random(10);
  for I := 0 to j do
  begin
    sleep(1);
    b:= random(10)
  end;

  DataSource1.DataSet.Append;
  DBEdit2.Text := IntToStr(a);
  sleep(18);
  DBEdit3.Text := IntToStr(b);
  DBEdit1.Clear;
  DBEdit1.SetFocus;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if (StrToInt(DBEdit2.Text) + StrToInt(DBEdit3.Text) = StrToInt(DBEdit1.Text)) then
  begin
    DataSource1.DataSet.FieldByName('CORRECAO').AsBoolean:= true;
    FormDialogo1.ShowDialogo('zero.jpg', 'Voc� Acertou! Parab�ns.');
  end
  else
  begin
   DataSource1.DataSet.FieldByName('CORRECAO').AsBoolean:= false;
   FormDialogo1.ShowDialogo('belial.jpg', 'Voc� errou! Boa sorte da pr�xima vez.');
   Beep;
  end;

  DataSource1.DataSet.Post;
  nova_questao;
end;

end.
