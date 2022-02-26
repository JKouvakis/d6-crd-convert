unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ExtCtrls, StdCtrls, ComCtrls, IniFiles,strutils;

type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    Exit: TMenuItem;
    Options: TMenuItem;
    Language: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAboutItem: TMenuItem;
    HTML1: TMenuItem;
    RTF1: TMenuItem;
    ToolbarImages: TImageList;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Title: TLabeledEdit;
    Artist: TLabeledEdit;
    Composer: TLabeledEdit;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Settings: TMenuItem;
    N2: TMenuItem;
    GroupBox4: TGroupBox;
    RichEdit1: TRichEdit;
    Default1: TMenuItem;
    procedure MenuItemClick(Sender: TObject);
    procedure changelng(Sender: TObject);
    procedure langread(Sender: TObject);
    procedure EnglishClick(Sender: TObject);
    procedure GreekClick(Sender: TObject);
    procedure FileNewItemClick(Sender: TObject);
    procedure SettingsClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FileOpenItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  Form1: TForm1;
  lang: array[1..30,0..1] of String;
  LangFile : array[1..20,1..2] of string;
  langn: Integer;
  langpath : string;

implementation

uses Unit2;

{$R *.dfm}

function langget(A: string; I: integer): string;
var
  F: TextFile;
  line,res: string;
begin
    AssignFile(F, Langpath+LangFile[I,1]);
    Reset(F);
    repeat
      Readln(F, Line);
      If pos(A,Line) = 1 then
        begin
          Res := midstr(Line,pos('"',Line),Length(Line));
          Result := midstr(res,2,length(res)-2);
        end;
    until EOF(F);
    Close(F);
end;

procedure TForm1.langread(Sender: TObject);
var
   i: integer;
   sr: TSearchRec;
begin
   i:=1;
   if FindFirst(langpath + '*.lng',faAnyFile,sr) = 0 then
     repeat
       LangFile[i,1]:=sr.Name;
       i:=i+1;
     until FindNext(sr) <> 0;
   FindClose(sr);
   i:=1;
   repeat
     LangFile[i,2]:=langget('langid',i);
     MainMenu.Items[1].Items[0].Add(TMenuItem.Create(Self));
     MainMenu.Items[1].Items[0].Items[i].Caption := (LangFile[i,2]);
     MainMenu.Items[1].Items[0].Items[i].Tag := i;
     MainMenu.Items[1].Items[0].Items[i].OnClick := MenuItemClick;
     i:=i+1;
   until LangFile[i,1] = '';
end;

procedure TForm1.MenuItemClick(Sender: TObject);
var
  MyIniFile: TIniFile;
  i,j: integer;
begin
  MyIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'crdconv.ini');
  i := TMenuItem(Sender).Tag;
  for j:=0 to MainMenu.Items[1].Items[0].Count -1 do
  begin
    if i=j then
      MainMenu.Items[1].Items[0].Items[j].Checked := True
    else
      MainMenu.Items[1].Items[0].Items[j].Checked := False;
  end;
  MyIniFile.WriteString('Settings','Language',inttostr(i));
  MyIniFile.Free;
  langn := i;
  changelng(Form1);
end;

procedure TForm1.changelng(Sender: TObject);
var
   j,i: integer;
