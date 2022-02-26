unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SVFontCombos, ExtCtrls, IniFiles, Buttons;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    TextFS: TFontSizeComboBox;
    TextC: TColorBox;
    ChordC: TColorBox;
    ChordFS: TFontSizeComboBox;
    OtherFS: TFontSizeComboBox;
    OtherC: TColorBox;
    TextFSTB: TSpeedButton;
    TextFSTI: TSpeedButton;
    TextFSTU: TSpeedButton;
    ChordFSTB: TSpeedButton;
    ChordFSTI: TSpeedButton;
    ChordFSTU: TSpeedButton;
    OtherFSTB: TSpeedButton;
    OtherFSTI: TSpeedButton;
    OtherFSTU: TSpeedButton;
    Chord: TComboBox;
    Other: TComboBox;
    Text: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Fonts(Sender: TObject);
    procedure TextFSTBClick(Sender: TObject);
    procedure TextFSTIClick(Sender: TObject);
    procedure TextFSTUClick(Sender: TObject);
    procedure ChordFSTBClick(Sender: TObject);
    procedure ChordFSTIClick(Sender: TObject);
    procedure ChordFSTUClick(Sender: TObject);
    procedure OtherFSTBClick(Sender: TObject);
    procedure OtherFSTIClick(Sender: TObject);
    procedure OtherFSTUClick(Sender: TObject);
    procedure OtherFSChange(Sender: TObject);
    procedure ChordFSChange(Sender: TObject);
    procedure TextFSChange(Sender: TObject);
    procedure TextCChange(Sender: TObject);
    procedure ChordCChange(Sender: TObject);
    procedure OtherCChange(Sender: TObject);
    procedure TextChange(Sender: TObject);
    procedure ChordChange(Sender: TObject);
    procedure OtherChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Fonts(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  MyIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'crdconv.ini');
  if MyIniFile.ReadString('Text','TextFN','') = '' then
     begin
       MyIniFile.WriteString('Text','TextFN','Times New Roman');
       MyIniFile.WriteString('Text','TextFS','10');
       MyIniFile.WriteString('Text','TextFStB','0');
       MyIniFile.WriteString('Text','TextFStI','0');
       MyIniFile.WriteString('Text','TextFStU','0');
       MyIniFile.WriteString('Text','TextFC','clBlack');
     end;
  Text.ItemIndex := Text.Items.IndexOf(MyIniFile.ReadString('Text','TextFN',''));
  label1.Font.Name := MyIniFile.ReadString('Text','TextFN','');
  TextFS.FontName := label1.Font.Name;
  TextFS.ItemIndex := TextFS.Items.IndexOf(MyIniFile.ReadString('Text','TextFS',''));
  label1.Font.Size := strtoint(TextFS.Text);
  TextC.ItemIndex := TextC.Items.IndexOf(MyIniFile.ReadString('Text','TextFC',''));
  If strtoint(MyIniFile.ReadString('Text','TextFSTB','')) = 0 then
    TextFStB.Down := False
  else
    TextFStB.Down := True;
  If strtoint(MyIniFile.ReadString('Text','TextFSTI','')) = 0 then
    TextFStI.Down := False
  else
    TextFStI.Down := True;
  If strtoint(MyIniFile.ReadString('Text','TextFSTU','')) = 0 then
    TextFStU.Down := False
  else
    TextFStU.Down := True;

  if MyIniFile.ReadString('Chords','ChordFN','') = '' then
     begin
       MyIniFile.WriteString('Chords','ChordFN','Times New Roman');
       MyIniFile.WriteString('Chords','ChordFS','10');
       MyIniFile.WriteString('Chords','ChordFStB','1');
       MyIniFile.WriteString('Chords','ChordFStI','1');
       MyIniFile.WriteString('Chords','ChordFStU','0');
       MyIniFile.WriteString('Chords','ChordFC','clMaroon');
     end;
  Chord.ItemIndex := Chord.Items.IndexOf(MyIniFile.ReadString('Chords','ChordFN',''));
  label2.Font.Name := MyIniFile.ReadString('Chords','CordFN','');
  ChordFS.FontName := label2.Font.Name;
  ChordFS.ItemIndex := CHordFS.Items.IndexOf(MyIniFile.ReadString('Chords','ChordFS',''));
  label2.Font.Size := strtoint(ChordFS.Text);
  ChordC.ItemIndex := TextC.Items.IndexOf(MyIniFile.ReadString('Chords','ChordFC',''));
  If strtoint(MyIniFile.ReadString('Chords','ChordFSTB','')) = 0 then
    ChordFStB.Down := False
  else
    ChordFStB.Down := True;
  If strtoint(MyIniFile.ReadString('Chords','ChordFSTI','')) = 0 then
    ChordFStI.Down := False
  else
    ChordFStI.Down := True;
  If strtoint(MyIniFile.ReadString('Chords','ChordFSTU','')) = 0 then
    ChordFStU.Down := False
  else
    ChordFStU.Down := True;

  if MyIniFile.ReadString('Others','OtherFN','') = '' then
     begin
       MyIniFile.WriteString('Others','OtherFN','Times New Roman');
       MyIniFile.WriteString('Others','OtherFS','8');
       MyIniFile.WriteString('Others','OtherFStB','0');
       MyIniFile.WriteString('Others','OtherFStI','1');
       MyIniFile.WriteString('Others','OtherFStU','0');
       MyIniFile.WriteString('Others','OtherFC','clOlive');
     end;
  Other.ItemIndex := Other.Items.IndexOf(MyIniFile.ReadString('Others','OtherFN',''));
  label3.Font.Name := MyIniFile.ReadString('Others','OtherFN','');
  OtherFS.FontName := label3.Font.Name;
  OtherFS.ItemIndex := CHordFS.Items.IndexOf(MyIniFile.ReadString('Others','OtherFS',''));
  label3.Font.Size := strtoint(OtherFS.Text);
  OtherC.ItemIndex := OtherC.Items.IndexOf(MyIniFile.ReadString('Others','OtherFC',''));
  If strtoint(MyIniFile.ReadString('Others','OtherFSTB','')) = 0 then
    OtherFStB.Down := False
  else
    OtherFStB.Down := True;
  If strtoint(MyIniFile.ReadString('Others','OtherFSTI','')) = 0 then
    OtherFStI.Down := False
  else
    OtherFStI.Down := True;
  If strtoint(MyIniFile.ReadString('Others','OtherFSTU','')) = 0 then
    OtherFStU.Down := False
  else
    OtherFStU.Down := True;

  MyIniFile.Free;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 Text.Items := Screen.Fonts;
 Chord.Items := Screen.Fonts;
 Other.Items := Screen.Fonts;
 Fonts(Form2);
