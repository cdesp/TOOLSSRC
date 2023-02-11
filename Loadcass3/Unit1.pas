{
//==========================================
//    $Date: 29/4/2004 - 5:43:21 �� $
//==========================================
//        (C) Hypersoft S.A. 
// ����� ��������� ��������� ���������� 
//          ����������� �������
//==========================================
}
//--END HS INFO--
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type

  TEdge=record
    Lt:String[1];
    Min:Integer;
    Max:Integer;
  End;

  TPattern=record
    count:Integer;
    edges:array of Tedge;
    SumMin:Integer;
    SumMax:Integer;
  End;

  TForm1 = class(TForm)
    Button1: TButton;
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button5: TButton;
    Memo2: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    Fcount: Integer;
    FirstPaint: Boolean;
    kount: Integer;
    DataStart: Integer;
    procedure PaintMain(cnv: Tcanvas);
    function GetRatio: Real;
    function GetMax: real;
    function CheckPilot(kk:Integer): Boolean;
    function CheckOne(kk:Integer): Boolean;
    function CheckZero(kk:Integer): Boolean;
    procedure Decode(s:String;Var l:String;Var i:Integer);
    function IsBetween(t,min,max:Integer): Boolean;
    procedure FindData;
    function FindPilot: Integer;
    procedure ODS(s: String);
    procedure SetPatterns;
    function CheckPattern(p: TPattern; kk: Integer): Boolean;
    procedure SavePatterns;
    procedure LoadPatterns;
    procedure ODS2(s: String);

    { Private declarations }
  public
    FName: string;
    Ident: Integer;
    totalpeeks:Integer;
    function FPath: string;
    procedure OpenWave;
    function WaveName: string;
    procedure SaveNBFile;
    function BinName: string;
    { Public declarations }
  end;


var
  Form1: TForm1;
  ZeroPat:TPattern;
  OnePat:TPattern;
  PilotPat:TPattern;

implementation
uses jcllogic,inifiles;
Var
    buf:array[0..100000000] of byte;
//    buf:array of byte;
    pk:Array[0..1000000] of String;
    pkd:Array[0..1000000] of integer;
    pkL:Array[0..1000000] of Byte;
    //pkd:Array[0..20000] of string;
    data:Array[0..450000] of byte;
    savdat:integer=0;

function TForm1.FPath: string;
begin
  Result := Extractfilepath(Application.exename);

end;

procedure TForm1.ODS(s:String);
Begin
  Memo1.lines.add(s);
End;

procedure TForm1.ODS2(s:String);
Begin
  Memo2.lines.add(s);
End;

procedure TForm1.SavePatterns;
Var infl:TIniFile;

      procedure SavePattern(nm:String;p:TPattern);
      var    y:Integer;
      Begin
       infl.WriteInteger('Main'+nm,'Count',p.count);
       infl.WriteInteger('Main'+nm,'SumMin',p.SumMin);
       infl.WriteInteger('Main'+nm,'SumMax',p.SumMax);
       For y:=0 to p.count-1 do
       Begin
        infl.WriteString('Item'+nm+inttostr(y),'Lt',p.edges[y].Lt);
        infl.WriteInteger('Item'+nm+inttostr(y),'Min',p.edges[y].Min);
        infl.WriteInteger('Item'+nm+inttostr(y),'Max',p.edges[y].Max);
       End;

      End;

Begin
  infl:=TIniFile.Create(fpath+'patterns.ini');
  SavePattern('_Pilot',PilotPat);
  SavePattern('_One',OnePat);
  SavePattern('_Zero',ZeroPat);
  infl.free;
End;

