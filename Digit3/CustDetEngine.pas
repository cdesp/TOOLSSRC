unit CustDetEngine;

interface
uses classes;

Const buffix=0;
      SmallBufferCNT=100;


Type

    TDetectionKind=(dkUnknown,dkPilot,dkOne,dkZero);

    TBitDetected=record
       FromSampl:Integer;
       ToSample:Integer;
       Kind:TDetectionKind;
       value:Byte;
       Valid: Boolean;
    End;
    PBitDetected=^TBitDetected;


    TCustomPattern=Class(TComponent)

     private
      FPatternLength: Integer;
      function GetPatternDecr: string;
      procedure SetPatternDecr(const Value: string);
     protected
     Public
      descr: TStringlist;
      Constructor Create(AOwner:TComponent);Override;
      Destructor Destroy;Override;
     Published
      property PatternLength: Integer read FPatternLength write FPatternLength;
      property PatternDecr: string read GetPatternDecr write SetPatternDecr;

    End;



    TCustomDigitDetection=class

      private
      protected
       Buf: Array[0..SmallBufferCNT] of byte;
       procedure ReadBuffer(Start: Integer;Filt:Boolean=true);
       procedure ClearBuffer;
      Public
       f:TStream;
       ByteList:TStringList;
       BitValue:Byte;
       LastLen:Integer;
       Mes:String;
       Problem:Boolean;
       Error:String;
       PilotSearch:Boolean;
       function CheckOne: Boolean; virtual;
       function CheckPilot: Boolean; virtual;
       function CheckZero: Boolean; virtual;
       function FindPattern(pat:TCustomPattern): Boolean; virtual;
       procedure DetectFrom(Strt:Integer); virtual;
       function GetFilteredValue(b:Byte): Byte; virtual;
       procedure Init(af: TStream; aByteList: TStringList);
       Constructor Create;
       Destructor Destroy;Override;
       procedure FixEdge; virtual;
       function CheckEndOfBlock: Boolean; virtual;
       procedure SetToPattern(pat: TCustomPattern;Strt:Integer;Lensampl:Integer);
    End;

  TByteDetected=Class
     BitList:TList;
   private
   Public
     Value:Integer;
     Detected:Boolean;
     Error: string;
     ByteNo: Integer;
     Procedure DoDetect;
     Constructor Create;Virtual;
     Destructor Destroy;Override;
     function FromSampl: Integer;
     function ToSampl: Integer;
     function Addbit(start:Integer=0): pBitDetected;
     function GetBit(idx:Integer): pBitDetected;
     procedure AddAllBits;
     procedure SetBitsFrom(frm:Integer);
     procedure CalcValue;
     procedure Clear;
  End;


Var
    DigitDetect:TCustomDigitDetection;
    Currentsampl:integer=0;
    PilotLen:Integer=36;
    OneLen:Integer=18;
    ZeroLen:Integer=18;

    PilotPattern:TCustomPattern;
    OnePattern:TCustomPattern;
    ZeroPattern:TCustomPattern;

    Sensitivity:integer=1;
    lastb:Integer=127;
    MediumVal:Integer=127;

Procedure SetEngSampling(s:Integer);
Function GetSensitivity:Integer;
Procedure SetSensitivity(v:Integer);

implementation
uses sysutils,Sampling;


Function GetSensitivity:Integer;
Begin
  case KHzSampling of
    22:Result:=Sensitivity;
    44:Result:=Sensitivity Div 2;
  end;
end;

Procedure SetSensitivity(v:Integer);
Begin
  case KHzSampling of
    22:Sensitivity:=v;
    44:Sensitivity:=v*2;
  end;
end;

Procedure SetEngSampling(s:Integer);
Begin
 case s of
   22:Begin
       PilotLen:=36;
       OneLen:=18;
       ZeroLen:=18;
     End;
   44:Begin
       PilotLen:=36*2;
       OneLen:=18*2;
       ZeroLen:=18*2;
     End;
 end;
 lastb:=HalfSamples;
 MediumVal:=HalfSamples;
end;

