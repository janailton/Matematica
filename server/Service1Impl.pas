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




{ Invokable implementation File for TService1 which implements IService1 }

unit Service1Impl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, Service1Intf;

type

  { TService1 }
  TService1 = class(TInvokableClass, IService1)
  public
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
  end;

implementation

function TService1.echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
begin
  { TODO : Implement method echoEnum }
  Result := Value;
end;

function TService1.echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
begin
  { TODO : Implement method echoDoubleArray }
  Result := Value;
end;

function TService1.echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
begin
  { TODO : Implement method echoMyEmployee }
  Result := Value;
end;

function TService1.echoDouble(const Value: Double): Double; stdcall;
begin
  { TODO : Implement method echoDouble }
  Result := Value;
end;


initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TService1);
end.

