unit NBDigit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,CustDetEngine;


type


  Tfnbdig = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    PaintBox1: TPaintBox;
    Button4: TButton;
    Button5: TButton;
    Label3: TLabel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label5: TLabel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    StatusBar1: TStatusBar;
    Button13: TButton;
    Label6: TLabel;
    Button15: TButton;
    Button16: TButton;
    StepBar: TTrackBar;
    Button17: TButton;
    Edit1: TEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Sens: TTrackBar;
    Label7: TLabel;
    Panel2: TPanel;
    ListBox1: TListBox;
    Panel3: TPanel;
    Label8: TLabel;
    Edit3: TEdit;
    ListBox2: TListBox;
    Edit4: TEdit;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Bevel1: TBevel;
    Button3: TButton;
    Button9: TButton;
    Label1: TLabel;
    frmsampl: TEdit;
    lenSampl: TEdit;
    Label2: TLabel;
    Bevel2: TBevel;
    Button14: TButton;
    Edit2: TEdit;
    Button18: TButton;
    Button19: TButton;
    TabSheet2: TTabSheet;
    ListBox3: TListBox;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button30: TButton;
    lblprc: TLabel;
    Button31: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox2: TCheckBox;
    Button29: TButton;
    Bevel5: TBevel;
    btn: TButton;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1Click(Sender: TObject);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StepBarChange(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure button32Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure btnClick(Sender: TObject);
  private
    { Private declarations }
        startFound:Boolean;
    Selbd:TByteDetected;
    Selpbit:PBitDetected;

    Fix:TStringlist;
    f:TFileStream;
    ms:TMemoryStream;
//    FCurrentSampl: Integer;
    ByteList:TStringList;
    SelStart: Integer;
    SelEnd: Integer;
    StartX: Integer;
    EndX: Integer;
    EndSampl: Integer;
    Step:Integer;
    Problem:Boolean;
    fixpos: Integer;
    Currentbyte: Integer;
    mousesample: Integer;
    LastBD: TByteDetected;
    MarkByte: TByteDetected;
    Finished: Boolean;
    ProgSaved: Boolean;
    ISOnEdge: Boolean;
    EdgeDown: Integer;
    ByteDetecting: Boolean;
    LastLen: Integer;
    procedure PaintSamples;
    procedure PaintSelection;
    procedure SetCurrentSampl(Value: Integer);
    procedure DetectAll;
    procedure Info(s: String);
    procedure DetectBytes;
    function FindPilot: boolean;
    procedure PaintBytes;
    procedure FindInList;
    function GetByteForSample(sml:Integer): Integer;
    function GetBitForSample(sml:Integer;Var byt:Integer): Integer;
    procedure PaintMark;
    procedure PaintByte(bd:TByteDetected);
    procedure ClearListFrom(idx: Integer);
    procedure PaintSelBit;
    procedure PaintSelBitDrag;
    procedure LoadPattern(Pat:TCustomPattern;fn:String);
    procedure SavePattern(Pat:TCustomPattern;fn:String);
    procedure SetFromPattern(pat: TCustomPattern);
    function GetCurrentSampl: Integer;
    function GetPilotSearch: Boolean;
    procedure SetPilotSearch(Value: Boolean);
  public
    procedure OpenFile(FN:String);
    procedure CloseFile;
    procedure SelectFile;
    procedure Select;
    procedure SaveProgram;
    procedure SaveFix;
    function GetSampleAtPosition(x:Integer): Integer;
    procedure ClearSelection;
    procedure SetDefaultPatterns;
    procedure LoadPatterns;
    function GetFixedValue(b:Byte): Byte;
    function AppPath: string;
    function Getfn: string;
    property CurrentSampl: Integer read GetCurrentSampl write SetCurrentSampl;
    property PilotSearch: Boolean read GetPilotSearch write SetPilotSearch;
    { Public declarations }
  end;



var
  fnbdig: Tfnbdig;

implementation

uses NBFixSel,DetEngine1,EdgeDetEngine;

procedure Tfnbdig.OpenFile(FN:String);
begin
 f:=TFileStream.Create(FN,fmOpenRead);
 f.Position:=45;
 DigitDetect.Init(f,Bytelist);
end;

procedure Tfnbdig.CloseFile;
begin
 f.Free;
 f:=nil;
end;

procedure Tfnbdig.SelectFile;
Var fn:String;
begin
  If OpenDialog1.execute then
  Begin
   OpenFile(OpenDialog1.filename);
   fn:=changefileext(OpenDialog1.filename,'.fix');
   fixpos:=0;
   If fileexists(fn) then
    fix.loadfromfile(fn);
   fn:=changefileext(OpenDialog1.filename,'.pil');
   If fileexists(fn) then
    listbox2.Items.LoadFromFile(fn);
   edit3.text:=Inttostr(listbox2.items.count); 
  End;
end;

{$R *.DFM}

procedure Tfnbdig.Button1Click(Sender: TObject);
begin
 SelectFile;
 LoadPatterns;
 ProgSaved:=false;
 Paintbox1.Repaint;
end;

procedure Tfnbdig.PaintBox1Paint(Sender: TObject);
begin
 if  not assigned(f) then exit;
 try
  paintbox1.canvas.pen.Color:=clblack;
  PaintSamples; //From CurrentSampl
  PaintSelection;//
  PaintBytes;
  PaintMark;
  PaintSelBit;
  PaintSelBitDrag;
 Finally
 End;
end;

procedure Tfnbdig.PaintBytes;
Var Cnv:tCanvas;
    sml:Integer;
    i:integer;
    bd:TByteDetected;
    OldColor:TColor;
    OldW:Integer;
Begin
  If bytelist.Count=0 then exit;
  i:=0;
  repeat
    sml:=Strtoint(bytelist[i]);
    inc(i);
  Until  (currentsampl<=sml) or (i=bytelist.count);

  dec(i,2);
  if i<0 then i:=0;
  Currentbyte:=i;
  cnv:=paintbox1.canvas;
  OldColor:=cnv.pen.color;
  Oldw:=cnv.pen.Width;


  repeat
     bd:=TBytedetected(bytelist.objects[i]);
     PaintByte(bd);
     inc(i);
     if i>=Bytelist.count then break;
  Until bd.ToSampl>(currentsampl+(Paintbox1.Width) div 5);
  cnv.pen.Width:=Oldw;

  cnv.pen.color:=OldColor;
End;

procedure Tfnbdig.PaintSamples;
Var Cnv:TCanvas;
    i:Integer;
    b:Byte;
    x,y:integer;
    Lastx,Lasty:integer;
    rc:Trect;
    cnt:integer;
    buf:Array[0..10] of byte;

    ScaleY:real;
    DownGap:integer;
    OldColor:TColor;
    OldSz:integer;
    s:String;
    Lastb:Integer;
Begin
 Lastb:=127;
 cnv:=Paintbox1.canvas;
 f.Position:=custdetEngine.currentsampl;
 x:=0;y:=0;
 Lastx:=-1;
 DownGap:=50;
 Scaley:=(paintbox1.height - DownGap) / 255;
 StartX:=custdetEngine.currentsampl;

 y:=paintbox1.height-DownGap-Trunc(127*Scaley);
 cnv.MoveTo(x,y);
 x:=Paintbox1.Width;
 cnv.LineTo(x,y);
 x:=0;y:=0;

 oldsz:=Paintbox1.Font.Size;
 For i:=0 to Paintbox1.Width do
 Begin
  if f.Position>=f.size then break;
  cnt:=1;
  f.Read(buf,cnt);
  b:=buf[0];
  //New code
  if checkbox2.checked then
   b:=GetFixedValue(b);

  //End New code
  y:=paintbox1.height-DownGap-Trunc(b*Scaley);

  rc.Left:=x-2;
  rc.Right:=x+2;
  rc.top:=y-2;
  rc.Bottom:=y+2;
  cnv.FillRect(rc);
  If lastx>0 then
  Begin
   cnv.MoveTo(Lastx,LastY);
   cnv.LineTo(x,y);
  End;
  Lastx:=x;Lasty:=y;
  if f.position mod 10=0 then
  Begin
   cnv.Font.Color:=clWhite;
   s:=inttostr(f.position);
   cnv.TextOut(x-cnv.TextWidth(s) div 2 ,Paintbox1.height-30,s);
   OldColor:=cnv.pen.color;
   cnv.pen.color:=clBlue;
   cnv.MoveTo(x,Paintbox1.height-33);
   cnv.LineTo(x,Paintbox1.height-53);
   cnv.pen.color:=OldColor;
  End;
  if f.Position+1>=f.size then break;
  inc(x,Step);
 End;
 EndX:=LastX;
 EndSampl:=F.Position;
 Paintbox1.Font.Size:=oldsz;

End;

procedure Tfnbdig.PaintSelection;
Var sts,ste:Integer;
    x1,x2:integer;

    cnv:tCanvas;
    OldColor,OldW:Integer;
Begin
  If CurrentSampl>=SelEnd then exit;

  sts:=Selstart-Currentsampl-1;
  if sts<0 then sts:=0;

  x1:=sts*Step;

  ste:=SelEnd-Currentsampl-1;
  x2:=ste*Step;
  if x2>paintbox1.width then
   x2:=Paintbox1.width;

  cnv:=Paintbox1.canvas;
  OldColor:=cnv.Pen.Color;
  Oldw:=cnv.Pen.Width;
  cnv.Pen.Color:=clRed;
  cnv.Pen.Width:=4;
  cnv.MoveTo(x1,paintbox1.height-10);
  cnv.LineTo(x2,paintbox1.height-10);

  cnv.Pen.Width:=2;
  cnv.MoveTo(x1,paintbox1.height-10);
  cnv.LineTo(x1,0);
  cnv.MoveTo(x2,paintbox1.height-10);
  cnv.LineTo(x2,0);



  cnv.Pen.Color:=OldColor;
  cnv.Pen.Width:=Oldw;

End;

procedure Tfnbdig.SetCurrentSampl(Value: Integer);
Var prc:Real;
begin
  if Value<45 then Value:=45;
  if Value>=F.size then Value:=F.size;
//  FCurrentSampl := Value;
  custdetEngine.currentsampl:=Value;
  Label3.caption:=Inttostr(Value);

  prc:=CurrentSampl*100/f.size;
  lblprc.caption:=Format('%.2f %%',[prc]);
end;

{ TByteDetected }

procedure Tfnbdig.FormCreate(Sender: TObject);
Var i:Integer;
begin
 Doublebuffered:=true;
 Bytelist:=TStringList.Create;
 Step:=5;
 ms:=TMemoryStream.Create;
 Fix:=TStringlist.create;
 Lastbd:=nil;
 MarkByte:=TByteDetected.create;
 MarkByte.AddAllbits;
 EdgeDown:=-1;

 PilotPattern:=TCustomPattern.create(Self);
 OnePattern:=TCustomPattern.create(Self);;
 ZeroPattern:=TCustomPattern.create(Self);

// DigitDetect:=TDetDigEngine1.Create;
 DigitDetect:=TEdgeDetEngine.Create;

 SetDefaultPatterns;
 LoadPatterns;
// paintbox1.ControlStyle:= paintbox1.ControlStyle+[csOpaque];
end;

procedure Tfnbdig.FormDestroy(Sender: TObject);
begin
 fix.free;
 Bytelist.free;
 f.free;
 ms.free;
end;

procedure Tfnbdig.Button2Click(Sender: TObject);
begin
 step:=StepBar.position;
 Paintbox1.Repaint;
end;

procedure Tfnbdig.Button4Click(Sender: TObject);
begin
 Currentsampl:=CurrentSampl-Paintbox1.width div 5;
 Paintbox1.Repaint;
end;

procedure Tfnbdig.Button6Click(Sender: TObject);
begin
 Currentsampl:=CurrentSampl-1;
 Paintbox1.Repaint;
end;


procedure Tfnbdig.Button5Click(Sender: TObject);
begin
 Currentsampl:=CurrentSampl+Paintbox1.width div 5;
 Paintbox1.Repaint;
end;

procedure Tfnbdig.Button7Click(Sender: TObject);
begin
 Currentsampl:=CurrentSampl+1;
 Paintbox1.Repaint;
end;


procedure Tfnbdig.Select;
Var SelectStart:Integer;
    SelectEnd:Integer;
begin
  SelectStart:=strtoint(frmsampl.text);
  SelectEnd:=SelectStart+strtoint(lensampl.text);
  CurrentSampl:=SelectStart;
  SelStart:=SelectStart;
  SelEnd:=SelectEnd;
  Paintbox1.Repaint;
end;

procedure Tfnbdig.Button3Click(Sender: TObject);
begin
 Select;
 Sensitivity:=Sens.Position;
 DigitDetect.PilotSearch:=CheckBox4.checked;
 currentsampl:=Strtoint(frmsampl.text);
 DigitDetect.DetectFrom(currentsampl);
 frmsampl.text:=inttostr(custdetEngine.currentsampl);
 label4.caption:=DigitDetect.Mes;
 Repaint;
end;



procedure Tfnbdig.Button8Click(Sender: TObject);
begin
 Sensitivity:=Sens.Position;
 ClearSelection;
 Startfound:=false;
 DetectAll;
 ProgSaved:=false;
end;

procedure Tfnbdig.Info(s:String);
Begin
  Listbox1.items.Insert(0,s);
End;


Function Tfnbdig.FindPilot:boolean;
Var pilcnt:Integer;
    Last:Integer;
    pilcnt2:Integer;
Begin
 ByteDetecting:=false;
 pilcnt:=0;
 Result:=False;
 pilcnt2:=0;
 Pilotsearch:=true;
 Finished:=false;
 Sensitivity:=2;
 repeat
  Last:=CurrentSampl;
  Selstart:=CurrentSampl;
  DigitDetect.DetectFrom(Selstart);
  Currentsampl:=custdetengine.Currentsampl;
  If (DigitDetect.bitvalue=255) or (DigitDetect.BitValue=0) then
  Begin
     pilcnt2:=0;
     Inc(PilCnt);
     CurrentSampl:=CurrentSampl+DigitDetect.LastLen;
     DigitDetect.FixEdge;
  End
  else
  If DigitDetect.bitvalue=1 then
  Begin

     if pilcnt>10 then
     Begin
      CurrentSampl:=CurrentSampl+OneLen;
      DigitDetect.FixEdge;
      Result:=true;
      break;
     End
     Else
     Begin
      CurrentSampl:=CurrentSampl+1;
     End;
  End
  else
  Begin
    CurrentSampl:=CurrentSampl+1;
    inc(pilcnt2);
  End;
  if pilcnt2>4 then
  Begin
   pilcnt:=0;
   pilcnt2:=0;
  End;

  label5.caption:=inttostr(pilcnt)+' Pilots';

  if  CurrentSampl mod 250=0 then
   Paintbox1.Repaint;

  Application.Processmessages;
 Until (Currentsampl>=f.size) or Finished;
 Sensitivity:=Sens.Position;

 If Finished then
  Info('Canceled by User');
 Pilotsearch:=false;
End;



procedure Tfnbdig.DetectBytes;
Var
    i:Integer;
    ByteStart:Integer;
    ByteEnd:Integer;
    bd:TByteDetected;
    s:String;


    Procedure DeleteLastByte;
    Begin
      If bytelist.count>0 then
      Begin
         Bytelist.objects[bytelist.count-1].free;
         bytelist.Delete(bytelist.count-1);
         if lastbd<>nil then
         Begin
          If bytelist.count>0 then
           lastbd:=TByteDetected(BYtelist.Objects[bytelist.count-1])
          Else
           Lastbd:=nil; 
         End;
      End;
    End;

    Procedure NewByte;
    Begin
      bd:=TByteDetected.create;
      Bytelist.addObject(inttostr(ByteStart),bd);
      bd.ByteNo:=Bytelist.Count;
      bd.AddAllBits;
      bd.SetBitsFrom(Bytestart);
      Lastbd:=bd;
    End;

Var p:Integer;
Begin
 ByteDetecting:=true;
 i:=1;
 If Lastbd=nil then
 Begin
  ByteStart:=CurrentSampl-OneLen;
  p:=GetByteForSample(CurrentSampl);
  if p<>-1 then
   bd:=TBytedetected(Bytelist.objects[p])
  else
   NewByte;
 End
 Else
 Begin
   ByteStart:=Lastbd.FromSampl;
   bd:=Lastbd;
 End;
 Finished:=false;
 Repeat
  if bd.Detected then
  Begin
   CurrentSampl:=bd.ToSampl;
   p:=GetByteForSample(CurrentSampl+Lastlen);
   if p<>-1 then
    bd:=TBytedetected(Bytelist.objects[p])
   Else bd:=nil;
   ByteStart:=CurrentSampl;
   if bd=nil then
     NewByte;
   continue;  
  End;
  bd.DoDetect;
  p:=bytelist.indexofobject(bd);
  if p<>-1 then
   bytelist[p]:=inttostr(bd.FromSampl);


  if not bd.Detected then break;
  If bd.Value>31 then
   Info(Format('%d - %d   --->  %d = %s   Byte No:%d',[bd.fromsampl,bd.tosampl,bd.value,chr(bd.value),bd.byteno]))
  else
   Info(Format('%d - %d   --->  %d  Byte No:%d',[bd.fromsampl,bd.tosampl,bd.value,bd.byteno]));
  CurrentSampl:=bd.ToSampl;


  DigitDetect.FixEdge;
  ByteStart:=CurrentSampl;
  NewByte;
  if  CurrentSampl mod 200=0 then
   Paintbox1.Repaint;
  Application.Processmessages;
 until false or Finished;

 if finished then
 Begin
   Info('*****User break*****');
   Problem:=true;
   Exit;
 End;

{ if bd.error<>'' then
 Begin
   Problem:=true;
   Info('*****Problem*****');
   s:='Detecting Byte at '+inttostr(bd.FromSampl);
   Info(s);
   s:=bd.Error;
   Info(s);
   Problem:=true;
 End;
 }
 If DigitDetect.CheckEndOfBlock Then
 Begin
    DeleteLastByte;
    Info('*****Block End*****');
    Problem:=false;
 End
 Else
 Begin
   Problem:=true;
   Info('*****Problem*****');
   s:='Detecting Byte at '+inttostr(bd.FromSampl);
   Info(s);
   s:=bd.Error;
   Info(s);
 End;
 ByteDetecting:=false;
End;

procedure Tfnbdig.DetectAll;
Var pilcnt:Integer;
    Last:Integer;
    pilcnt2:Integer;
    k:integer;
Begin
 k:=1;
 Repeat
   Info('Finding Pilot End ...');
   if not startfound then
   Begin
    StartFound:=FindPilot;
    If startfound then
    Begin
     currentsampl:=currentsampl-4;
     Info('Pilot End Found at'+ inttostr(currentsampl-Onelen));
     if not checkbox1.Checked then
     Begin
      Listbox2.items.add(inttostr(currentsampl-onelen));
      inc(k);
      edit3.text:=inttostr(k);
     End;
    End
    Else
    Begin
      Info('Error detecting pilot end');
      Break;
    End;
   End;
   Info('Detecting Bytes ...');
   DetectBytes;
   if not problem then
   Begin
    info('-------------------');
    info('Next Block');
    Lastbd:=nil;
    StartFound:=false;
   End;
 Until problem or (currentsampl>=f.size);
 If (not problem) or ((not startfound) and (bytelist.count>0))then
 Begin
   Info('Program Digitization Finished OK');
 //  SaveProgram;
//   ms.clear;
 End
 Else
  Info('Problems During Digitization');
 if lastbd<>nil then
  currentsampl:=Lastbd.fromsampl;
 Paintbox1.Repaint;
End;

procedure Tfnbdig.SaveProgram;
Var fn:String;
begin
  if not checkbox3.checked then
   fn:=ChangeFileExt(opendialog1.FileName,'.bas')
  else
   fn:=ChangeFileExt(opendialog1.FileName,'')+inttostr(listbox2.itemindex)+'.bas';
  ms.SaveToFile(fn);
  ms.Clear;
  ProgSaved:=true;
  if checkbox3.checked then
   button17click(nil);
end;

procedure Tfnbdig.Button9Click(Sender: TObject);
begin
 Case DigitDetect.bitvalue of
   0:Begin
      Currentsampl:=Currentsampl+ZeroLen;
      DigitDetect.FixEdge;
     End;
   1:
     Begin
      Currentsampl:=Currentsampl+OneLen;
      DigitDetect.FixEdge;
     End;
   255:
     Begin
      Currentsampl:=Currentsampl+PilotLen;
      DigitDetect.FixEdge;
     End
  else
   Begin
    Currentsampl:=Currentsampl+1;
   End ;
 End;

 frmsampl.Text:=inttostr(Currentsampl);

 Button3Click(sender);
end;

procedure Tfnbdig.SaveFix;
Var fn:String;
begin
   fn:=changefileext(OpenDialog1.filename,'.fix');
   fix.Savetofile(fn);

end;

procedure Tfnbdig.ListBox1DblClick(Sender: TObject);
var s:String;
    k:Integer;
    sml:Integer;
begin
 if listbox1.itemindex=-1 then exit;
 s:=Listbox1.items[listbox1.itemindex];
 k:=pos('-',s);
 if k>0 then
 Begin
   s:=copy(s,1,k-2);
   try
    frmsampl.text:=s ;
    Label1Click(nil);
   except

   end;
 End;
end;

procedure Tfnbdig.Label1Click(Sender: TObject);
begin
  CurrentSampl:=strtoint(frmsampl.text);
  Paintbox1.Repaint;
end;

procedure Tfnbdig.FindInList;
var i:integer;
Begin
  For i:=listbox1.items.count-1 downto 0 do
  Begin
     if pos(frmsampl.text,listbox1.items[i])>0 then
     Begin
       listbox1.itemindex:=i;
       break;
     End;
  End;
End;

procedure Tfnbdig.Button10Click(Sender: TObject);
begin
  Currentbyte:=currentbyte;
  if currentbyte<0 then
   currentbyte:=0;
  frmsampl.text:=inttostr(TByteDetected(bytelist.objects[currentbyte]).FromSampl);
  Label1Click(nil);
  findinlist;
end;

procedure Tfnbdig.Button11Click(Sender: TObject);
Var i:integer;
begin
  Currentbyte:=currentbyte+2;
  if currentbyte>=Bytelist.count-1 then
   currentbyte:=Bytelist.count-1;
  frmsampl.text:=inttostr(TByteDetected(bytelist.objects[currentbyte]).FromSampl);
  Label1Click(nil);
  FindInList;
end;

procedure Tfnbdig.Button12Click(Sender: TObject);
Var bd:TByteDetected;
begin
 Sensitivity:=Sens.Position;
 ClearSelection;
 Progsaved:=False;
 if bytelist.count=0 then exit;
 bd:=TBytedetected(bytelist.objects[bytelist.count-1]);
 Currentsampl:=bd.ToSampl+1;
 DigitDetect.fixedge;
 Startfound:= not DigitDetect.CheckEndOfBlock;
 if Startfound then
  Currentsampl:=bd.ToSampl+1+onelen;
 DetectAll;
end;

function Tfnbdig.GetSampleAtPosition(x:Integer): Integer;
var ln:Integer;
    sml:Integer;
begin
  ln:=x;
  sml:=ln div step+1;
{  if ln mod step>(step div 2) then
   sml:=sml+1;}
  result:=sml+ Currentsampl;
end;

function Tfnbdig.GetByteForSample(sml:Integer): Integer;
var
    i:Integer;
    p:Integer;
    bd:TByteDetected;
begin
 p:=-1;
 bd:=nil;
 For i:=0 to bytelist.Count -1 do
 Begin
    bd:=TBytedetected(Bytelist.objects[i]);
    if bd.FromSampl>=sml then
    Begin
      p:=i-1;
      Break;
    End;
 End;
 if (p=-1) and Assigned(bd) and (bd.ToSampl>sml) then
  p:=bytelist.Count -1;
 result:=p;
end;

function Tfnbdig.GetBitForSample(sml:Integer;Var byt:Integer): Integer;
var
    i:Integer;
    p:Integer;
    bd:TByteDetected;
    pbitd:PBitDetected;
begin
 Result:=-1;
 byt:=GetByteForSample(sml);
 if byt=-1 then exit;
 bd:=TByteDetected(Bytelist.objects[byt]);
 p:=-1;
 pbitd:=nil;
 For i:=0 to bd.BitList.Count -1 do
 Begin
    pbitd:=Bd.bitlist[i];
    if pbitd.FromSampl>=sml then
    Begin
      p:=i-1;
      Break;
    End;
 End;
 if (p=-1) and assigned(pbitd) and (pbitd.ToSample>sml) then
   p:=bd.BitList.Count -1;
   
 result:=p;
end;


procedure Tfnbdig.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
Var Bytepos:Integer;
    bitpos:Integer;
    bd:TByteDetected;
    pbit:PBitDetected;

    Function IsOnBitEdge:Boolean;
    Begin
      result:= (selpbit.FromSampl-1<=Mousesample) and
               (selpbit.FromSampl+1>=Mousesample) ;
      result:= result or (selpbit.toSample-1<=Mousesample) and
               (selpbit.toSample+1>=Mousesample) ;

    End;

Var s:String;
begin
  mousesample:=GetSampleAtPosition(x);
  statusbar1.panels[0].text:='Sample = '+inttostr(mousesample);
  if (selpbit<>nil) and (EdgeDown=-1) then
  Begin
    IsOnEdge:=IsOnBitEdge;
    if IsOnEdge then
     paintbox1.cursor:= crhSplit
    else
    paintbox1.cursor:= crDefault;
  End;

  PaintBox1.hint:=inttostr(mousesample);
  statusbar1.panels[statusbar1.Panels.Count-1].text:='';
  paintbox1.cursor:= crDefault;
  if bytelist.count=0 then exit;
  if edgedown<>-1 then paintbox1.repaint;

  //Mouse move info on Byte and nit
  bitpos:=GetBitForSample(mousesample,Bytepos);
  if bytepos=-1 then exit;
  if bitpos=-1 then exit;
  bd:=TBYteDetected(Bytelist.objects[bytepos]);
  pbit:=bd.bitlist[bitpos];

  s:=Format('Byte = %d - Bit = %d - Bitvalue = %d',[BytePos+1,bitpos,pbit.value]);
  s:=s+Format(' (%d - %d)',[pbit.fromsampl,pbit.tosample]);
  statusbar1.panels[statusbar1.Panels.Count-1].text:=s;

end;

procedure Tfnbdig.PaintBox1Click(Sender: TObject);
Var Bytepos:Integer;
    bitpos:Integer;
begin
  If EdgeDown<>-1 then exit;
  
  edit2.text:=inttostr(mousesample);
  selbd:=nil;selpbit:=nil;
  if bytelist.count=0 then exit;
  bitpos:=GetBitForSample(mousesample,Bytepos);
  if bytepos=-1 then exit;
  if bitpos=-1 then exit;
  selbd:=TBYteDetected(Bytelist.objects[bytepos]);
  selpbit:=selbd.bitlist[bitpos];
  statusbar1.panels[1].text:='Byte = '+inttostr(BytePos+1)+' - Bit = '+inttostr(bitpos)+
   ' - Bitvalue ='+inttostr(selpbit.value);
  Paintbox1.Repaint;
end;

procedure Tfnbdig.PaintBox1DblClick(Sender: TObject);
Var Bytepos:Integer;
    bitpos:Integer;
begin
  ProgSaved:=false;
  selbd:=nil;selpbit:=nil;
  if bytelist.count=0 then exit;
  bitpos:=GetBitForSample(mousesample,Bytepos);
  if bytepos=-1 then exit;
  if bitpos=-1 then exit;
  selbd:=TBYteDetected(Bytelist.objects[bytepos]);
  selpbit:=selbd.bitlist[bitpos];
  if selpbit.value=0 then
   selpbit.value:=1
  else
   selpbit.value:=0;
  selbd.Detected:=true;
  statusbar1.panels[1].text:='Byte = '+inttostr(BytePos)+' - Bit = '+inttostr(bitpos)+
   ' - Bitvalue ='+inttostr(selpbit.value);
  Paintbox1.Repaint; 
end;

procedure Tfnbdig.Button13Click(Sender: TObject);
Var frmbyted:tfrmbyted;
begin
 if not assigned(selbd) then exit;
 ProgSaved:=false;
 frmbyted:=tfrmbyted.create(Self);
 frmbyted.ShowByte(selbd);
 if frmbyted.ShowModal=mrok then paintbox1.Repaint;
 frmbyted.free;
end;

procedure Tfnbdig.Button14Click(Sender: TObject);
Var i:Integer;
    bt:PBitDetected;
    sml:Integer;
begin
  sml:=strtoint(Edit2.text);
  if sml=0 then
   MarkByte.clear
  else
  Begin
    MarkByte.clear;
   try
    MarkByte.SetBitsFrom(sml);
    MarkByte.DoDetect;
    MarkByte.Detected:=false;
    sml:=MarkByte.ToSampl;
    Currentsampl:=MarkByte.FromSampl;
   Except
   End;
  End;
  ClearSelection;
  paintbox1.Repaint;
end;

procedure Tfnbdig.PaintMark;
Var cnv:tCanvas;
begin
  cnv:=Paintbox1.canvas;
  PaintByte(MarkByte);

end;

procedure Tfnbdig.PaintByte(bd:TByteDetected);
Var Cnv:tCanvas;
    sml,sts,ste:Integer;
    i,k:integer;
    x1,x2:Integer;
    OldColor:TColor;
    OldW:Integer;
    pbit:PBitDetected;
    y:integer ;

    Function CheckValid:Boolean;
    Var endsam:Integer;
    Begin
       Endsam:=Currentsampl+(Paintbox1.width div 5);
       result:= ((Currentsampl<bd.fromsampl) and (Bd.fromSampl<Endsam))
         or ((Currentsampl<bd.tosampl) and (Bd.toSampl<Endsam))
    End;

  Var yy:Integer;
Begin
  if not checkvalid then exit;
  cnv:=paintbox1.canvas;
  OldColor:=cnv.pen.color;
  Oldw:=cnv.pen.Width;

  cnv.pen.color:=clgreen;
  cnv.pen.Width:=3;
  sts:=bd.FromSampl-Currentsampl-1;
  if sts<0 then sts:=0;
  x1:=sts*Step;

  ste:=bd.toSampl-Currentsampl-1;
  x2:=ste*Step;
  if x2>paintbox1.width then
  x2:=Paintbox1.width;

  If bd=MarkByte then
   y:=150
  Else
   y:=10;
  cnv.MoveTo(x1,y);
  cnv.LineTo(x2,y);
  cnv.MoveTo(x1,y);
  cnv.LineTo(x1,400);
  cnv.MoveTo(x2,y);
  cnv.LineTo(x2,400);
  cnv.TextOut(x1+(x2-x1)div 2,y-10,'[ '+inttostr(bd.ByteNo)+' ] : '+Inttostr(bd.Value));

  //paint bits
    If bd=MarkByte then
      yy:=140
    Else
      yy:=0;

     y:=yy+25;
      cnv.pen.Width:=2;
      For k:=0 to bd.BitList.count-1 do
      Begin
       pbit:=bd.BitList[k];
       if (k=0)  then
       Begin
        cnv.pen.color:=clAqua;
        y:=yy+25;
       End;
       if  (k=9) then
       Begin
        cnv.pen.color:=clFuchsia;
        y:=yy+25;
       End;
       If (k=0) and (pbit.value<>1) then
       Begin
        cnv.pen.color:=clRED;
        y:=yy+25;
       End;
       If (k=9) and (pbit.value<>0) then
       Begin
        cnv.pen.color:=clRED;
        y:=yy+25;
       End;
       if (k>0) and (k<9) then
       Begin
        if pbit.value>1 then
         cnv.pen.color:=clRED
        else
         cnv.pen.color:=clLime;
        y:=yy+30;
       End;

        sts:=pbit.FromSampl-Currentsampl-1;
        if sts<0 then sts:=0;
        x1:=sts*Step;

        ste:=pbit.ToSample-Currentsampl-1;
        x2:=ste*Step;
        if x2>paintbox1.width then
        x2:=Paintbox1.width;

        cnv.MoveTo(x1,y);
        cnv.LineTo(x2,y);
        cnv.MoveTo(x1,y);
        cnv.LineTo(x1,300);
        cnv.MoveTo(x2,y);
        cnv.LineTo(x2,300);
        cnv.TextOut(x1+(x2-x1)div 2-30,y-6,inttostr(pbit.Value));
      End;
  cnv.pen.Width:=Oldw;
  cnv.pen.color:=OldColor;
End;






procedure Tfnbdig.Button15Click(Sender: TObject);
begin
 Finished:=true;
end;

procedure Tfnbdig.Button16Click(Sender: TObject);
Var i:Integer;
    p:pchar;
    bd:TByteDetected;
begin
 ms.Clear;
 ms.SetSize(bytelist.count);
 p:=ms.Memory;
 for i:=0 to bytelist.count-1 do
 Begin
  bd:=TBytedetected(Bytelist.objects[i]);
  p[i]:=Chr(bd.Value);
 End;
 p[i]:=chr(0);
 SaveProgram;
end;

procedure Tfnbdig.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 If (not ProgSaved) and (Bytelist.count>0) then
  CanClose:=MessageDlg('Program Not Saved. Are you sure you want to exit?', mtConfirmation, [mbYes,mbNo], 0)=MRYes;
end;

procedure Tfnbdig.StepBarChange(Sender: TObject);
begin
 step:=StepBar.position;

 Paintbox1.Repaint;
end;

procedure Tfnbdig.ClearListFrom(idx:Integer);
Var i:integer;
    bd:TByteDetected;
Begin
  For i:=bytelist.Count-1 downto idx do
  Begin
    bd:=TBytedetected(Bytelist.objects[i]);
    bd.Free;
    bytelist.delete(i);
  End
End;

procedure Tfnbdig.Button17Click(Sender: TObject);
Var i:integer;
begin
 i:=strtoint(edit1.text);
 ClearListFrom(i);
 If Lastbd<>nil then
 Begin
    if bytelist.count>0 then
     lastbd:=TBytedetected(bytelist.objects[Bytelist.count-1])
    Else
     Lastbd:=nil;
 End;
 ClearSelection;
 Paintbox1.Repaint;

end;

procedure Tfnbdig.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 If IsOnEdge then
  EdgeDown:=MouseSample;
end;

procedure Tfnbdig.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

Var xl,xr:Integer;
begin
   If (EdgeDown <>-1) and (Selpbit<>nil) then
   Begin
    xl:=Abs(Edgedown-Selpbit.FromSampl);
    xr:=Abs(Edgedown-Selpbit.toSample);
    if xl<xr then
    Begin
      Selpbit.FromSampl:=MouseSample;
      if Selbd.bitlist[0]=selpbit then
       if bytelist.count>selbd.byteno then
       Bytelist[selbd.byteno]:=inttostr(selbd.FromSampl);
    end
    else
     Selpbit.toSample:=MouseSample;
   End;
   EdgeDown:=-1;
   Paintbox1.Repaint;
end;

procedure Tfnbdig.PaintSelBit;
Var cnv:tCanvas;
    x,y,y1,y2:Integer;
    s:String;
begin
 cnv:=Paintbox1.canvas;
 If Selpbit=nil then exit;

 If (Selpbit.FromSampl>=Currentsampl) and
   (Selpbit.toSample<=(Currentsampl+Paintbox1.width div step)) then
 Begin
   x:=Selpbit.FromSampl+(Selpbit.ToSample-Selpbit.FromSampl) div 2;
   x:=(x-Currentsampl) * step;
   y:=Paintbox1.height-90;
   s:=' Select ';
   cnv.textout(x-cnv.textwidth(s) div 2 ,y,s);
   cnv.Pen.Color:=clAqua;
   cnv.pen.style:=psDashdot;

   y1:=10;
   y2:=300;

   x:=(Selpbit.FromSampl-Currentsampl-1) * step;
   cnv.MoveTo(x,y1);
   cnv.lineto(x,y2);
   cnv.MoveTo(x-1,y1);
   cnv.LineTo(x-1,y2);
   cnv.MoveTo(x+1,y1);
   cnv.LineTo(x+1,y2);

   x:=(Selpbit.toSample-Currentsampl-1) * step;
   cnv.MoveTo(x,y1);
   cnv.lineto(x,y2);
   cnv.MoveTo(x-1,y1);
   cnv.LineTo(x-1,y2);
   cnv.MoveTo(x+1,y1);
   cnv.LineTo(x+1,y2);
   
 End;

end;

procedure Tfnbdig.PaintSelBitDrag;
Var cnv:tCanvas;
    x,y1,y2:Integer;
begin
 cnv:=Paintbox1.canvas;
 If Selpbit=nil then exit;
 if EdgeDown=-1 then exit;

 x:=MouseSample-Currentsampl-1;
 x:=x*Step;
 y1:=10;
 y2:=300;
 cnv.Pen.Color:=clLime;
 cnv.Pen.Style:=psDot;
 cnv.MoveTo(x,y1);
 cnv.LineTo(x,y2);
 cnv.MoveTo(x-1,y1);
 cnv.LineTo(x-1,y2);
 cnv.MoveTo(x+1,y1);
 cnv.LineTo(x+1,y2);
 cnv.Pen.Style:=psSolid;
end;

procedure Tfnbdig.ClearSelection;
begin
 Selbd:=nil;
 Selpbit:=nil;
end;


procedure Tfnbdig.Button18Click(Sender: TObject);
Var sml:Integer;
begin
 sml:=Strtoint(edit2.text);
 sml:=sml-180;
 if sml<0 then
  sml:=0;
 Edit2.text:=inttostr(sml);
 Button14Click(nil); 
end;

procedure Tfnbdig.Button19Click(Sender: TObject);
Var sml:Integer;
begin
 sml:=Strtoint(edit2.text);
 sml:=sml+180;
 if sml+180>=f.size then
  sml:=f.size-180;
 Edit2.text:=inttostr(sml);
 Button14Click(nil);
end;

procedure Tfnbdig.SetDefaultPatterns;
begin
 PilotPattern.PatternLength:=36;
 PilotPattern.descr:=TStringlist.create;
 PilotPattern.descr.Add('L0');
 PilotPattern.descr.Add('H12');
 PilotPattern.descr.Add('L18');
 PilotPattern.descr.Add('H23');
 PilotPattern.descr.Add('L36');


 OnePattern.PatternLength:=18;
 OnePattern.descr:=TStringlist.create;
 OnePattern.descr.Add('L0');
 OnePattern.descr.Add('H5');
 OnePattern.descr.Add('L9');
 OnePattern.descr.Add('H14');
 OnePattern.descr.Add('L18');

 ZeroPattern.PatternLength:=18;
 ZeroPattern.descr:=TStringlist.create;
 ZeroPattern.descr.Add('L0');
 ZeroPattern.descr.Add('H9');
 ZeroPattern.descr.Add('L18');

end;

procedure Tfnbdig.SavePattern(Pat:TCustomPattern;fn:String);
Var sl:tstringlist;
Begin
  sl:=TStringlist.create;
  sl.Assign(pat.descr);
  sl.insert(0,inttostr(pat.PatternLength));
  sl.savetofile(AppPath+fn);
  sl.free;
End;


procedure Tfnbdig.LoadPattern(Pat:TCustomPattern;fn:String);
Var sl:tstringlist;
    v:Integer;
Begin
  If not FileExists(AppPath+fn) then
  Begin
   SavePattern(pat,fn);
   Exit;
  End;
  sl:=TStringlist.create;
  sl.loadfromfile(AppPath+fn);
  try
   v:=Strtoint(sl[0]);
  Except
    v:=0;
  End;
  pat.PatternLength:=v;
  sl.delete(0);
  pat.descr.assign(sl);
  sl.free;
End;

procedure Tfnbdig.LoadPatterns;
Var fn:String;
begin
 fn:=GetFN;
 if not fileexists(AppPath+fn+'Pilot.txt') then
  fn:='';
 LoadPattern(PilotPattern,fn+'Pilot.txt');
 Pilotlen:=PilotPattern.PatternLength;
 LoadPattern(OnePattern,fn+'One.txt');
 OneLen:=OnePattern.PatternLength;
 LoadPattern(ZeroPattern,fn+'Zero.txt');
 ZeroLen:=ZeroPattern.PatternLength;
end;

procedure Tfnbdig.ListBox2Click(Sender: TObject);
begin
 if listbox2.itemindex>-1 then
  edit4.text:=listbox2.items[listbox2.itemindex];
end;

procedure Tfnbdig.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var i:Integer;
begin
 if key=13 then
 Begin
   For i:=listbox2.items.count to strtoint(edit3.text)-1 do
    listbox2.items.add('0');
   For i:=listbox2.items.count downto strtoint(edit3.text)+1  do
    listbox2.items.delete(i-1);
 End;
end;

procedure Tfnbdig.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 Begin
   If listbox2.itemindex>-2 then
   Begin
     listbox2.items[listbox2.itemindex]:=edit4.text;
   End;
 End;
end;

procedure Tfnbdig.Button20Click(Sender: TObject);
Var s:String;
begin
   Sensitivity:=Sens.Position;
   if listbox2.itemindex=-1 then exit;

   s:=listbox2.items[listbox2.itemindex];
   currentsampl:=strtoint(s)+OneLen;
   DetectBytes;
   Problem:=false;
   if not problem then
   Begin
    info('-------------------');
    info('Next Block');
    Lastbd:=nil;
    StartFound:=false;
   End;
 If (not problem) then
 Begin
   Info('Part Digitization Finished OK');
 End
 Else
  Info('Problems During Digitization');

end;

procedure Tfnbdig.Button21Click(Sender: TObject);
var f:String;
begin
  f:=ChangeFileExt(opendialog1.FileName,'.pil');
  listbox2.items.savetofile(f);
end;

procedure Tfnbdig.Button22Click(Sender: TObject);
Var i:Integer;
begin
  For i:=0 to listbox2.items.count-1 do
  Begin
   Listbox2.itemindex:=i;
   button20click(sender);
   
   Application.processmessages;
  End;
end;



function Tfnbdig.GetFixedValue(b:Byte): Byte;
begin
  if b>127+20
    then Result:=255
  else
  if b<127-20 then
   Result:=0
  else
   Result:=lastb;

  Lastb:=Result; 
end;

procedure Tfnbdig.Button23Click(Sender: TObject);
begin
 SetFromPattern(PilotPattern);
end;

procedure Tfnbdig.Button24Click(Sender: TObject);
begin
 SetFromPattern(OnePattern);

end;

procedure Tfnbdig.Button25Click(Sender: TObject);
begin
 SetFromPattern(ZeroPattern);
end;

procedure Tfnbdig.Button26Click(Sender: TObject);
Begin
 DigitDetect.SetTopattern(PilotPattern,strtoint(frmsampl.text),Strtoint(lenSampl.text));
 SetFromPattern(PilotPattern);
end;

procedure Tfnbdig.SetFromPattern(Pat:TCustomPattern);
Begin
 Listbox3.Items.Assign(pat.descr);
 Listbox3.Items.Insert(0,inttostr(pat.PatternLength));
End;



procedure Tfnbdig.Button27Click(Sender: TObject);
begin
  DigitDetect.SetTopattern(OnePattern,strtoint(frmsampl.text),Strtoint(lenSampl.text));
  SetFromPattern(OnePattern);
end;

procedure Tfnbdig.Button28Click(Sender: TObject);
begin
  DigitDetect.SetTopattern(ZeroPattern,strtoint(frmsampl.text),Strtoint(lenSampl.text));
  SetFromPattern(ZeroPattern);
end;

procedure Tfnbdig.Button29Click(Sender: TObject);
Var fn:String;
begin
 fn:=Getfn;

 SavePattern(PilotPattern,fn+'Pilot.txt');
 SavePattern(OnePattern,fn+'One.txt');
 SavePattern(ZeroPattern,fn+'Zero.txt');
end;

function Tfnbdig.AppPath: string;
begin
     Result := ExtractFilePath(Application.exename);
end;



procedure Tfnbdig.Button30Click(Sender: TObject);
begin
 currentsampl:=strtoint(frmsampl.text);
 DigitDetect.FixEdge;
 frmsampl.text:=inttostr(currentsampl);
end;

procedure Tfnbdig.Button31Click(Sender: TObject);
VAR I:integer;
    cs:word;
    bd:TBytedetected;
begin
 cs:=0;
 bd:=TBytedetected(Bytelist.objects[bytelist.count-9-2]);
 Label11.caption:=inttohex(bd.value,2);
 bd:=TBytedetected(Bytelist.objects[bytelist.count-9-1]);
 Label11.caption:=inttohex(bd.value,2)+Label11.caption;
 for i:=1 to bytelist.count-9-2-1 do
 Begin
  bd:=TBytedetected(Bytelist.objects[i]);
  cs:=cs+bd.Value;
 End;
 cs:=cs+$3b;
 label10.caption:=inttohex(cs,4);
 if label10.caption=label11.caption then
  label12.caption:='OK'
 else
  label12.caption:='ERR 132';
end;

procedure Tfnbdig.button32Click(Sender: TObject);
var i:integer;
    bd,bdpre:TBytedetected;
    f:boolean;
begin
 bdpre:=TBytedetected(Bytelist.objects[0]);
 for i:=1 to bytelist.count-1 do
 Begin
  bd:=TBytedetected(Bytelist.objects[i]);
  f:=false;
  if bd.fromSampl-bdpre.ToSampl>2 then
   f:=true;
  if bd.toSampl-bd.fromSampl>10*18+10 then
   f:=true;
  if bd.toSampl-bd.fromSampl<10*18-10 then
   f:=true;

  if f then
   listbox1.Items.insert(0,inttostr(i));
  bdpre:=bd;
 End;

end;

procedure Tfnbdig.CheckBox2Click(Sender: TObject);
begin
 Invalidate;
end;

procedure Tfnbdig.btnClick(Sender: TObject);
var a,b:Integer;
    ns:String;
    i:Integer;
begin
  ns:='0';
  InputQuery('Input Box', 'Prompt', ns);
  a:=strtoint(ns);
  for i:=0 to listbox2.Items.count-1 do
  Begin
    b:=strtoint(listbox2.items[i]);
    b:=b+a;
    listbox2.items[i]:=inttostr(b);
  End;

end;

function Tfnbdig.GetCurrentSampl: Integer;
begin
     Result := custdetEngine.currentsampl;
end;

function Tfnbdig.GetPilotSearch: Boolean;
begin
     Result := Digitdetect.PilotSearch;
end;

procedure Tfnbdig.SetPilotSearch(Value: Boolean);
begin
 Digitdetect.PilotSearch:=value;
end;

function Tfnbdig.Getfn: string;
begin
    if opendialog1.Filename='' then
     result:=''
    Else
    Begin
     Result := ExtractFileName(OPendialog1.filename);
     Result:= Copy(Result,1,length(result)-4);
     Result:='\wavs\'+Result+'_';
   End;  
end;

end.
