unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw;

type
  TDeveloper = class(TForm)
    Image1: TImage;
    Image2: TImage;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Developer: TDeveloper;

implementation

{$R *.dfm}


procedure TDeveloper.FormCreate(Sender: TObject);
var
  FilePath: string;
begin
FilePath := 'E:\Курсовые\Проект\Об авторе.htm';
FilePath := 'file:///' + StringReplace(FilePath, '\', '/', [rfReplaceAll]);
WebBrowser1.Navigate(FilePath);

end;

procedure TDeveloper.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F1 then
    begin
      winExec('hh HelpDemo.chm', SW_RESTORE);
    end;
end;

end.