end;

procedure TForm2.TextFSTBClick(Sender: TObject);
begin
   If TextFSTB.Down = true then
     Label1.Font.Style := Label1.Font.Style + [fsBold]
   else
     Label1.Font.Style := Label1.Font.Style - [fsBold]
end;

procedure TForm2.TextFSTIClick(Sender: TObject);
begin
   If TextFSTI.Down = true then
     Label1.Font.Style := Label1.Font.Style + [fsItalic]
   else
     Label1.Font.Style := Label1.Font.Style - [fsItalic]
end;

procedure TForm2.TextFSTUClick(Sender: TObject);
begin
   If TextFSTU.Down = true then
     Label1.Font.Style := Label1.Font.Style + [fsUnderline]
   else
     Label1.Font.Style := Label1.Font.Style - [fsUnderline]
end;

procedure TForm2.ChordFSTBClick(Sender: TObject);
begin
   If ChordFSTB.Down = true then
     Label2.Font.Style := Label2.Font.Style + [fsBold]
   else
     Label2.Font.Style := Label2.Font.Style - [fsBold]
end;

procedure TForm2.ChordFSTIClick(Sender: TObject);
begin
   If ChordFSTI.Down = true then
     Label2.Font.Style := Label2.Font.Style + [fsItalic]
   else
     Label2.Font.Style := Label2.Font.Style - [fsItalic]
