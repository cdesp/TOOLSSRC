unit NbKeymapMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, HotSpotImage, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    HotSpotImage1: THotSpotImage;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Savenewmapping1: TMenuItem;
    Exit1: TMenuItem;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabeledEdit1: TLabeledEdit;
    procedure HotSpotImage1HotSpotClick(Sender: TObject; HotSpot: THotSpot);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HotSpotImage1HotSpotRightClick(Sender: TObject;
      HotSpot: THotSpot);
    procedure Savenewmapping1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    procedure CheckRecord;
    function getNBKeyName(Key: word; Shift: TShiftState): String;
    { Private declarations }
  public
    { Public declarations }
    nbkeysnormal:TStringlist;
    nbkeysshifted:TStringlist;
    NBShifted:boolean;
    Recording:Boolean;
  end;

Const VERSION='1.0';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Exit1Click(Sender: TObject);
begin
   Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var innbemu:boolean;
    s:string;
begin
    caption:=caption+' - Version '+version;
    innbemu:= fileexists('..\newbrain.exe');
    if innbemu then
      s:='..\'
    else s:='';

    nbkeysnormal:=TStringlist.create;
    nbkeysnormal.Duplicates:=dupIgnore;
    nbkeysshifted:=TStringlist.create;
    nbkeysshifted.Duplicates:=dupIgnore;
    if fileexists(s+'keymap.txt') then
      nbkeysnormal.LoadFromFile(s+'keymap.txt');
    if fileexists(s+'keymap1.txt') then
      nbkeysshifted.LoadFromFile(s+'keymap1.txt');
    CheckRecord;
    application.HintHidePause:=6000;
end;

procedure TForm1.CheckRecord;
Begin
    if shape1.tag=0 then
       Shape1.Brush.Color:=clWhite
    else
     Shape1.Brush.Color:=clRed;
    Recording:=shape1.tag=1;
    speedbutton1.Enabled:=Recording;
    speedbutton2.Enabled:=Recording;
End;

function TForm1.getNBKeyName(Key:word;Shift: TShiftState):String;
Begin
   result:='';

     Case Key of
      13:Result:='ENTER';
      27:Result:='ESC';
      35:Result:='END';
      33:Result:='PGUP';
      34:Result:='PGDN';
      36:Result:='HOME';
      45:Result:='INS';
      46:Result:='DEL';
      19:Result:='BREAK';
    End;

    if result<>'' then exit;

   Result:='K#'+inttostr(key);
   if ssShift in Shift then
      Result:='SHFT_'+Result;
End;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var lookkey:Tstringlist;
    NBKeyID:Integer;
    NBKeyName:String;
    c:String;
    hsp:THotSpot;
    buttonSelected : Integer;
begin
   hsp:=nil;
   NBKeyID:=-1;


     //find the NBKey either on Normal or on shifted NB keys
   NBKeyName:=getNBKeyName(key,Shift);

   if not Recording then //testing the key encoding
   Begin
     if key=16 then exit; //Shift

     c:=nbkeysnormal.Values[NBKeyName];
     if c='' then
      c:=nbkeysshifted.Values[NBKeyName];
     if c<>'' then
       try
        NBKeyID:=strtoint(c);
       except
          NBKeyID:=-1;
       end;

     if nbkeyid<>-1 then
     Begin
       hsp:=HotSpotImage1.HotSpotByID(NBKeyID);
       if assigned(hsp) then
        hsp.Selected:=true;
     End;

      if not assigned(hsp) and (hotspotimage1.SelectedIndex<>-1) then
          HotSpotImage1.HotSpots[hotspotimage1.SelectedIndex].Selected:=false;

   End
   else
   Begin
    if (hotspotimage1.SelectedIndex=-1) then
    Begin
      ShowMessage('Please select a NB Key first by clicking on it!!!');
      exit;
    End;
    NBShifted:=Speedbutton2.Down;
    if not NBShifted then
     lookkey:=nbkeysnormal
    else
     lookkey:=nbkeysshifted;
    NBKeyID:=HotSpotImage1.HotSpots[hotspotimage1.SelectedIndex].id;
    if lookkey.Values[NBKeyName]<>'' then
    Begin
     buttonSelected:= MessageDlg('There is another value assigned to this keystroke.'#13' Do you want to replace it(OK), or CANCEL the assignment ',mtConfirmation,mbOkCancel,0 );
     if buttonSelected=mrOk then
      try
       lookkey.Delete(lookkey.IndexOfName(NBKeyName));
      except

      end;
     if buttonSelected=mrCancel then
       exit;
    End;
    lookkey.Values[NBKeyName]:=inttostr(NBKeyID);
    showmessage('Assignment Done!!!');
   End;

end;

procedure TForm1.HotSpotImage1HotSpotClick(Sender: TObject; HotSpot: THotSpot);
begin
 LabeledEdit1.Text:= hotspot.Name+'['+inttostr(hotspot.ID)+']';
end;

procedure TForm1.HotSpotImage1HotSpotRightClick(Sender: TObject;
  HotSpot: THotSpot);
var  buttonSelected : Integer;
   i:Integer;
begin
  buttonSelected:= MessageDlg('Are you sure to clear all assignments to this key? ',mtConfirmation,mbYesNo,0 );
  if buttonSelected=mrno then exit;
  for i := nbkeysnormal.Count-1 downto 0 do
  Begin
    if nbkeysnormal.ValueFromIndex[i]=inttostr(hotspot.ID) then
      nbkeysnormal.Delete(i);
  End;
  for i := nbkeysshifted.Count-1 downto 0 do
  Begin
    if nbkeysshifted.ValueFromIndex[i]=inttostr(hotspot.ID) then
      nbkeysshifted.Delete(i);
  End;
  if HotSpotImage1.SelectedIndex<>-1 then
    HotSpotImage1.HotSpots[HotSpotImage1.SelectedIndex].Selected:=false;
end;

procedure TForm1.Savenewmapping1Click(Sender: TObject);
var innbemu:boolean;
    s:string;
begin
    innbemu:= fileexists('..\newbrain.exe');
    if innbemu then
      s:='..\'
    else s:='';

    nbkeysnormal.SaveToFile(s+'keymap.txt');
    nbkeysshifted.SaveToFile(s+'keymap1.txt');
    if not innbemu then
       showmessage('Make sure files [''keymap.txt'',''keymap1.txt''] are placed at the same dir as Newbrain emulator executable');
end;

procedure TForm1.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  Begin
   if Shape1.Tag=0 then
   Begin
    Shape1.Tag:=1;
    Showmessage('1.Select a NB key by clicking on it.(also select if you want this tobe shifted or not)'#13'2.Press the button(s) on your PC keyboard to make a keystroke assignment');
   End
   else
    Shape1.Tag:=0;
  End;

  CheckRecord;
end;

end.
