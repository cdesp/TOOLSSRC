{
//==========================================
//    $Date: 3/6/2004 - 3:41:46 μμ $
//==========================================
//        (C) Hypersoft S.A. 
// Τμήμα Ανάπτυξης Εφαρμογών Λογισμικού 
//          Δεσποινίδης Χρήστος
//==========================================
}
//--END HS INFO--
program CheckTracks;

uses
  Forms,
  ct in 'ct.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
