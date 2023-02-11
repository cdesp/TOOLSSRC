{
//==========================================
//    $Date: 13/9/2004 - 11:32:37 πμ $
//==========================================
//        (C) Hypersoft S.A. 
// Τμήμα Ανάπτυξης Εφαρμογών Λογισμικού 
//          Δεσποινίδης Χρήστος
//==========================================
}
//--END HS INFO--
program NBDigit3;

uses
  Forms,
  NBDigit in 'NBDigit.pas' {fnbdig},
  NBFixSel in 'NBFixSel.pas' {frmbyted},
  CustDetEngine in 'CustDetEngine.pas',
  DetEngine1 in 'DetEngine1.pas',
  EdgeDetEngine in 'EdgeDetEngine.pas',
  PulseDetEngine in 'PulseDetEngine.pas',
  Sampling in 'Sampling.pas',
  WavRecord in 'WavRecord.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfnbdig, fnbdig);
  Application.CreateForm(Tfrmbyted, frmbyted);
  // Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
