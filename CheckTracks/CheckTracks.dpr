{
//==========================================
//    $Date: 3/6/2004 - 3:41:46 �� $
//==========================================
//        (C) Hypersoft S.A. 
// ����� ��������� ��������� ���������� 
//          ����������� �������
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
