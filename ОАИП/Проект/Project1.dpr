program Project1;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Grafik},
  Unit5 in 'Unit5.pas' {Developer},
  Unit6 in 'Unit6.pas' {Programm},
  Unit1 in 'Unit1.pas' {SpalshF},
  Unit7 in 'Unit7.pas' {Menu2},
  Unit8 in 'Unit8.pas' {Error};

{$R *.res}

begin
 Application.Title := 'Построение и исследование квадратичных функций';
  Application.Initialize;
  SpalshF:=TSpalshF.Create(Application);
  SpalshF.Show;
  SpalshF.Update;
  while SpalshF.Timer1.Enabled do
    Application.ProcessMessages;
  Application.CreateForm(TMenu2, Menu2);
  Application.CreateForm(TGrafik, Grafik);
  Application.CreateForm(TDeveloper, Developer);
  Application.CreateForm(TProgramm, Programm);
  Application.CreateForm(TError, Error);
  SpalshF.Hide;
  SpalshF.Free;
  Application.Run;
end.
