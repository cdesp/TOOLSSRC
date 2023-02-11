unit PulseDetEngine;

interface

uses CustDetEngine,Classes;

type
    TPulseDetEngine = class(TCustomDigitDetection)


    private
    public
         procedure DetectFrom(Strt:Integer); override;
         function FindPattern(pat:TCustomPattern): Boolean; override;
         function GetFilteredValue(b:Byte): Byte; override;
         procedure FixEdge; override;
    End;



implementation
uses sysutils,Sampling;

Function MinPilotLength:Integer;
Begin
  case KhzSampling of
     22:Result:=24;
     44:Result:=48;
  end;
end;

Function MaxPilotLength:Integer;
Begin
  case KhzSampling of
     22:Result:=38;
     44:Result:=78;
  end;
end;


Function MaxOneLength:Integer;
Begin
  case KhzSampling of
     22:Result:=24;
     44:Result:=48;
  end;

end;

Function MaxZeroLength:Integer;
Begin
  case KhzSampling of
     22:Result:=21;
     44:Result:=42;
  end;

end;


procedure TPulseDetEngine.DetectFrom(Strt:Integer);
Var s:String;
    IsPilot:Boolean;
    IsZero:Boolean;
    ISOne:Boolean;

    FlPilot,FlOne,FlZero:Boolean;

    lp,l1,l0:Integer;

begin

 s:='';
 ReadBuffer(Strt,False);
 flpilot:= CheckPilot and (lastlen>MinPilotLength);//pilots tend to be large
 lp:=lastlen;
 flone:= CheckOne and (lastlen<MaxOneLength);
 l1:=lastlen;
 flzero:= Checkzero and (lastlen<MaxZeroLength);
 l0:=lastlen;

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
  0:Lastlen:=l0;
  1:Lastlen:=l1;
  255:Lastlen:=lp;
  128:Lastlen:=OneLen;
 End;

 Problem:=(IsPilot and isone) or
          (ISpilot and iszero) or
          (isone and iszero) or
          (BitValue=128);

 if problem then s:=s+' (PROBLEM)';

 Mes:=s;
end;

function TPulseDetEngine.FindPattern(pat:TCustomPattern): Boolean;
Var i:Integer;
    v,vd:Integer;
    s:String;
    sl: TStringlist;

    cnt:Integer;
    det:TStringlist;
    PulseCnt:Integer;
    HighestValue,LowestValue:Integer;

    Procedure GetPattern;
    Var k,fs,i:integer;
        b,lst,cnt:byte;
        s:string;
    begin
     det.Clear;
     b:=getFilteredvalue(buf[0+buffix]);
     cnt:=1;
     PulseCnt:=1;
     lst:=b;
     i:=1;
     HighestValue:=-5;
     LowestValue:=70000;
     for k:=1 to MaxPilotLength+1 do
     Begin
      b:=getFilteredvalue(buf[i+buffix]);
      if buf[i+buffix]>HighestValue then
         HighestValue:=buf[i+buffix];
      if buf[i+buffix]<LowestValue then
         LowestValue:=buf[i+buffix];
      inc(i);
      if b=lst then
       inc(cnt)
      Else
      Begin
       if cnt>=2 then
       Begin
        if b>lst then
        Begin
         if LowestValue>(mediumVal-10) then
           s:='k' //error
         Else
          s:='L';
        End
        else
        Begin
         if HighestValue<(mediumVal+10) then
           s:='j' //error
         Else
          s:='H';
        End;
        det.add(s+inttostr(cnt));
        HighestValue:=-5;
        LowestValue:=70000;
       End;
       cnt:=1;
       Inc(PulseCnt);
       if PulseCnt>4 then //max 4 pulses
        Break;
      End;
      lst:=b;
     End;
   end;

 var l:Integer;
Begin
  sl:=pat.descr;
  Result:=True;
  det:=TStringlist.create;   //should be freed somewhere
  GetPattern;
  if det.count=0 then
  Begin
   result:=false;
   det.free;
   Exit;
  end;

  l:=0;
  For i:=0 to sl.count-1 do
  Begin
   if i>= det.count then break;

   s:=Copy(sl[i],2,maxint);
   try
     v:=Strtoint(s);
   Except
     v:=0;
   End;

   s:=Copy(det[i],2,maxint);
   try
     vd:=Strtoint(s);
   Except
     vd:=0;
   End;

   l:=l+vd;

   if sl[i][1]<>det[i][1] then
    result:=false;

   //if not ((v-Sensitivity<=vd) and (vd<=v+Sensitivity)) then
   if ABS(v-vd)>Sensitivity then
   Begin
    if (i=sl.count-1) and (pulsecnt>4) then

    Else
     result:=false;
   end;

   If not result then break;
  End;
  if result then
   Lastlen:=l;
End;

procedure TPulseDetEngine.FixEdge;
    var sml:Integer;
        Low:Byte;
        i,j:Integer;
        minb:Integer;
        edgf:Boolean;

        Near1,near2:Integer;
    Begin
    Exit;//Not used

     CurrentSampl:=CurrentSampl-1; //2

     sml:=CurrentSampl;
     ReadBuffer(sml);
     sml:=sml-5;
     minb:=buf[5];
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

function TPulseDetEngine.GetFilteredValue(b:Byte): Byte;
begin
  if b>MediumVal
    then Result:=MaxSamples
  else
  if b<MediumVal then
   Result:=0
  else
   Result:=lastb;

  Lastb:=Result; 
end;


end.