constructor TByteDetected.Create;
begin
 Bitlist:=Tlist.create;
end;

destructor TByteDetected.Destroy;
Var p:pBitdetected;
    i:Integer;
begin
  For i:=0 to 9 do
  Begin
    p:=GetBit(i);
    Dispose(p)
  End;
  bitlist.free;
  inherited;

end;

procedure TByteDetected.AddAllBits;
Var i:integer;
begin
 For i:=0 to 9 do
  Addbit;
end;

function TByteDetected.Addbit(start:Integer=0): pBitDetected;
begin
  Result := New(PBitDetected);
  BitList.add(result);
  result.value:=255;
  result.FromSampl:=Start;
  result.ToSample:=result.FromSampl+OneLen;
end;

procedure TByteDetected.CalcValue;
Var ad,j:Integer;
    b:byte;
begin
      b:=0;
      ad:=128;   //msb first
      Error:='';
      If GetBit(0).value<>1 then
       Error:='Error Starting bit not ONE';
      If GetBit(9).value<>0 then
       Error:=Error+#13#10+'Error Ending bit not Zero';
      for j:=1 to 8 do
      Begin
        if GetBit(j).value=1 then
         b:=b+ad
        Else
        if GetBit(j).value<>0 then
        Begin
         Error:=Error+#13#10+'Error in bit no '+inttostr(j);
         Error:=Error+#13#10+'  '+inttostr(GetBit(j).FromSampl);
         Break;
        End;
        ad:=ad div 2;
      End;
      Value:=b;
      Detected:= error='' ;
end;

procedure TByteDetected.Clear;
Var i:Integer;
begin
   Detected:=false;
   Value:=0;
   Error:='';
   For i:=0 to 9 do
   Begin
     GetBit(i).FromSampl:=0;
     GetBit(i).toSample:=0;
   End;
end;

procedure TByteDetected.DoDetect;
Var i:Integer;
    pbt:PBitDetected;
begin
 CalcValue;
 if detected then exit;

  For i:=0 to 9 do
  Begin
   pbt:=GetBit(i);
   if not assigned(pbt) then continue;
   If i<>0 then
    pbt.fromsampl:=Currentsampl
   Else
    Currentsampl:=pbt.fromsampl;


   DigitDetect.DetectFrom(pbt.fromsampl);
   pbt.fromsampl:=Currentsampl;

   pbt.value:=DigitDetect.BitValue;
   pbt.Valid:=not DigitDetect.Problem;
   If pbt.value<>255 then
    pbt.ToSample:=pbt.fromsampl+DigitDetect.lastLen;
   Currentsampl:=pbt.ToSample;
   //FixEdge;
  End;
  CalcValue;
end;

function TByteDetected.FromSampl: Integer;
begin
    Result := 0;
    if bitlist.count>0 then
     result:=PBitDetected(bitlist[0]).FromSampl;
end;

function TByteDetected.GetBit(idx:Integer): pBitDetected;
begin
  If bitlist.count>idx then
   Result := bitlist[idx]
  Else
   Result:=nil;
end;

procedure TByteDetected.SetBitsFrom(frm:Integer);
Var i:Integer;
    bt:PBitDetected;
    sml:Integer;
begin
  sml:=frm;
  For i:=0 to 9 do
  Begin
    Bt:=GetBit(i);
    bt.FromSampl:=sml;
    bt.tosample:=sml+OneLen;
    sml:=bt.tosample+1;
  End;
end;

function TByteDetected.ToSampl: Integer;
begin
     Result :=0 ;
    if bitlist.count>0 then
     result:=PBitDetected(bitlist[bitlist.count-1]).ToSample;

end;

function TCustomDigitDetection.CheckOne: Boolean;
Begin
  Result:=FindPattern(OnePattern);
End;

function TCustomDigitDetection.CheckPilot: Boolean;
Begin
  Result:=FindPattern(PilotPattern);
End;

function TCustomDigitDetection.CheckZero: Boolean;
Begin
  Result:=FindPattern(ZeroPattern);
End;

