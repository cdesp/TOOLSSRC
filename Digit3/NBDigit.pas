unit NBDigit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,CustDetEngine, Menus, Buttons;


type


  Tfnbdig = class(TForm)
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveByPart1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    SavePartList1: TMenuItem;
    Detection1: TMenuItem;
    StartDetection1: TMenuItem;
    Stop1: TMenuItem;
    Continue1: TMenuItem;
    View1: TMenuItem;
    FilteredSamples1: TMenuItem;
    RePaint1: TMenuItem;
    ScrollBar1: TScrollBar;
    StepBar: TTrackBar;
    PanelDN: TPanel;
    Panel3: TPanel;
    ListBox1: TListBox;
    Panel4: TPanel;
    Label15: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    lblprc: TLabel;
    Label7: TLabel;
    Sens: TTrackBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Button3: TButton;
    Button9: TButton;
    frmsampl: TEdit;
    lenSampl: TEdit;
    Button14: TButton;
    Edit2: TEdit;
    Button18: TButton;
    Button19: TButton;
    Button30: TButton;
    CheckBox4: TCheckBox;
    TabSheet2: TTabSheet;
    ListBox3: TListBox;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    TabSheet3: TTabSheet;
    Button22: TButton;
    btn: TButton;
    Button20: TButton;
    Label8: TLabel;
    Edit3: TEdit;
    Label9: TLabel;
    Edit4: TEdit;
    TabSheet4: TTabSheet;
    Button10: TButton;
    Button13: TButton;
    Button11: TButton;
    Button17: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    Button31: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    ListBox2: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    TabSheet5: TTabSheet;
    SpeedButton4: TSpeedButton;
    btnsetfromsel: TButton;
    Label3: TLabel;
    btnRec: TButton;
    procedure Button1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    procedure btnRecClick(Sender: TObject);
    procedure btnsetfromselClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FilteredSamples1Click(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta:
        Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure RePaint1Click(Sender: TObject);
    procedure SaveByPart1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
        startFound:Boolean;
    Selbd:TByteDetected;
    Selpbit:PBitDetected;

    Fix:TStringlist;
    f:TStream;
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
    ClickPos: Integer;
    Detecting: Boolean;
    LastLen: Integer;
    NameByPart: Boolean;
    Selecting: Boolean;
    SetSelStart: Boolean;
    Title: string;
    procedure FindInfo;
    procedure PaintCurrentPos;
    procedure SetScrollbar;
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
    function GetMySensitivity: Integer;
    function GetPilotSearch: Boolean;
    function GetSampling: Integer;
    procedure SetMySensitivity(const Value: Integer);
    procedure SetPilotSearch(Value: Boolean);
    procedure SetSampling(const Value: Integer);
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
    property MySensitivity: Integer read GetMySensitivity write SetMySensitivity;
    property PilotSearch: Boolean read GetPilotSearch write SetPilotSearch;
    property Sampling: Integer read GetSampling write SetSampling;
    { Public declarations }
  end;

Const LeftGap=50;

var
  fnbdig: Tfnbdig;


implementation

uses WavRecord,Sampling,NBFixSel,DetEngine1,EdgeDetEngine,PulseDetEngine,mmsystem;




procedure Tfnbdig.OpenFile(FN:String);
begin
 if Assigned(f) then
 Try
   f.free;
 Except

 end;
 f:=TFileStream.Create(FN,fmOpenRead);
 f.Position:=45;
 CurrentSampl:=f.position;
 DigitDetect.Init(f,Bytelist);
 Caption:=title+'  - [ '+ExtractFileName(FN)+' ]';
end;

procedure Tfnbdig.CloseFile;
begin
 f.Free;
 f:=nil;
end;

procedure Tfnbdig.SetScrollbar;
Begin
    if f=nil then exit;
    if application.terminated then exit;
    if Detecting then exit;
    


    scrollbar1.Min:=0;
    scrollbar1.Max:=f.Size;
    scrollbar1.LargeChange:=Paintbox1.width div 5;
    scrollbar1.PageSize:=Paintbox1.width div 5;
    scrollbar1.Position:=CurrentSampl;
End;


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
   SetScrollbar;
  End;
end;

{$R *.DFM}


procedure Tfnbdig.FindInfo;
Var WavInfo:Array[0..45] of byte;
    i:Integer;
    b:Byte;
    freq:Integer;
    sr:Integer;
    aud:string;
    sl:tstringlist;
Begin
  f.Position:=0;
//  sl:=tstringlist.create;
  for i := 0 to 45 do
  Begin
     f.Read(b,1);
     WavInfo[i]:=b;
 //    ListBox1.Items.add(inttostr(i)+' '+inttostr(b));
//     sl.Add(Inttostr(b));
  end;
//  sl.SaveToFile('wavheader.txt');
//  sl.free;
  f.Position:=45;

  //Starting from 1
  //1-4 RIFF

  //5 File Size
  //6
  //7
  //8
  //9-16 WAVEfmt

  //22 1 Mono 2 For Stereo

  //24 Frequency  REAL
  //25
  //26  0
  //27  0
  //28 Frequency  ??? on stereo
  //29
  //30  0
  //31  0

  //34 Sample Range No of bits 8 or 16

  //41 Data Size
  //42
  //43
  //44

  Freq:=WavInfo[25]*256+WavInfo[24];
  case freq of
    44100:KHzSampling:=44;
    22050:KHzSampling:=22;
  end;
  Listbox1.Items.add('Frequency    :'+inttostr(freq));
  sr:=WavInfo[34];
  Listbox1.Items.add('Sample Range :'+inttostr(sr));
  case WavInfo[22] of
     1:aud:='MONO';
     2:aud:='STEREO';
  end;
  Listbox1.Items.add('Audio        :'+aud);

  if ((KHzSampling=44) or (KHzSampling=22)) and (WavInfo[22]=1) and (WavInfo[34]=8) then
   ListBox1.Items.add('Format Is Supported')
  Else
   ListBox1.Items.add('*** This Format Is Not Supported !!!');
end;

procedure Tfnbdig.Button1Click(Sender: TObject);
begin
 Listbox1.Items.clear;
 SelectFile;
 LoadPatterns;
 FindInfo;
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

  PaintCurrentPos;
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
    Yst,y1:integer;
    stp:integer;
    cc:integer;

Begin
 Lastb:=127;
 cnv:=Paintbox1.canvas;
 f.Position:=custdetEngine.currentsampl;
 x:=0;y:=0;
 Lastx:=-1;
 DownGap:=50;
 Scaley:=(paintbox1.height - DownGap) / MaxSamples;
 StartX:=custdetEngine.currentsampl;

 //Paint current sample
 oldsz:=cnv.Font.Size;
 cnv.Font.Size:=14;
 cnv.font.Color:=clAqua;
 cnv.TextOut(60,10,inttostr(StartX));
 cnv.Font.Size:=oldsz;
 cnv.font.Color:=clWhite;
 
 y:=paintbox1.height-DownGap-Trunc(HalfSamples*Scaley);
 cnv.MoveTo(x,y);
 x:=Paintbox1.Width;
 cnv.LineTo(x,y);

 x:=0;y:=0;
 oldsz:=paintbox1.Font.Size;

 //paint vertical numbers 0-255 maxsamples
 yst:=Paintbox1.Height-downgap;
 stp:=(Paintbox1.Height-downgap) div MaxSamples;
 stp:=3-stp;

 stp:=stp*10;

 
 
 cc:=0;
 for I := 0 to MaxSamples do
 Begin
   x:=10;
   y:=yst-trunc(i*scaleY);
   if (i mod stp = 0) or (i=MaxSamples) or (i=HalfSamples) then
   Begin
     OldColor:=cnv.pen.color;
     cnv.pen.color:=clBlue;
     cnv.MoveTo(x,y);
     cnv.LineTo(x+40,y);
     cnv.pen.color:=OldColor;
     y:=y-(cnv.TextHeight('9') div 2);
     cnv.TextOut(x,y ,inttostr(cc));
   end;
   inc(cc);
 end;

 //paint samples
 x:=LeftGap;y:=0;
 For i:=0 to Paintbox1.Width do
 Begin
  if f.Position>=f.size then break;
  cnt:=1;
  f.Read(buf,cnt);
  b:=buf[0];
  //New code
  if FilteredSamples1.checked then
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



procedure Tfnbdig.PaintCurrentPos;
Var sts,ste:Integer;
    x1,x2:integer;

    cnv:tCanvas;
    OldColor,OldW:Integer;
Begin
//  If CurrentSampl>=SelEnd then exit;

  sts:=ClickPos-Currentsampl-1;
  if sts<0 then sts:=0;

  x1:=LeftGap+sts*Step;


  cnv:=Paintbox1.canvas;
  OldColor:=cnv.Pen.Color;
  Oldw:=cnv.Pen.Width;
  cnv.Pen.Style:=psDot;
  cnv.Pen.Color:=clBlue;
  cnv.Pen.Width:=2;

  cnv.MoveTo(x1,0);
  cnv.LineTo(x1,paintbox1.height);

  cnv.Pen.Style:=psSolid;
  cnv.pen.Color:=OldColor;
  cnv.pen.width:=OldW;
end;

procedure Tfnbdig.PaintSelection;
Var sts,ste:Integer;
    x1,x2:integer;

    cnv:tCanvas;
    OldColor,OldW:Integer;
Begin
  If CurrentSampl>=SelEnd then exit;

  sts:=Selstart-Currentsampl-1;
  if sts<0 then sts:=0;

  x1:=LeftGap+sts*Step;

  ste:=SelEnd-Currentsampl-1;
  x2:=LeftGap+ste*Step;
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

  prc:=CurrentSampl*100/f.size;
  lblprc.caption:=Format('%.2f %%',[prc]);
  SetScrollbar;
end;

{ TByteDetected }

procedure Tfnbdig.FormCreate(Sender: TObject);
Var i:Integer;
begin
 Title:=caption;
 Doublebuffered:=true;
 Bytelist:=TStringList.Create;
 Step:=5;
 ms:=TMemoryStream.Create;
 Fix:=TStringlist.create;
 Lastbd:=nil;
 MarkByte:=TByteDetected.create;
 MarkByte.AddAllbits;
 EdgeDown:=-1;
 NameByPart:=False;

 PilotPattern:=TCustomPattern.create(Self);
 OnePattern:=TCustomPattern.create(Self);;
 ZeroPattern:=TCustomPattern.create(Self);

// DigitDetect:=TDetDigEngine1.Create;
// DigitDetect:=TEdgeDetEngine.Create;
 DigitDetect:=TPulseDetEngine.Create;

 SetDefaultPatterns;
 LoadPatterns;
 f:=nil;
// paintbox1.ControlStyle:= paintbox1.ControlStyle+[csOpaque];
 Sampling:=22;
end;

procedure Tfnbdig.FormDestroy(Sender: TObject);
begin
 fix.free;
 Bytelist.free;
 f.free;
 ms.free;
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
 MySensitivity:=Sens.Position;
 DigitDetect.PilotSearch:=CheckBox4.checked;
 currentsampl:=Strtoint(frmsampl.text);
 DigitDetect.DetectFrom(currentsampl);
 frmsampl.text:=inttostr(custdetEngine.currentsampl);
 label4.caption:=DigitDetect.Mes;
 if not digitdetect.problem then
  lenSampl.text:=inttostr(DigitDetect.LastLen);
 Repaint;
 SetScrollbar;
end;



procedure Tfnbdig.Button8Click(Sender: TObject);
begin

 MySensitivity:=Sens.Position;
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
 MySensitivity:=2;//should be deleted
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
     //DigitDetect.FixEdge;
  End
  else
  If DigitDetect.bitvalue=1 then
  Begin

     if pilcnt>10 then
     Begin
     // CurrentSampl:=CurrentSampl+DigitDetect.LastLen;//OneLen;
    //  DigitDetect.FixEdge;
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
 MySensitivity:=Sens.Position;

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
         //new set byte value to 0
         bd:=TBytedetected(Bytelist.objects[bytelist.count-1]);
         bd.Error:='';
         bd.Value:=0;
         exit;
         //old deleting
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
  ByteStart:=CurrentSampl;//-DigitDetect.LastLen;//OneLen;
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


  //DigitDetect.FixEdge;
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
Detecting:=true;
try
 Repeat
   Info('Finding Pilot End ...');
   if not startfound then
   Begin
    StartFound:=FindPilot;
    If startfound then
    Begin
     //currentsampl:=currentsampl-4;
     Info('Pilot End Found at'+ inttostr(currentsampl));
     if not checkbox1.Checked then
     Begin
      Listbox2.items.add(inttostr(currentsampl));
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
finally
 Detecting:=False;
 Paintbox1.Repaint;
 SetScrollBar;
end;

End;

procedure Tfnbdig.SaveProgram;
Var fn:String;
begin
  if not NameByPart then
   fn:=ChangeFileExt(opendialog1.FileName,'.bas')
  else
   fn:=ChangeFileExt(opendialog1.FileName,'')+inttostr(listbox2.itemindex)+'.bas';
  ms.SaveToFile(fn);
  ms.Clear;
  ProgSaved:=true;
  if NameByPart then
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
    CurrentSampl:=CurrentSampl-1;
    SetScrollbar;
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
 MySensitivity:=Sens.Position;
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
  ln:=x-LeftGap;
  if ln<0 then ln:=0;

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
    smplval:integer;
    cnt:integer;
    oldpos,kk:integer;
    buf:{Array[0..1] of} byte;
begin
  mousesample:=GetSampleAtPosition(x);
  statusbar1.panels[0].text:='Sample = '+inttostr(mousesample);

  If Selecting then
  Begin
      if SetSelStart then
      Begin
         SetSelStart:=False;
         SelStart:=MouseSample;
      end;
      SelEnd:=mousesample;
      frmSampl.text:=Inttostr(SelStart);
      kk:=SelEnd-SelStart;
      LenSampl.text:=Inttostr(kk);

      PaintBox1.Repaint;
  end;

  if (selpbit<>nil) and (EdgeDown=-1) then
  Begin
    IsOnEdge:=IsOnBitEdge;
    if IsOnEdge then
     paintbox1.cursor:= crhSplit
    else
    paintbox1.cursor:= crDefault;
  End;

  if f<>nil then
  Begin
    cnt:=1;
    oldpos:=f.position;
    f.position:=mousesample;
    f.Read(buf,cnt);
    f.position:=oldpos;
  end;
  PaintBox1.hint:=inttostr(mousesample)+' ('+inttostr(buf)+')';
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
  s:=s+Format(' (%d - %d) %d',[pbit.fromsampl,pbit.tosample,pbit.tosample-pbit.fromsampl]);
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
  frmsampl.text:=inttostr(mousesample);
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
    SetScrollBar;
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
        c1,c2:Boolean;
        frms,tos:Integer;
    Begin
       Endsam:=Currentsampl+((Paintbox1.width- Leftgap)div 5);
       frms:=bd.fromsampl;
       tos:=bd.tosampl;
       c1:=((Currentsampl<frms) and (frms<Endsam));
       c2:=((Currentsampl<tos) and (tos<Endsam));
       result:= c1 or c2;

    End;

  Var yy:Integer;
Begin
 // if not checkvalid then exit;
  cnv:=paintbox1.canvas;
  OldColor:=cnv.pen.color;
  Oldw:=cnv.pen.Width;

  cnv.pen.color:=clgreen;
  cnv.pen.Width:=3;
  sts:=bd.FromSampl-Currentsampl-1;
  if sts<0 then sts:=0;
  x1:=LeftGap+sts*Step;

  ste:=bd.toSampl-Currentsampl-1;
  x2:=LeftGap+ste*Step;
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
        x1:=LeftGap+sts*Step;

        ste:=pbit.ToSample-Currentsampl-1;
        x2:=LeftGap+ste*Step;
        if x2>paintbox1.width then
           x2:=Paintbox1.width;

        if x2<x1 then continue;
          
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
 ClickPos:=MouseSample;
 if ssShift in shift then
 Begin
  Selecting:=true;
  SetSelStart:=true;
 end;

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
   Selecting:=False;
   SetSelStart:=false;
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
   x:=LeftGap+(x-Currentsampl) * step;
   y:=Paintbox1.height-90;
   s:=' Select ';
   cnv.textout(x-cnv.textwidth(s) div 2 ,y,s);
   cnv.Pen.Color:=clAqua;
   cnv.pen.style:=psDashdot;

   y1:=10;
   y2:=300;

   x:=LeftGap+(Selpbit.FromSampl-Currentsampl-1) * step;
   cnv.MoveTo(x,y1);
   cnv.lineto(x,y2);
   cnv.MoveTo(x-1,y1);
   cnv.LineTo(x-1,y2);
   cnv.MoveTo(x+1,y1);
   cnv.LineTo(x+1,y2);

   x:=LeftGap+(Selpbit.toSample-Currentsampl-1) * step;
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
 x:=LeftGap+x*Step;
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
 PilotPattern.PatternLength:=30;
 PilotPattern.descr:=TStringlist.create;
 PilotPattern.descr.Add('H7');
 PilotPattern.descr.Add('L6');
 PilotPattern.descr.Add('H8');
 PilotPattern.descr.Add('L9');


 OnePattern.PatternLength:=18;
 OnePattern.descr:=TStringlist.create;
 OnePattern.descr.Add('H5');
 OnePattern.descr.Add('L4');
 OnePattern.descr.Add('H5');
 OnePattern.descr.Add('L4');

 ZeroPattern.PatternLength:=17;
 ZeroPattern.descr:=TStringlist.create;
 ZeroPattern.descr.Add('H9');
 ZeroPattern.descr.Add('L8');

end;

procedure Tfnbdig.SavePattern(Pat:TCustomPattern;fn:String);
Var sl:tstringlist;
Begin
  sl:=TStringlist.create;
  sl.Assign(pat.descr);
  sl.insert(0,inttostr(pat.PatternLength));
  ForceDirectories(ExtractFileDir(AppPath+fn));
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
   MySensitivity:=Sens.Position;
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
 Result:=DigitDetect.GetFilteredValue(b);

{  if b>127+20
    then Result:=255
  else
  if b<127-20 then
   Result:=0
  else
   Result:=lastb;

  Lastb:=Result;}
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

procedure Tfnbdig.btnRecClick(Sender: TObject);
begin
 StopRecording;
 f:=MEmSt;
 DigitDetect.Init(f,Bytelist);
 SetScrollbar;
 Paintbox1.repaint;
end;

procedure Tfnbdig.btnsetfromselClick(Sender: TObject);
Var tempPattern:TCustomPattern;
begin
  tempPattern:=TCustomPattern.create(nil);
  try
     DigitDetect.SetTopattern(tempPattern,strtoint(frmsampl.text),Strtoint(lenSampl.text));
     SetFromPattern(tempPattern);
  finally
   TempPattern.free;
  end;
end;

procedure Tfnbdig.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure Tfnbdig.FilteredSamples1Click(Sender: TObject);
begin
  FilteredSamples1.Checked:=not FilteredSamples1.Checked;
end;

procedure Tfnbdig.FormMouseWheel(Sender: TObject; Shift: TShiftState;
    WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
Var isinrect:Boolean;
    p:Tpoint;
    tr:Trect;
begin
   p:=ScreenToClient(Mousepos);
   tr:=Rect(paintbox1.Left,paintbox1.Top,(paintbox1.Left+paintbox1.width),(paintbox1.Top+paintbox1.Height));
   isinrect:=(tr.left<=p.X) and (p.X<=tr.right)
          and (tr.top<=p.y) and (p.y<=tr.Bottom);
   if isinrect then
   Begin
     if wheeldelta>0 then
      stepbar.Position:=stepbar.Position+1;
     if wheeldelta<0 then
      stepbar.Position:=stepbar.Position-1;
     Handled:=true;
   end;
end;

procedure Tfnbdig.FormResize(Sender: TObject);
begin
 try
   SetScrollbar;
 except

 end;
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

function Tfnbdig.GetMySensitivity: Integer;
begin
  Result := CustDetEngine.GetSensitivity;
end;

function Tfnbdig.GetSampling: Integer;
begin
  Result := KHzSampling;
end;

procedure Tfnbdig.RePaint1Click(Sender: TObject);
begin
 step:=StepBar.position;
 Paintbox1.Repaint;

end;

procedure Tfnbdig.SaveByPart1Click(Sender: TObject);
begin
 NameByPart:=True;
 Button16Click(Sender);
 NameByPart:=False;
end;

procedure Tfnbdig.ScrollBar1Change(Sender: TObject);
begin
if scrollbar1.max<=100 then exit;

Currentsampl:=scrollbar1.Position;
paintbox1.Repaint;
end;

procedure Tfnbdig.SetMySensitivity(const Value: Integer);
begin
  CustDetEngine.SetSensitivity(Value);
end;

procedure Tfnbdig.SetSampling(const Value: Integer);
begin
  KhzSampling:=Value;
  SetEngSampling(KhzSampling);
end;


Procedure Callbck(hwin:Integer;umsg:Uint;dwinst,p1,p2:DWord);stdcall;
Begin
  fnbdig.f:=TestBuffer;
  fnbdig.setscrollbar;
  fnbdig.paintbox1.repaint;

end;


procedure Tfnbdig.SpeedButton4Click(Sender: TObject);
begin
//
// SpeedButton4.Down:=Not SpeedButton4.Down;

StartREcording(TFNDrvCallBack(@Callbck));
end;



end.