begin

   i:=langn;

   // Default Lang
   lang[1,0] := 'File';
   lang[2,0] := 'New';
   lang[3,0] := 'Open...';
   lang[4,0] := 'Save';
   lang[5,0] := 'Export';
   lang[6,0] := 'Html';
   lang[7,0] := 'RTF';
   lang[8,0] := 'Exit';
   lang[9,0] := 'Options';
   lang[10,0] := 'Language';
   lang[13,0] := 'Settings';
   lang[14,0] := 'Help';
   lang[15,0] := 'About...';
   lang[16,0] := 'Informations : ';
   lang[17,0] := 'Title :';
   lang[18,0] := 'Artist : ';
   lang[19,0] := 'Composer : ';
   lang[20,0] := 'Tone : ';
   lang[21,0] := 'Convert to : ';
   lang[22,0] := 'Objects : ';
   lang[23,0] := 'Text : ';
   lang[24,0] := 'Chords : ';
   lang[25,0] := 'Other : ';
   lang[26,0] := 'Song : ';
   lang[27,0] := 'This is a text sample';

   for j:=1 to 27 do
   begin
     if (i <> 0) and (langget('lang[' + inttostr(j) + ']',i) <> '') then
       lang[j,1]:=langget('lang[' + inttostr(j) + ']',i)
     else
       lang[j,1]:=lang[j,0];
   end;

   MainMenu.Items[0].Caption := lang[1,1];
   MainMenu.Items[0].Items[0].Caption := lang[2,1];
   MainMenu.Items[0].Items[1].Caption := lang[3,1];
   MainMenu.Items[0].Items[2].Caption := lang[4,1];
   MainMenu.Items[0].Items[3].Caption := lang[5,1];
   MainMenu.Items[0].Items[3].Items[0].Caption := lang[6,1];
   MainMenu.Items[0].Items[3].Items[1].Caption := lang[7,1];
   MainMenu.Items[0].Items[5].Caption := lang[8,1];
   MainMenu.Items[1].Caption := lang[9,1];
   MainMenu.Items[1].Items[0].Caption := lang[10,1];
   MainMenu.Items[1].Items[2].Caption := lang[13,1];
   MainMenu.Items[2].Caption := lang[14,1];
   MainMenu.Items[2].Items[0].Caption := lang[15,1];
   GroupBox1.Caption := lang[16,1];
   GroupBox2.Caption := lang[20,1];
   GroupBox3.Caption := lang[22,1];
   GroupBox4.Caption := lang[26,1];
   Title.EditLabel.Caption := lang[17,1];
   Artist.EditLabel.Caption := lang[18,1];
   Composer.EditLabel.Caption := lang[19,1];
   Label1.Caption := lang[21,1];
   RadioButton1.Caption := lang[23,1];
   RadioButton2.Caption := lang[24,1];
   RadioButton3.Caption := lang[25,1];

   Form2.GroupBox1.Caption := lang[23,1];
   Form2.GroupBox2.Caption := lang[24,1];
   Form2.GroupBox3.Caption := lang[25,1];
   Form2.Label1.Caption := lang[27,1];
   Form2.Label2.Caption := lang[27,1];
   Form2.Label3.Caption := lang[27,1];
   Form2.Caption := lang[13,1];

end;

procedure TForm1.EnglishClick(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  MyIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'crdconv.ini');
  MyIniFile.WriteString('Settings','Language','0');
  MyIniFile.Free;
   langn := 0;
   changelng(Form1);
end;

procedure TForm1.GreekClick(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  MyIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'crdconv.ini');
  MyIniFile.WriteString('Settings','Language','1');
  MyIniFile.Free;
   langn := 1;
   changelng(Form1);
end;

procedure TForm1.FileNewItemClick(Sender: TObject);
begin
  Title.Text := '';
  Artist.Text := '';
  Composer.Text := '';
  RadioButton1.Checked := true;
  RichEdit1.Text := '';
end;

procedure TForm1.SettingsClick(Sender: TObject);
begin
   Form2.Enabled := True;
   Form2.Visible := True;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  RichEdit1.SelAttributes.Name := Form2.Label1.Font.Name;
  RichEdit1.SelAttributes.Size := Form2.Label1.Font.Size;
  RichEdit1.SelAttributes.Color := Form2.Label1.Font.Color;
  RichEdit1.SelAttributes.Style := Form2.Label1.Font.Style;
  RichEdit1.SetFocus;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  RichEdit1.SelAttributes.Name := Form2.Label2.Font.Name;
  RichEdit1.SelAttributes.Size := Form2.Label2.Font.Size;
  RichEdit1.SelAttributes.Color := Form2.Label2.Font.Color;
  RichEdit1.SelAttributes.Style := Form2.Label2.Font.Style;
  RichEdit1.SetFocus;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  RichEdit1.SelAttributes.Name := Form2.Label3.Font.Name;
  RichEdit1.SelAttributes.Size := Form2.Label3.Font.Size;
  RichEdit1.SelAttributes.Color := Form2.Label3.Font.Color;
  RichEdit1.SelAttributes.Style := Form2.Label3.Font.Style;
  RichEdit1.SetFocus;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  RichEdit1.Font := Form2.Label1.Font;
  RichEdit1.SetFocus;
end;

procedure TForm1.FileOpenItemClick(Sender: TObject);
begin
  OpenDialog1.Execute
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  langpath := ExtractFilePath(Application.ExeName) + 'Languages\';
  MyIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'crdconv.ini');
  if MyIniFile.ReadString('Settings','Language','') = '' then
    begin
      MyIniFile.WriteString('Settings','Language','0');
      langn := 0;
    end
  else
    langn:= strtoint(MyIniFile.ReadString('Settings','Language',''));
  MyIniFile.Free;

  langread(Form1);

  changelng(Form1);
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
   Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   ShowMessage(ExtractFilePath(Application.ExeName)+'Languages\');
end;

end.