function TCustomDigitDetection.FindPattern(pat:TCustomPattern): Boolean;
Begin
 Raise Exception.Create('You must override this method');
End;

procedure TCustomDigitDetection.DetectFrom(Strt:Integer);
begin
 Raise Exception.Create('You must override this method');
end;

procedure TCustomDigitDetection.ReadBuffer(Start: Integer;Filt:Boolean=true);
Var i:Integer;
Begin
 ClearBuffer;
 //We read 5 bytes before and 5 after\
 //so we can detect the edges
 f.position:=Start;
 f.read(buf,SmallBufferCNT);

 if filt then
  For i:=0 to SmallBufferCNT do
    buf[i]:=GetFilteredValue(buf[i]);

End;

procedure TCustomDigitDetection.ClearBuffer;
Var i:integer;
Begin
  For i:=0 to SmallBufferCNT do
    buf[i]:=0;
End;

function TCustomDigitDetection.GetFilteredValue(b:Byte): Byte;
begin
   Raise Exception.Create('You must override this method');
end;








{ TCustomPattern }

constructor TCustomPattern.Create(AOwner: TComponent);
begin
  inherited;
  descr:=TStringlist.create;
end;

destructor TCustomPattern.Destroy;
begin
  descr.free;
  inherited;
end;

function TCustomPattern.GetPatternDecr: string;
begin
  Result := Descr.text;
end;

procedure TCustomPattern.SetPatternDecr(const Value: string);
begin
 Descr.Text:=Value;
end;

procedure TCustomDigitDetection.Init(af: TStream;
  aByteList: TStringList);
begin
  f:=af;
  ByteList:=aBytelist;
end;

constructor TCustomDigitDetection.Create;
begin
   PilotSearch:=false;
   Mes:='';
   Problem:=false;
   LastLen:=0;
   Error:='';
   Bytelist:=nil;
   bitvalue:=128;
end;

destructor TCustomDigitDetection.Destroy;
begin
  inherited;

end;

procedure TCustomDigitDetection.FixEdge;
begin
  //abstract  
end;

function TCustomDigitDetection.CheckEndOfBlock: Boolean;
Var i:Integer;
    difcnt:Integer;
    bd:TBytedetected;
Begin
  ReadBuffer(CurrentSampl,false);
  difcnt:=0;
  For i:=0 to 39 do
  Begin
    if Abs (buf[i+1]-buf[i])<10 then
     inc(difcnt);
  End;
  result:= difcnt>32 ;

//  if result then
  Begin
   difcnt:=0;
  try
   for i:=bytelist.count-10 to bytelist.count-1 do
   Begin
     bd:=TBytedetected(Bytelist.objects[i]);
     if bd.Value=0 then
      inc(difcnt);
   End;
   result:= difcnt>8;
  except
    result:=false;
  end;
  End;
end;

procedure TCustomDigitDetection.SetToPattern(pat: TCustomPattern;Strt:Integer;
    Lensampl:Integer);
Var k,fs,i:integer;
    b,lst,cnt:byte;
    s:string;
    Adder:Integer;
begin
  k:=LenSampl;
  Pat.PatternLength:=k;
  pat.descr.Clear;
  fs:=strt;
  ReadBuffer(fs);

  b:=getfilteredvalue(buf[0+buffix]);
  cnt:=1;
  lst:=b;
  i:=1;
  Adder:=0;
  for k:=fs+1 to fs+pat.PatternLength+1 do
  Begin
   b:=getfilteredvalue(buf[i+buffix]);
   inc(i);
   if b=lst then
    inc(cnt)
   Else
   Begin
     if b>lst then
      s:='L'
     else
      s:='H';
     pat.descr.add(s+inttostr(cnt));
//     pat.descr.add(s+inttostr(cnt div 2+1+adder));
//     Adder:=adder+cnt;
     cnt:=1;
   End;
   lst:=b;
  End;
  if cnt>2 then
  begin
     if b<127 then
      s:='L'
     else
      s:='H';
     pat.descr.add(s+inttostr(cnt));
  end;
End;



end.
