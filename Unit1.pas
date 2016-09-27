unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    mmo1: TMemo;
    mmo2: TMemo;
    edt3: TEdit;
    lbl3: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//==============================================================================
//
//==============================================================================
function TestLengthOfNumber(fNumberS:string;tNumberS:string):Boolean;
begin
 if Length(fNumberS)=Length(tNumberS) then
 begin
   Result:=true;
 end
 else
 begin
   Result:=false;
 end;
end;
//==============================================================================



//==============================================================================
//
//==============================================================================
function TestVals(fNumber:Cardinal;tNumber:Cardinal):Boolean;
var
  bool:Boolean;

  sinbArr:array of Char;

  i:Integer;

  pos:Integer;

  fNumberStr:string;
  tNumberStr:string;
begin
  bool:=True;
  fNumberStr:=IntToStr(fNumber);
  tNumberStr:=IntToStr(tNumber);
  //определим что цифр в обоих числах одинаково
  if (TestLengthOfNumber(fNumberStr,tNumberStr)) then
  begin
    for i:=1 to Length(fNumberStr) do
    begin
      pos:=0;
      pos:=AnsiPos(fNumberStr[i],tNumberStr);
      if pos=0 then
      begin
        bool:=False;
        Break;
      end;
    end;

    for i:=1 to Length(tNumberStr) do
    begin
      pos:=0;
      pos:=AnsiPos(tNumberStr[i],fNumberStr);
      if pos=0 then
      begin
        bool:=False;
        Break;
      end;
    end;
  end
  else
  begin
    bool:=False;
  end;
  result:=bool;
end;
//==============================================================================

procedure TForm1.btn1Click(Sender: TObject);
var
  fNum:Cardinal;
  tNum:Cardinal;
  iterationNumber:Cardinal;
  i:Cardinal;
begin
  fNum:=StrToInt(Form1.edt1.text);
  tNum:=StrToInt(Form1.edt2.text);
  iterationNumber:=StrToInt(Form1.edt3.text);
  for i:=1 to iterationNumber do
  begin
    if (TestVals(fNum*i,tNum*i)) then
    begin
      Form1.mmo2.Lines.Add(IntToStr(i));
    end;

    Form1.mmo1.Lines.Add('#'+IntToStr(i)+' '+IntToStr(fNum)+'*'+IntToStr(i)+'='+IntToStr(fNum*i)+
    ' <-----> '+IntToStr(tNum)+'*'+IntToStr(i)+'='+IntToStr(tNum*i));
    //Form1.mmo2.Lines.Add(IntToStr(tNum)+'*'+IntToStr(i)+'='+IntToStr(tNum*i));
  end;

  
end;

end.
