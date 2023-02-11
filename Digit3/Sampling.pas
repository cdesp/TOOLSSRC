unit Sampling;

interface
uses Classes;

Var
  KHzSampling:Integer=22; //22KHz  or 44Khz 8Bit Mono

Function MaxSamples:Integer;
Function HalfSamples:Integer;

implementation

Function MaxSamples:Integer;
Begin
  case KHzSampling  of
    22:Result:=255;
    44:Result:=255;//65535; for 16 bit
  end;
end;

Function HalfSamples:Integer;
Begin
  case KHzSampling  of
    22:Result:=127;
    44:Result:=127; //32767; for 16 bit
  end;
end;


end.
