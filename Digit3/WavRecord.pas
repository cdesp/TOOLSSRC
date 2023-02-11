unit WavRecord;

interface
uses mmsystem,Windows,classes;

Procedure StartRecording(cbc:TFNDrvCallBack);
Procedure StopRecording;


Var WHDr:WAVEHDR;
    MEmSt:TMemoryStream;
    BUFLEN:Integer=400;
    Testing:Boolean=true;
    TestBuffer:TMemoryStream;


implementation
uses Dialogs;
Var

  lphWaveIn: HWAVEIN; uDeviceID: UINT;
  lpFormatEx: TWaveFormatEx; dwCallback, dwInstance, dwFlags: DWORD ;
  Res:Integer;

  BytesRead:LongInt;
  Recording:Boolean=false;


Procedure MyCallb(hwin:Integer;umsg:Uint;dwinst,p1,p2:DWord);stdcall;
Var MYHDr:PWaveHdr;
    c:DWord;
    i:Integer;
    b:byte;
Begin

 case Umsg of
   WIM_OPEN:Begin


   end;


   WIM_DATA:Begin
      MYHDr:=PWaveHdr(p1);
      c:=MYHDr.dwBytesRecorded;
      BytesRead:=BytesRead+c;

      if c>0 then
      Begin
        TestBuffer.position:=0;
        TestBuffer.Write(MYHDr.lpData^,BUFLEN);

        if Not testing then
        Begin
         memst.Position:=memst.Size;
         memst.Write(MYHDr.lpData^,c);
        end;
      end;
      TFNDrvCallBack(dwinst)(0,0,0,0,0);
      if Recording then
       Res:=WaveInAddBuffer(lphWaveIn,@WHdr,SizeOF(WHDr));
   end;
  WIM_CLOSE:Begin
    memst.SaveToFile('Test.wav');
    memst.position:=0;
    ShowMessage('Stopped');


  end;

 end;


end;

Procedure StartRecording(cbc:TFNDrvCallBack);
var
  i: Integer;
Begin
  MEmSt:=TMemoryStream.create;
  MEmSt.Write(dwflags,1);

  uDeviceID:=WAVE_MAPPER;
  dwflags:=CALLBACK_FUNCTION;
  dwCallBack:=Integer(@MyCallb);
  lpFormatEx.wFormatTag:=WAVE_FORMAT_PCM;
  lpFormatEx.nChannels:=1;
  lpFormatEx.nSamplesPerSec:=44100;
  lpFormatEx.wBitsPerSample:=8;
  lpFormatEx.nBlockAlign:=(lpFormatEx.nChannels*lpFormatEx.wBitsPerSample) Div 8;
  lpFormatEx.nAvgBytesPerSec:=lpFormatEx.nSamplesPerSec * lpFormatEx.nBlockAlign ;
  lpFormatEx.cbSize:=0;


  dwInstance:=Integer(@cbc);
  Res:=WaveInOpen(@lphWaveIn,uDeviceID, @lpFormatEx, dwCallback,  dwInstance,  dwFlags);
  {  Result
   4 MMSYSERR_ALLOCATED Specified resource is already allocated.
   2 MMSYSERR_BADDEVICEID Specified device identifier is out of range.
   6 MMSYSERR_NODRIVER No device driver is present.
   7 MMSYSERR_NOMEM Unable to allocate or lock memory.
   32 WAVERR_BADFORMAT Attempted to open with an unsupported waveform-audio format.
  }

  GetMem(WHDr.lpData,BUFLEN);
  for i := 0 to BUFLEN - 1 do
    WHDr.lpData[i]:=#0;

  WHDr.dwBufferLength:= BUFLEN;
  WHDR.dwFlags:=0;

  Res:=WaveInPrepareHeader(lphWaveIn,@WHDr,SizeOF(WHDr));
{
MMSYSERR_INVALHANDLE Specified device handle is invalid.
MMSYSERR_NODRIVER No device driver is present.
MMSYSERR_NOMEM Unable to allocate or lock memory

}
  Recording:=true;
  Res:=WaveInAddBuffer(lphWaveIn,@WHdr,SizeOF(WHDr));
  {
MMSYSERR_INVALHANDLE Specified device handle is invalid.
MMSYSERR_NODRIVER No device driver is present.
MMSYSERR_NOMEM Unable to allocate or lock memory.
WAVERR_UNPREPARED The buffer pointed to by the pwh parameter hasn't been prepared.
}
  Res:=waveInStart(lphWaveIn);
  {
MMSYSERR_INVALHANDLE Specified device handle is invalid.
MMSYSERR_NODRIVER No device driver is present.
MMSYSERR_NOMEM Unable to allocate or lock memory.

  }

end;


Procedure StopRecording;
Begin
 Recording:=false;


 Res:=WaveInStop(lphWaveIn);
  {
  5 MMSYSERR_INVALHANDLE Specified device handle is invalid.
  6 MMSYSERR_NODRIVER No device driver is present.
  7 MMSYSERR_NOMEM Unable to allocate or lock memory.
}


  Res:=WaveInReset(lphWaveIn);
  {
  5 MMSYSERR_INVALHANDLE Specified device handle is invalid.
  6 MMSYSERR_NODRIVER No device driver is present.
  7 MMSYSERR_NOMEM Unable to allocate or lock memory.
}

 WaveInUnPrepareHeader(lphWaveIn,@WHDr, SizeOF(WHDr));
 {
 MMSYSERR_INVALHANDLE Specified device handle is invalid.
MMSYSERR_NODRIVER No device driver is present.
MMSYSERR_NOMEM Unable to allocate or lock memory.
WAVERR_STILLPLAYING The buffer pointed to by the pwh parameter is still in the queue.

 }

  Res:=Waveinclose(lphWaveIn);
end;


Initialization
 TestBuffer:=TMemoryStream.create;

end.
