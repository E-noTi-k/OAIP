unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw;

type
  TProgramm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Programm: TProgramm;

implementation

{$R *.dfm}

procedure TProgramm.FormCreate(Sender: TObject);
var
  FilePath: string;
begin
FilePath := 'E:\Курсовые\Проект\О программе.htm';
FilePath := 'file:///' + StringReplace(FilePath, '\', '/', [rfReplaceAll]);
WebBrowser1.Navigate(FilePath);
end;

procedure TProgramm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F1 then
    begin
      winExec('hh HelpDemo.chm', SW_RESTORE);
    end;
end;

end.