procedure TForm1.SetPatterns;
Begin
  //----Zero -----------
  ZeroPat.count:=2;
  SetLength(zeropat.edges,  ZeroPat.count);
  zeropat.edges[0].Lt:='H';
  zeropat.edges[0].Min:=8;
  zeropat.edges[0].Max:=12;
  zeropat.edges[1].Lt:='L';
  zeropat.edges[1].Min:=6;
  zeropat.edges[1].Max:=10;
  zeropat.SumMin:=15;
  zeropat.SumMax:=20;

  //----One -----------

  OnePat.count:=4;
  SetLength(OnePat.edges,  OnePat.count);
  OnePat.edges[0].Lt:='H';
  OnePat.edges[0].Min:=2;
  OnePat.edges[0].Max:=9;
  OnePat.edges[1].Lt:='L';
  OnePat.edges[1].Min:=2;
  OnePat.edges[1].Max:=9;
  OnePat.edges[2].Lt:='H';
  OnePat.edges[2].Min:=2;
  OnePat.edges[2].Max:=9;
  OnePat.edges[3].Lt:='L';
  OnePat.edges[3].Min:=2;
  OnePat.edges[3].Max:=9;
  OnePat.SumMin:=15;
  OnePat.SumMax:=25;

  //----Pilot -----------

  PilotPat.count:=4;
  SetLength(PilotPat.edges,  PilotPat.count);
  PilotPat.edges[0].Lt:='H';
  PilotPat.edges[0].Min:=10;
  PilotPat.edges[0].Max:=14;
  PilotPat.edges[1].Lt:='L';
  PilotPat.edges[1].Min:=3;
  PilotPat.edges[1].Max:=9;
  PilotPat.edges[2].Lt:='H';
  PilotPat.edges[2].Min:=5;
  PilotPat.edges[2].Max:=11;
  PilotPat.edges[3].Lt:='L';
  PilotPat.edges[3].Min:=6;
  PilotPat.edges[3].Max:=12;
  PilotPat.SumMin:=30;
  PilotPat.SumMax:=40;



End;

Function TForm1.CheckPattern(p:TPattern;kk:Integer):Boolean;
Var
    l:Array of string;
    i:Array of Integer;
    y:Integer;
    fl1,fl2:Boolean;
    s:Integer;
Begin
  result:=false;
  Setlength(l,p.count);
  Setlength(i,p.count);
  For y:=0 to p.count-1 do
   decode(pk[kk+y],l[y],i[y]);

  fl1:=true;
  For y:=0 to p.count-1 do
   fl1:= fl1 and (l[y]=p.edges[y].Lt);
  if not fl1 then exit;
  fl2:=true;
  for y:=0 to p.count-1 do
   fl2:= fl2 and IsBetween(i[y],p.edges[y].Min,p.edges[y].Max);

  s:=0;
  For y:=0 to p.count-1 do
   s:=s+i[y];

  fl1:=IsBetween(s,p.SumMin,p.SumMax);

  result:=fl2 and fl1;
End;

procedure TForm1.OpenWave;
Var l,rl:Integer;
    f: File of byte;
begin
 Assignfile(f,WaveName);
 reset(f);
 l:=filesize(f);
 //Setlength(Buf,L+10);
 Seek(f,44); //skip wave header
 blockread(f,buf,l-44,rl);
 fcount:=rl;
 closefile(f);
end;

function TForm1.WaveName: string;
begin

  Result := Fpath+'Wavs\'+Fname+'.wav';
end;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin

 OpenDialog1.InitialDir:=fpath+'Wavs\';
 if OpenDialog1.Execute then
 Begin
  Fname:=extractfilename(OpenDialog1.FileName);
  fname:=copy(fname,1,length(fname)-4);
  Firstpaint:=true;
  openwave;
  Paintbox1.Width:=Fcount*8+50;
  Paintbox1.repaint;
 End;
end;

Function TForm1.GetRatio:Real;
Begin
 result:=paintbox1.Height/paintbox1.width;
End;

Function TForm1.GetMax:real;
Begin
  result:=(paintbox1.Height-ident*2) / 255;
End;

//pilot = H12+L5+H8+L9 ~ 17*2    //D>30
//1 = H7+L3+H3+L5 ~ 18         //D<30
//0 = H10+L8 ~18 //D>40

//Starts with pilots then when found 1 starts data
//Data allways is 1 - 8 bits data - 0
//block ends with nine data zeroes then start over with pilot

Procedure TForm1.Decode(s:String;Var l:String;Var i:Integer);
Begin
  if s='' then
  Begin
    l:='E';
    i:=0;
    exit;
  End;

  l:=copy(s,1,1);
  i:=strtoint(copy(s,2,maxint));
End;

Function TForm1.IsBetween(t,min,max:Integer):Boolean;
Begin
  result:=(min<=t) and (t<=max);
End;

function TForm1.CheckPilot(kk:Integer): Boolean;
Var l1,l2,l3,l4:String;
    i1,i2,i3,i4:Integer;
    fl1,fl2:Boolean;
Begin
  result:=CheckPattern(Pilotpat,kk);
  exit;

  result:=false;
  decode(pk[kk],l1,i1);
  decode(pk[kk+1],l2,i2);
  decode(pk[kk+2],l3,i3);
  decode(pk[kk+3],l4,i4);
  fl1:= (l1='H') and (l3='H') and (l2='L') and (l4='L');
  if not fl1 then exit;
  fl2:= IsBetween(i1,10,14) and
        IsBetween(i2,3,9) and
        IsBetween(i3,5,11) and
        IsBetween(i4,6,12);
  fl1:=IsBetween(i1+i2+i3+i4,30,40);
  result:=fl2 and fl1;
