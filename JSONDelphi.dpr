program JSONDelphi;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  RootUnit in 'RootUnit.pas',
  superdate in 'superobject-master\superdate.pas',
  superobject in 'superobject-master\superobject.pas',
  supertimezone in 'superobject-master\supertimezone.pas',
  supertypes in 'superobject-master\supertypes.pas',
  superxmlparser in 'superobject-master\superxmlparser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
