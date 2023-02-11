{
//==========================================
//    $Date: 16/6/2004 - 2:03:03 μμ $
//==========================================
//        (C) Hypersoft S.A. 
// Τμήμα Ανάπτυξης Εφαρμογών Λογισμικού 
//          Δεσποινίδης Χρήστος
//==========================================
}
//--END HS INFO--
program Croms;

uses
  Forms,
  Cr in 'Cr.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
