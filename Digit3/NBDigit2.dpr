{
//==========================================
//    $Date: 13/9/2004 - 11:32:37 ?? $
//==========================================
//        (C) Hypersoft S.A. 
// ????? ????????? ????????? ?????????? 
//          ??????????? ???????
//==========================================
}
//--END HS INFO--
program NBDigit2;

uses
  Forms,
  NBDigit in 'NBDigit.pas' {fnbdig},
  NBFixSel in 'NBFixSel.pas' {frmbyted},
  Unit1 in '..\Loadcass3\Unit1.pas' {Form1},
  CustDetEngine in 'CustDetEngine.pas',
  DetEngine1 in 'DetEngine1.pas',
  EdgeDetEngine in 'EdgeDetEngine.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfnbdig, fnbdig);
  Application.CreateForm(Tfrmbyted, frmbyted);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
