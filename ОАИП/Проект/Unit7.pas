unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TMenu2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Button1: TButton;
    Button3: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu2: TMenu2;

implementation

{$R *.dfm}

uses unit6, unit5, Unit2, Unit1;


procedure TMenu2.Button1Click(Sender: TObject);
begin
  Grafik.Show;
  Hide;
end;

procedure TMenu2.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TMenu2.FormActivate(Sender: TObject);
begin
Label2.Caption:='Квадратичная функция это - функция,' +#13#10+'   которую можно записать формулой' +#13#10+'   вида y = ax2 + bx + c,' +#13#10+ '   где x – независимая переменная,' +#13#10+'   a, b и c – некоторые числа, причем a≠0.';
Label3.Caption:='Исследование функции это - определении ' +#13#10+'   основных параметров заданной функции. ' +#13#10+'   Одной из целей исследования является ' +#13#10+'   построение графика функции.'
end;

procedure TMenu2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F1 then
    begin
      winExec('hh HelpDemo.chm', SW_RESTORE);
    end;
end;

procedure TMenu2.N2Click(Sender: TObject);
begin
  Developer.Show;
end;

procedure TMenu2.N3Click(Sender: TObject);
begin
  Programm.Show;
end;

procedure TMenu2.N4Click(Sender: TObject);
begin
Close;
end;

procedure TMenu2.N5Click(Sender: TObject);
begin
  Grafik.Show;
  Hide;
end;

procedure TMenu2.N7Click(Sender: TObject);
begin
winExec('hh HelpDemo.chm', SW_RESTORE);
end;

end.