end;

procedure TForm2.ChordFSTUClick(Sender: TObject);
begin
   If ChordFSTU.Down = true then
     Label2.Font.Style := Label2.Font.Style + [fsUnderline]
   else
     Label2.Font.Style := Label2.Font.Style - [fsUnderline]
end;

procedure TForm2.OtherFSTBClick(Sender: TObject);
begin
   If OtherFSTB.Down = true then
     Label3.Font.Style := Label3.Font.Style + [fsBold]
   else
     Label3.Font.Style := Label3.Font.Style - [fsBold]
end;

procedure TForm2.OtherFSTIClick(Sender: TObject);
begin
   If OtherFSTI.Down = true then
     Label3.Font.Style := Label3.Font.Style + [fsItalic]
   else
     Label3.Font.Style := Label3.Font.Style - [fsItalic]
end;

procedure TForm2.OtherFSTUClick(Sender: TObject);
begin
   If OtherFSTU.Down = true then
     Label3.Font.Style := Label3.Font.Style + [fsUnderline]
   else
     Label3.Font.Style := Label3.Font.Style - [fsUnderline]
end;

procedure TForm2.OtherFSChange(Sender: TObject);
begin
   Label3.Font.Size := strtoint(OtherFS.Text);
end;

procedure TForm2.ChordFSChange(Sender: TObject);
begin
   Label2.Font.Size := strtoint(ChordFS.Text);
end;

procedure TForm2.TextFSChange(Sender: TObject);
begin
   Label1.Font.Size := strtoint(TextFS.Text);
end;

procedure TForm2.TextCChange(Sender: TObject);
begin
   Label1.Font.Color := TextC.Selected;
end;

procedure TForm2.ChordCChange(Sender: TObject);
begin
   Label2.Font.Color := ChordC.Selected;
end;

procedure TForm2.OtherCChange(Sender: TObject);
begin
   Label3.Font.Color := OtherC.Selected;
end;

procedure TForm2.TextChange(Sender: TObject);
begin
   Label1.Font.Name := Text.Text;
end;

procedure TForm2.ChordChange(Sender: TObject);
begin
   Label2.Font.Name := Chord.Text;
end;

procedure TForm2.OtherChange(Sender: TObject);
begin
   Label3.Font.Name := Other.Text;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  MyIniFile: TIniFile;
  i: integer;
begin
  if MessageDlg('Save Changes?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      MyIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'crdconv.ini');
      MyIniFile.WriteString('Text','TextFN',Text.Text);
      MyIniFile.WriteString('Text','TextFS',TextFS.Text);
      if TextFSTB.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Text','TextFStB',inttostr(i));
      if TextFSTI.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Text','TextFStI',inttostr(i));
      if TextFSTU.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Text','TextFStU',inttostr(i));
      MyIniFile.WriteString('Text','TextFC',Textc.Items.Strings[Textc.Itemindex]);

      MyIniFile.WriteString('Chords','ChordFN',Chord.Text);
      MyIniFile.WriteString('Chords','ChordFS',ChordFS.Text);
      if ChordFSTB.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Chords','ChordFStB',inttostr(i));
      if ChordFSTI.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Chords','ChordFStI',inttostr(i));
      if ChordFSTU.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Chords','ChordFStU',inttostr(i));
      MyIniFile.WriteString('Chords','ChordFC',Chordc.Items.Strings[Chordc.Itemindex]);

      MyIniFile.WriteString('Others','OtherFN',Other.Text);
      MyIniFile.WriteString('Others','OtherFS',OtherFS.Text);
      if OtherFSTB.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Others','OtherFStB',inttostr(i));
      if OtherFSTI.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Others','OtherFStI',inttostr(i));
      if OtherFSTU.Down = true then i:=1 else i:=0;
        MyIniFile.WriteString('Others','OtherFStU',inttostr(i));
      MyIniFile.WriteString('Others','OtherFC',Otherc.Items.Strings[Otherc.Itemindex]);
    end;
end;

end.