End;

Var Checkheight:boolean=true;

function TForm1.CheckOne(kk:Integer): Boolean;
Var l1,l2,l3,l4:String;
    i1,i2,i3,i4:Integer;
    fl1,fl2:Boolean;
Begin
  result:=CheckPattern(Onepat,kk);
{  if not result then
  Begin
   decode(pk[kk],l1,i1);
   decode(pk[kk+1],l2,i2);
   decode(pk[kk+2],l3,i3);
   decode(pk[kk+3],l4,i4);
   fl1:= (l1='H') and (l3='H') and (l2='L') and (l4='L');
   if not fl1 then exit;
   if (i2+i3)<12 then
    result:=true;
  End;}
  exit;

  result:=false;
  decode(pk[kk],l1,i1);
  decode(pk[kk+1],l2,i2);
  decode(pk[kk+2],l3,i3);
  decode(pk[kk+3],l4,i4);
  fl1:= (l1='H') and (l3='H') and (l2='L') and (l4='L');
  if not fl1 then exit;
  fl2:= IsBetween(i1,2,9) and
        IsBetween(i2,2,9) and
        IsBetween(i3,2,9) and
        IsBetween(i4,2,9);
  fl1:=IsBetween(i1+i2+i3+i4,15,25);
  result:=fl2 and fl1;
End;

function TForm1.CheckZero(kk:Integer): Boolean;
Var l1,l2:String;
    i1,i2:Integer;
    fl1,fl2:Boolean;
Begin
  result:=CheckPattern(zeropat,kk);
  exit;
  result:=false;
  decode(pk[kk],l1,i1);
  decode(pk[kk+1],l2,i2);
  fl1:= (l1='H') and (l2='L');
  if not fl1 then exit;
  fl2:= IsBetween(i1,8,12) and
        IsBetween(i2,6,10);
  fl1:=IsBetween(i1+i2,15,20);
  result:=fl2 and fl1;
End;

Function Tform1.FindPilot:Integer;
var i:Integer;
    pcnt:Integer;
Begin
  pcnt:=0;
  i:=datastart;
 try
  While i<(Fcount-1) do
  Begin
    If checkpilot(i) then
    Begin
     inc(pcnt);
     inc(i,pilotpat.count);
     Continue;
    End
    else
    if checkOne(i) then
    Begin
      inc(i,Onepat.count);
      If pcnt>60 then
      Begin
       ODS2('pilot End at '+inttostr(pkd[i]));
       Exit;
      End;
    End;

    if pcnt>100 then
     ODS2('pilot Ended abnormally '+inttostr(pkd[i]));

    pcnt:=0;
    Inc(i);
  End;
 finally
  if i<(fcount-2) then
   DataStart:=i-4
  else
   DataStart:=-1;

  result:=Datastart;
 end;
End;

procedure TForm1.FindData;
Var i:Integer;
    unknowns:Integer;
    b:byte;

    Procedure ReadByte;
    Var k:Integer;
        IsOne:Boolean;
    Begin
      IsOne:=false;
      b:=0;
      For k:=1 to 8 do
      BEgin
       if Checkone(i) then
       Begin
         inc(i,onepat.count);
         IsOne:=true
       End
       else
       if CheckZero(i) then
       Begin
         inc(i,zeropat.count);
         IsOne:=False
       End
       else
       Begin
        ODS2('Error recon:'+inttostr(pkd[i]));
        inc(i,4);
        IsOne:=false
       End;

       if isone then
         b:=Setbit(b,Byte(8-k));
      End;
      if CheckZero(i) then
      Begin
         inc(i,zeropat.count);
      End
       else
       Begin
        ODS2('Error recon last zero:'+inttostr(pkd[i]));
        inc(i,zeropat.count);
       End;
    End;

   var l1:String;
       i1:Integer;
Begin
  i:=Datastart;
  unknowns:=0;
  While i<(Totalpeeks-1) do
  Begin
   if CheckOne(i) then
   Begin
    Inc(i,4);
    readbyte;
    data[savdat]:=b;
    inc(savdat);
    Ods(inttostr(pkd[i])+' - '+inttostr(b)+' ('+OrdToBinary(b)+')'+' = '+chr(b));
   End
   else
   Begin
    ODS2('Error recon First ONE:'+inttostr(pkd[i]));
    decode(pk[i],l1,i1);
    if l1='P' then //pilot
    Begin
     ODS2('Find Pilot');
     Break;
    End;
    inc(i);
   End;
  End;
  if i>=(Totalpeeks-1) then
   datastart:=-1 else
  Datastart:=i;
