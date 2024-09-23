program Project;

uses
  System.StartUpCopy,
  FMX.Forms,
  spiral in 'spiral.pas' {Form1},
  main in 'main.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
