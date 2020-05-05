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


unit UnitDialogo1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFormDialogo1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure ShowDialogo(imagem: string; txt: string);
  end;

var
  FormDialogo1: TFormDialogo1;

implementation

{$R *.dfm}

procedure TFormDialogo1.Button1Click(Sender: TObject);
begin
  Close;
end;

class procedure TFormDialogo1.ShowDialogo(imagem, txt: string);
var
  f: TFormDialogo1;
begin
  f:= TFormDialogo1.Create(nil);
  f.Label1.Caption:= txt;
  f.Image1.Picture.LoadFromFile(imagem);
  f.ShowModal;
  f.Free;
end;

end.