End;

Const TopSampl=5;

procedure TForm1.PaintMain(cnv:Tcanvas);
Var i:Integer;
    x,y,ox,oy:Integer;
    mx:real;
    invd:Integer;
    ValLow,ValHi:Integer;
    Low,hi:Integer;
    lowedge,hiedge:boolean;
    cnt,kount:Integer;

    Procedure FindXY(Const d:Integer);
    Begin
     x:=10+i*8;
     y:=Ident+((paintbox1.Height-ident)-trunc(d* mx));
    End;

    Procedure DoPaint(Const d:Integer);
    Begin
     FindXY(d);
     cnv.FillRect(rect(x-2,y-2,x+2,y+2));
     if i>0 then
     Begin
      cnv.MoveTo(ox,oy);
      cnv.LineTo(x,y);
     End;
     ox:=x;
     oy:=y;
    End;

    Procedure CheckEdge(var HiEd,LoEd:Boolean);
    Var k:Integer;
    Begin
      LoEd:=true;
      HiEd:=true;
      For k:=1 to TopSampl do
      Begin
       LoEd:=LoEd And ((buf[i]<=buf[i-k]) and (buf[i]<=buf[i+k]));
       HiEd:=HiEd And ((buf[i]>=buf[i-k]) and (buf[i]>=buf[i+k]));
      End;
    End;

    Procedure FindhiLo;
    var dif:Integer;
    Begin
      inc(cnt);
      if ValLow>buf[i] then
      Begin
       vallow:=buf[i];
       low:=i;
      End;
      if ValHi<buf[i] then
      Begin
       valhi:=buf[i];
       hi:=i;
      End;
      dif:=valhi-vallow;
      if valhi=-500 then
           dif:=0;
      if vallow=500 then
           dif:=0;


      if (i<2) or (dif<3) then exit;
      CheckEdge(HiEdge,LowEdge);
{      if (buf[i]<=buf[i-1]) and (buf[i]<=buf[i+1])
        and
        (buf[i]<=buf[i-2]) and (buf[i]<=buf[i+2]) then
       lowedge:=true
      else
       lowedge:=false;
      if (buf[i]>=buf[i-1]) and (buf[i]>=buf[i+1])
        and
        (buf[i]>=buf[i-2]) and (buf[i]>=buf[i+2]) then
       hiedge:=true
      else
       hiedge:=false;}

      if cnt<2 then exit;
      findxy(buf[i]);


      if lowedge then
      Begin
         dif:=valhi-vallow;
         cnv.TextOut(x-5,y+5,'L'+inttostr(cnt));
         cnv.TextOut(x-5,y+25,'D'+inttostr(dif));
         if firstpaint then
         Begin
          pk[kount]:='L'+inttostr(cnt);
          pkd[kount]:=i;
          pkL[kount]:=dif;//'D'+inttostr(dif);
          if cnt>400 then
          Begin
            inc(kount);
            pk[kount]:='P0';
          End;
         end;
         hi:=-1;
         valhi:=-500;
         cnt:=0;
         inc(kount);
      End;
      if hiedge then
      Begin
         cnv.TextOut(x-5,y-35,'H'+inttostr(cnt));
         cnv.TextOut(x-5,y-20,'D'+inttostr(dif));
         if firstpaint then
         Begin
          pk[kount]:='H'+inttostr(cnt);
          pkd[kount]:=i;
          pkL[kount]:=dif;//'D'+inttostr(dif);
          if cnt>400 then
          Begin
            inc(kount);
            pk[kount]:='P0';
          End;
         End;
         low:=-1;
         vallow:=500;
         cnt:=0;
         inc(kount);
      End;

    End;

    var st,send:integer;

