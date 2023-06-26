program MigraFB;

uses
  Vcl.Forms,
  Home in 'Home.pas' {Form1},
  database in 'database.pas' {moduloDB: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TmoduloDB, moduloDB);
  Application.Run;
end.
