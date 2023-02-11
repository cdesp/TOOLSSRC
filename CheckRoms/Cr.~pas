{
//==========================================
//    $Date: 16/6/2004 - 2:59:21 μμ $
//==========================================
//        (C) Hypersoft S.A. 
// Τμήμα Ανάπτυξης Εφαρμογών Λογισμικού 
//          Δεσποινίδης Χρήστος
//==========================================
}
//--END HS INFO--
unit Cr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
      pth:String;

    { Private declarations }
  public
    { Public declarations }
  end;

function GetFiles(pth,Wld:String;ODirs:Boolean): TStrings;

var
  Form1: TForm1;

implementation



Procedure ods(s:String);
Begin
   form1.memo1.lines.add(s);
End;

Function GetFiles(pth,Wld:String;ODirs:Boolean):TStrings;
Var
    pfnddat:_Win32_Find_DataA;
    h:THandle;

    FUnction ISValid:Boolean;
    Begin
      if sametext(pfnddat.cFileName,'.') or
       sametext(pfnddat.cFileName,'..') then
      Begin
        result:=false;
        exit;
      End;
      if odirs then
      Begin
       if pfnddat.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY=FILE_ATTRIBUTE_DIRECTORY then
        result:=true
       else
        result:=false;
      End
      Else
      Begin
       if pfnddat.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY=FILE_ATTRIBUTE_DIRECTORY then
        result:=False
       else
        result:=True;
       if result then
        if (pos('.bin',pfnddat.cFileName)=0) and
           (pos('.bas',pfnddat.cFileName)=0) then
           result:=false;
      End;
    End;

Begin
  Result:=TStringlist.create;
  h:=FindFirstFile(PChar(pth+wld),pfnddat);
  if h>0 then
  Begin
    result.Add(pfnddat.cFileName);
    While FindNextFile(h,pfnddat) do
    Begin
      result.Add(pfnddat.cFileName);
    End;
  End;
End;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
Var f:File of byte;
    b:Byte;
    b1,b2,b3:byte;

    Function GetName(w:Word):String;
    Var fp:Longint;
        b:Byte;
        slt,ofs:Integer;
    Begin
      if w>8192 then
      Begin
       slt:=w div $2000;
       ofs:=w-(slt*$2000);
       w:=ofs;
      End;
      Result:='';
      fp:=Filepos(f);
      try
       Seek(f,0);
       seek(f,w);
       repeat
        read(f,b);
        if b<128 then
         result:=result+chr(b)
        Else
         result:=result+chr(b-128);
       until (b>=128);
      Finally
       Seek(f,0);
       Seek(f,fp);
      End;
    End;

    Function Check(b:byte):Boolean;
    var w:Word;
        s:String;
    Begin
       result:=false;
       case b of
        1:Begin
            Read(F,b1);
            Read(F,b2);
            w:=b1+b2*256;
            ODS('Subroutine at Slot 5 Offset : '+inttostr(w));
          End;
        2:Begin
            Read(F,b1);
            Read(F,b2);
            Read(F,b3);
            w:=b2+b3*256;
            ODS('System Call at Slot 7 ZCode : '+inttostr(b1)+' Addr:'+inttostr(w));
          End;
        3:Begin
            Read(F,b1);
            Read(F,b2);
            Read(F,b3);
            w:=b2+b3*256;
            ODS('Device Driver No : '+inttostr(b1)+' Addr:'+inttostr(w));
          End;
        4:Begin
            Read(F,b1);
            Case b1 of
             0,6..127:Begin
                      Read(F,b2);
                      Read(F,b3);
                      s:='Skipped';
                     End;
             128..255:Begin
                      s:='End Header.Next Page.';
                      result:=true;
                     End;
            Else
             Begin
              Read(F,b2);
              s:='Skip '+inttostr(b1)+' Pages';

             End;
            End;

            ODS(s);
          End;
        5:Begin
           s:='User Program at Offs : ';
           Read(F,b2);
           Read(F,b3);
           w:=b2+b3*256;
           s:=s+inttostr(w);
           s:=s+' ('+GetName(w)+')';
           //todo:Get the program name
           //and offset
           ODS(s);
          End;
        6:Begin
           s:='Library Argm : ';
           Read(F,b2);
           Read(F,b3);
           w:=b2+b3*256;
           s:=s+inttostr(w);
           s:=s+' ('+GetName(w)+')';
          //todo:Get the library name
           ODS(s);
          End;
        0,7..127:
        Begin
            Read(F,b1);
            Read(F,b2);
            ODS('Ignored');
        End;
        128..255:Result:=true;
       End;
    End;

Var sl:Tstrings;
    i:integer;
begin
  sl:=listbox1.items;

 For i:=0 to sl.count-1 do
 Begin
  if not listbox1.Selected[i] then continue;
  ODS('=============================');
  ODS(Sl[i]);
  ODS('-----------------------------');
  Assignfile(F,pth+sl[i]);
  reset(f);
  Repeat
   Read(F,b);
   if Check(b) then
    break;
  until false;
  CloseFile(f);
  ODS('==============================');
 End; 
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  pth:=ExtractFilePath(Application.exename);
  pth:=pth+'..\roms\';
 // pth:=pth+'roms\';
end;

procedure TForm1.Button2Click(Sender: TObject);
Var sl:Tstrings;

begin
  sl:=GetFiles(pth,'*.*',False);
  sl.delete(0);
  sl.delete(0);
  listbox1.items.assign(sl);
  sl.free;
end;

end.
