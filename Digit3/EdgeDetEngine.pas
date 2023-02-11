unit EdgeDetEngine;

interface
uses classes,CustDetEngine;


Type
    TEdgeDetEngine = class(TCustomDigitDetection)
    private
    public
         procedure DetectFrom(Strt:Integer); override;
         function FindPattern(pat:TCustomPattern): Boolean; override;
         function GetFilteredValue(b:Byte): Byte; override;
         procedure FixEdge; override;
    End;

implementation
uses SysUtils;

procedure TEdgeDetEngine.DetectFrom(Strt:Integer);
Var s:String;
    IsPilot:Boolean;
    IsZero:Boolean;
    ISOne:Boolean;
    PilotSample:Integer;
    OneSample:Integer;
    ZeroSample:Integer;

    FlPilot,FlOne,FlZero:Boolean;

    lp,l1,l0:Integer;

begin

 s:='';
 ReadBuffer(Strt);
 flpilot:= CheckPilot;
 lp:=lastlen;
 PilotSample:=CurrentSampl;
 CurrentSampl:=strt;

 flone:= CheckOne;
 l1:=lastlen;
 OneSample:=CurrentSampl;
 CurrentSampl:=strt;

 flzero:= Checkzero;
 l0:=lastlen;
 ZeroSample:=CurrentSampl;
 CurrentSampl:=strt;

 IsPilot:=flpilot and not flone;
 IsOne:=flOne;
 isZero:=flzero;

 If ispilot and iszero then
 Begin
   if pilotsearch then
    iszero:=false
   else
    ispilot:=false;
 End;

 If not Ispilot and isone and iszero then
  iszero:=false;

 If ispilot then
   s:=s+'Pilot';
 If isone then
   s:=s+' One';
 If isZero then
   s:=s+' Zero';

 if s='' then
  s:='Not Detected';



 BitValue:=128;
 If IsPilot then
  BitValue:=255;
 If IsZero then
  BitValue:=0;
 If IsOne then
  BitValue:=1;

 Case bitvalue of
  0:Begin
     Lastlen:=l0;
     Currentsampl:=ZeroSample;
    End;
  1:Begin
     Lastlen:=l1;
     Currentsampl:=OneSample;
    End;
  255:Begin
        Lastlen:=lp;
        Currentsampl:=PilotSample;
      End;
  128:Begin
       Lastlen:=OneLen;
       Currentsampl:=strt;
      End;
 End;

 Problem:=(IsPilot and isone) or
          (ISpilot and iszero) or
          (isone and iszero) or
          (BitValue=128);

 if problem then s:=s+' (PROBLEM)';

 Mes:=s;
end;

function TEdgeDetEngine.FindPattern(pat:TCustomPattern): Boolean;
Var i:Integer;
    v,vd:Integer;
    s:String;
    sl: TStringlist;

    cnt:Integer;
    det:TStringlist;
    t:integer;

    Procedure GetPattern;
    Var k,fs,i:integer;
        b,lst,cnt:byte;
        s:string;
    begin
     det.Clear;
     b:=getFilteredvalue(buf[t]);
     cnt:=1;
     lst:=b;
     i:=1;
     for k:=t+1 to 49-t+1 do
     Begin
      b:=getFilteredvalue(buf[t+i]);
      inc(i);
      if b=lst then
       inc(cnt)
      Else
      Begin
       if cnt>=2 then
       Begin
        if b>lst then
         s:='L'
        else
         s:='H';
        det.add(s+inttostr(cnt));
       End;
       cnt:=1;
      End;
      lst:=b;
     End;
   end;

 var l:Integer;
     s1,s2:String;
Begin
  sl:=pat.descr;
  det:=TStringlist.create;


  For t:=0 to 9 do  //check from current sample until
  Begin             //current sample+ 9
     GetPattern;
     l:=0;
     Result:=True;
     For i:=0 to sl.count-1 do
     Begin
        if i>= det.count then break;

        s1:=sl[i];
        s2:=det[i];

        s:=Copy(s1,2,maxint);
        try
          v:=Strtoint(s);
        Except
         v:=0;
        End;

        s:=Copy(s2,2,maxint);
        try
         vd:=Strtoint(s);
        Except
          vd:=0;
        End;

        l:=l+vd;

        if s1[1]<>s2[1] then
          result:=false;

        if not ((v-Sensitivity<=vd) and (vd<=v+Sensitivity)) then
          result:=false;

        If not result then break;
     End;
     If result then break;
  End;
  currentsampl:=currentsampl+t;

  if result then
   Lastlen:=l;
End;

procedure TEdgeDetEngine.FixEdge;
    var sml:Integer;
        Low:Byte;
        i,j:Integer;
        minb:Integer;
        edgf:Boolean;

        Near1,near2:Integer;
    Begin
     exit;
     CurrentSampl:=CurrentSampl-1; //2

     sml:=CurrentSampl;
     ReadBuffer(sml);
     sml:=sml-5;
     minb:=buf[5];

     For i:=0 to 49 do
      buf[i]:=GetfilteredValue(buf[i]);

     if buf[4]<>minb then exit;


     j:=5;
     edgf:=false;
     Near1:=0;
     Near2:=0;

     For i:=6 to 5+5 do
     Begin
       if minb<>buf[i] then
       Begin
         Near1:=i-5;
         Break;
       End;
     End;


     if not edgf then
     Begin
      For i:=4 downto 5-3 do
      Begin
        if minb<>buf[i] then
        Begin
          near2:=i-5;
          Break;
        End;
      End;
     End;

     edgf:=(near1<>0) or (near2<>0);

     if edgf then
     Begin
      if (Near2=0) then
        near2:=5555;
      if (Near1=0) then
        near1:=5555;


      if abs(near2)<near1 then
       CurrentSampl:=CurrentSampl+near2+1 //is negative
      else
       CurrentSampl:=CurrentSampl+near1+1; //is positive

       //if  ByteDetecting then
        // CurrentSampl:=CurrentSampl+2;
     End;

    End;

function TEdgeDetEngine.GetFilteredValue(b:Byte): Byte;
begin
  if b>127+5
    then Result:=255
  else
  if b<127-5 then
   Result:=0
  else
   Result:=lastb;

  Lastb:=Result; 
end;


end.
