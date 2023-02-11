unit DetEngine1;

interface
uses classes,CustDetEngine;

Type

    TDetDigEngine1=Class(TCustomDigitDetection)


    private
    public
         procedure DetectFrom(Strt:Integer); override;
         function FindPattern(pat:TCustomPattern): Boolean; override;
         function GetFilteredValue(b:Byte): Byte; override;
         procedure FixEdge; override;
    End;

implementation
uses sysutils;

procedure TDetDigEngine1.DetectFrom(Strt:Integer);
Var s:String;
    IsPilot:Boolean;
    IsZero:Boolean;
    ISOne:Boolean;

    FlPilot,FlOne,FlZero:Boolean;

    lp,l1,l0:Integer;

begin

 s:='';
 ReadBuffer(Strt);
 flpilot:= CheckPilot;
 lp:=lastlen;
 flone:= CheckOne;
 l1:=lastlen;
 flzero:= Checkzero;
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

function TDetDigEngine1.FindPattern(pat:TCustomPattern): Boolean;
Var i:Integer;
    v,vd:Integer;
    s:String;
    sl: TStringlist;

    cnt:Integer;
    det:TStringlist;

    Procedure GetPattern;
    Var k,fs,i:integer;
        b,lst,cnt:byte;
        s:string;
    begin
     det.Clear;
     b:=getFilteredvalue(buf[0+buffix]);
     cnt:=1;
     lst:=b;
     i:=1;
     for k:=1 to 36+1 do
     Begin
      b:=getFilteredvalue(buf[i+buffix]);
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
Begin
  sl:=pat.descr;
  Result:=True;
  det:=TStringlist.create;
  GetPattern;

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

   if not ((v-Sensitivity<=vd) and (vd<=v+Sensitivity)) then
     result:=false;

   If not result then break;
  End;
  if result then
   Lastlen:=l;
End;

function TDetDigEngine1.GetFilteredValue(b:Byte): Byte;
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

procedure TDetDigEngine1.FixEdge;
    var sml:Integer;
        Low:Byte;
        i,j:Integer;
        minb:Integer;
        edgf:Boolean;

        Near1,near2:Integer;
    Begin
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




end.