Begin
   ValLow:=500;Valhi:=-500;
   Low:=-1;hi:=-1;
   if Firstpaint then
   Begin
    st:=0;
    send:=fcount-1;
   End
   Else
   Begin

    st:= Scrollbox1.HorzScrollBar.Position div 8-10;
    send:=st+Scrollbox1.width div 8+10;
   End;

  if st<0 then st:=0;
  if send>fcount-1 then
   send:=fcount-1;


   cnv.Pen.Width:=3;
   cnv.Pen.color:=clblue;
   cnv.Brush.Color:=clblue;
   cnv.Brush.Style:=bssolid;
   cnv.MoveTo(st*8,2+ident);
   cnv.lineto(send*8,2+ident);
   cnv.MoveTo(st*8,paintbox1.Height-2-ident);
   cnv.lineto(send*8,paintbox1.Height-2-ident);

   cnv.Pen.Color:=clBlue;
   cnv.Brush.Color:=clyellow;
   For i:=(st) to (send) do
   Begin
    cnv.moveto(10+i*8,paintbox1.Height-ident);
    cnv.Lineto(10+i*8,paintbox1.Height-5-ident);
    if i mod 10=0 then
     cnv.TextOut(10+i*8-5,paintbox1.Height-ident,inttostr(i));
   End;

   cnv.Pen.Color:=clGreen;
   cnv.Brush.Color:=clgreen;
   cnv.MoveTo(st*8,paintbox1.Height div 2);
   cnv.lineto(send*8,paintbox1.Height div 2);



   cnv.Pen.Color:=clred;
   cnv.Brush.Color:=clred;
   cnv.Pen.Width:=1;

   mx:=getmax;
   if fcount=0 then
   Begin
    for i:=0 to 255 do
     DoPaint(i);
    for i:=0 to 255 do
     DoPaint(128);
    for i:=0 to 255 do
     DoPaint(255);
    for i:=0 to 255 do
     DoPaint(0);

   End;

   kount:=0;


  try
   For i:=st to send do
   Begin
     invd:=buf[i];
     DoPaint(invd);
     FindhiLo;
   End;

   if Firstpaint then
    totalpeeks:=kount;

  except

  end; 
End;

procedure TForm1.PaintBox1Paint(Sender: TObject);
Var cnv:TCanvas;
begin
 Cnv:=Paintbox1.canvas;
 PaintMain(cnv);
 firstPaint:=false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

 paintbox1.width:=255*10;
 ident:=15;
end;

procedure TForm1.Button2Click(Sender: TObject);
var l1:String;
    i1:Integer;
    doexit:Boolean;
begin
 memo1.lines.clear;
 Datastart:=0;

 repeat
  FindPilot;
  if Datastart>-1 then
  Begin
    FindData;
    decode(pk[Datastart],l1,i1);
    doexit:= l1<>'P';
  End
  else
   doexit:=true;
 until doexit;
 SaveNBFile;
end;

procedure TForm1.SaveNBFile;
Var f:File of byte;
    i:Integer;
    k:byte;
begin
  if savdat=0 then exit;
  Assignfile(f,BinName);
  Rewrite(f);
  k:=0;
//  Write(f,i);
  BlockWrite(f,Data,savdat,i);
  CloseFile(f);
end;

function TForm1.BinName: string;
begin

  Result := Fpath+'WAVS\'+Fname+'.bin';
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
 savepatterns;
end;

procedure TForm1.LoadPatterns;
Var infl:TIniFile;

      procedure LoadPattern(nm:String;var p:TPattern);
      var    y:Integer;
      Begin
       p.count:=infl.ReadInteger('Main'+nm,'Count',p.count);
       p.SumMin:=infl.ReadInteger('Main'+nm,'SumMin',p.SumMin);
       p.SumMax:=infl.ReadInteger('Main'+nm,'SumMax',p.SumMax);
       SetLength(p.edges,p.count);
       For y:=0 to p.count-1 do
       Begin
        p.edges[y].Lt:=infl.ReadString('Item'+nm+inttostr(y),'Lt',p.edges[y].Lt);
        p.edges[y].Min:=infl.ReadInteger('Item'+nm+inttostr(y),'Min',p.edges[y].Min);
        p.edges[y].Max:=infl.ReadInteger('Item'+nm+inttostr(y),'Max',p.edges[y].Max);
       End;

      End;

Begin
  infl:=TIniFile.Create(fpath+'patterns.ini');
  LoadPattern('_Pilot',PilotPat);
  LoadPattern('_One',OnePat);
  LoadPattern('_Zero',ZeroPat);
  infl.free;
End;


procedure TForm1.FormCreate(Sender: TObject);
begin
// Setlength(buf,200);
 if Fileexists(fpath+'patterns.ini') then
  loadpatterns
 else
 Setpatterns;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if Fileexists(fpath+'patterns.ini') then
  loadpatterns;
end;

procedure TForm1.Button5Click(Sender: TObject);
var t,tt,k:Integer;
begin
 try
  t:=strtoint(edit1.text);
 except
  t:=0;
 end;
// k:=(scrollbox1.width-10) div 8;
 tt:=t *8;
 scrollbox1.HorzScrollBar.Position:=tt;
end;

end.
