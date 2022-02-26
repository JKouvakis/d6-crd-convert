unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ExtCtrls, OleCtrls, SHDocVw,
  StrUtils, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Unit2;

type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    RTF1: TMenuItem;
    N1: TMenuItem;
    Exit: TMenuItem;
    Options: TMenuItem;
    Language: TMenuItem;
    Default1: TMenuItem;
    N2: TMenuItem;
    Settings: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAboutItem: TMenuItem;
    ToolbarImages: TImageList;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    Song: TRichEdit;
    OpenDialog1: TOpenDialog;
    Informations: TRichEdit;
    IdHTTP1: TIdHTTP;
    OpenWebPage1: TMenuItem;
    procedure FileOpenItemClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure OpenWebPage1Click(Sender: TObject);
    procedure HelpAboutItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  infoor,infomod : array[1..10,1..2] of string;
  songor,songmod,songmod2 : array[1..50,1..2] of string;
  chordor,chordmod : array[1..12] of string;
  chords : array of string;
  positions, postxt : array of integer;
  txtneed : boolean;
  Lines: integer;
implementation

{$R *.dfm}

function fixtext(s:string):string;
var
  i,j: integer;
  temp,temp2: string;
begin
  j:=0;
  temp:='';
  for i:=1 to length(s) do
    begin
      temp:=midstr(s,i,1);
      if i=postxt[j] then
        begin
          If (temp<>' ') and (temp<>#160) then
            temp2:=temp2+'-';
          temp2:=temp2+temp;
          j:=j+1;
        end
      else
        temp2:=temp2+temp;
    end;
  Result:=temp2;
end;

function splitcrd(s: string):string;
var
  i,j,m: integer;
  chr,temp: string;
begin
  j:=0;
  SetLength(chords,j);
  SetLength(positions,j);
  for i:=1 to length(s) do
    begin
      chr := midstr(s,i,1);
      if (chr<>'A') and (chr<>'B') and (chr<>'C') and (chr<>'D') and (chr<>'E') and (chr<>'F') and (chr<>'G') then
        begin
          if j=0 then
            begin
              j:=j+1;
              SetLength(chords,j);
              SetLength(positions,j);
              positions[j-1] :=i;
            end
          else
            chords[j-1] := chords[j-1] + chr;
        end
      else
        begin
          SetLength(chords,j+1);
          SetLength(positions,j+1);
          chords[j] := chr;
          positions[j] := i;
          j:=j+1;
        end
    end;
//  replace(chords);
  for i:=0 to length(chords)-1 do
    begin
      If pos('C#',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'C#',chordmod[2])
      else If pos('C',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'C',chordmod[1])
      else If pos('D#',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'D#',chordmod[4])
      else If pos('D',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'D',chordmod[3])
      else If pos('E',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'E',chordmod[5])
      else If pos('F#',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'F#',chordmod[7])
      else If pos('F',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'F',chordmod[6])
      else If pos('G#',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'G#',chordmod[9])
      else If pos('G',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'G',chordmod[8])
      else If pos('A#',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'A#',chordmod[11])
      else If pos('A',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'A',chordmod[10])
      else If pos('B',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chords[i],'B',chordmod[12]);
    end;
  for i:=0 to length(chords)-1 do
    if pos(#160,chords[i])<>0 then
      chords[i]:=leftstr(chords[i],pos(#160,chords[i])-1);
  j:=0;
  m:=0;
  txtneed:=false;
  i:=1;
  while i<=length(s) do
    begin
      if i=positions[j] then
        begin
          temp:=temp+chords[j];
          If i+length(chords[j]) = positions[j+1]+1 then
            begin
              txtneed:=true;
              SetLength(postxt,m+1);
              postxt[m]:=positions[j+1];
              m:=m+1;
              i:=i-1;
            end;
          i:=i+length(chords[j])-1;
          j:=j+1;
          i:=i+1;
        end
      else
        begin
          temp:=temp+#160;
          i:=i+1;
        end;
    end;
  Result:=temp;
end;

function cleartags(s: string):string;
var
  new : string;
begin
  new:=S;
  repeat
    if pos('<',new)=1 then
      new := Midstr(new,pos('>',new)+1,length(new));
    If pos('<',new)>1 then
      new := Leftstr(new,pos('<',new)-1) + midstr(new,pos('>',new)+1,length(new));
  until pos('<',new)=0;
  Result:=new;
end;


procedure showinfo(Sender: TObject);
var
  i: integer;
  cleared: string;
begin
  for i:=1 to 10 do
    begin
      cleared := cleartags(infoor[i,1]);
      infomod[i,1] := cleared;
      infomod[i,2] := infoor[i,2];
      If cleared <> '' then
        begin
          if infomod[i,2] = 'ti' then
            begin
              Form1.Informations.SelAttributes.Color := clBlack;
              Form1.Informations.SelAttributes.Size := 12;
              Form1.Informations.SelAttributes.Style := [fsbold];
              Form1.Caption := 'Chords Convertor (' + cleared +')';
            end;
        Form1.Informations.Lines.Add(cleared);
      end;
    end;
end;

procedure showsong(Sender: TObject);
var
  i: integer;
  cleared: string;
begin
  for i:=1 to 50 do
    begin
      cleared := cleartags(songor[i,1]);
      songmod[i,1] := cleared;
      songmod[i,2] := songor[i,2];
      If cleared <> '' then
        begin
          if songmod[i,2] = 'ch' then
            begin
              Form1.Song.SelAttributes.Color := clRed;
              Form1.Song.SelAttributes.Size := 10;
              Form1.Song.SelAttributes.Style := [fsbold];
            end
          else if songmod[i,2] = 'te' then
            begin
              Form1.Song.SelAttributes.Color := clBlack;
              Form1.Song.SelAttributes.Size := 10;
              Form1.Song.SelAttributes.Style := [fsbold];
            end
          else if songmod[i,2] = 'no' then
            begin
              Form1.Song.SelAttributes.Color := clBlack;
              Form1.Song.SelAttributes.Size := 8;
              Form1.Song.SelAttributes.Style := [fsItalic];
            end;
          Form1.Song.Lines.Add(cleared);
        end;
    end;
  Form1.Song.SelStart:=0;
end;

procedure showsong2(Sender: TObject);
var
  i: integer;
  cleared: string;
begin
  Form1.Song.Clear;
  for i:=1 to Lines do
    begin
      if songmod2[i,2] = 'ch' then
        begin
          Form1.Song.SelAttributes.Color := clRed;
          Form1.Song.SelAttributes.Size := 10;
          Form1.Song.SelAttributes.Style := [fsbold];
        end
      else if songmod2[i,2] = 'te' then
        begin
          Form1.Song.SelAttributes.Color := clBlack;
          Form1.Song.SelAttributes.Size := 10;
          Form1.Song.SelAttributes.Style := [fsbold];
        end
      else if songmod2[i,2] = 'no' then
        begin
          Form1.Song.SelAttributes.Color := clBlack;
          Form1.Song.SelAttributes.Size := 8;
          Form1.Song.SelAttributes.Style := [fsItalic];
        end;
      Form1.Song.Lines.Add(songmod2[i,1]);
    end;
  Form1.Song.SelStart:=0;
  Form1.Song.SetFocus;
end;

procedure TForm1.FileOpenItemClick(Sender: TObject);
var
  F: TextFile;
  S: string;
  infi, texti: integer;
begin
  infi := 1;
  texti := 1;
  if OpenDialog1.Execute then            { Display Open dialog box }
  begin
    Informations.Clear;
    Song.Clear;
    AssignFile(F, OpenDialog1.FileName); { File selected in dialog }
    Reset(F);
    repeat
    ReadLn(F,S);
    if (PoS('class=ti',S)<>0) or (Pos('class="ti"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='ti';
        infi := infi +1;
      end;
    if (PoS('class=ar',S)<>0) or (Pos('class="ar"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='ar';
        infi := infi +1;
      end;
    if (PoS('class=se',S)<>0) or (Pos('class="se"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='se';
        infi := infi +1;
      end;
    if (PoS('class=mo',S)<>0) or (Pos('class="mo"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='mo';
        infi := infi +1;
      end;
    if (PoS('class=no',S)<>0) or (Pos('class="no"',S)<>0) then
      begin
        songor[texti,1]:=S;
        songor[texti,2]:='no';
        texti := texti +1;
      end;
    if (PoS('class=ch',S)<>0) or (Pos('class="ch"',S)<>0) then
      begin
        songor[texti,1]:=S;
        songor[texti,2]:='ch';
        texti := texti +1;
      end;
    if (PoS('class=te',S)<>0) or (Pos('class="te"',S)<>0) then
      begin
        songor[texti,1]:=S;
        songor[texti,2]:='te';
        texti := texti +1;
      end;
    until EOF(F);
    CloseFile(F);
  end;
  showinfo(Form1);
  showsong(Form1);
  song.SetFocus;
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  chordor[1]:='C';
  chordor[2]:='C#';
  chordor[3]:='D';
  chordor[4]:='D#';
  chordor[5]:='E';
  chordor[6]:='F';
  chordor[7]:='F#';
  chordor[8]:='G';
  chordor[9]:='G#';
  chordor[10]:='A';
  chordor[11]:='A#';
  chordor[12]:='B';
  Combobox1.ItemIndex := 5;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  i: integer;
  crdtemp: string;
begin
  for i:=1 to 12 do
    begin
      if (i+strtoint(Combobox1.Text)>12) then
        chordmod[i]:=chordor[strtoint(Combobox1.Text)+i-12]
      else if (i+strtoint(Combobox1.Text)<1) then
        chordmod[i]:=chordor[strtoint(Combobox1.Text)+i+12]
      else
        chordmod[i]:=chordor[strtoint(Combobox1.Text)+i]
    end;
  for i:=1 to Song.Lines.Count do
    if songmod[i,2]= 'ch' then
      begin
        songmod2[i,1]:=splitcrd(songmod[i,1]);
        songmod2[i,2]:=songmod[i,2];
      end
    else if songmod[i,2] = 'te' then
      begin
        If txtneed=true then
          begin
            songmod2[i,1]:=fixtext(songmod[i,1]);
            songmod2[i,2]:=songmod[i,2];
            txtneed:=false;
          end
        else
          begin
            songmod2[i,1]:=songmod[i,1];
            songmod2[i,2]:=songmod[i,2];
          end;
      end
    else
      begin
        songmod2[i,1]:=songmod[i,1];
        songmod2[i,2]:=songmod[i,2];
      end;
  Lines := Form1.Song.Lines.Count;
  showsong2(Form1);
//  showsong(Form1);
end;

procedure TForm1.OpenWebPage1Click(Sender: TObject);
var
  F: TextFile;
  S: string;
  infi, texti: integer;
begin
  infi := 1;
  texti := 1;
  begin
    Informations.Clear;
    Song.Clear;
//    IdHTTP.TIdHTTP; { File selected in dialog }
    Reset(F);
    repeat
    ReadLn(F,S);
    if (PoS('class=ti',S)<>0) or (Pos('class="ti"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='ti';
        infi := infi +1;
      end;
    if (PoS('class=ar',S)<>0) or (Pos('class="ar"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='ar';
        infi := infi +1;
      end;
    if (PoS('class=se',S)<>0) or (Pos('class="se"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='se';
        infi := infi +1;
      end;
    if (PoS('class=mo',S)<>0) or (Pos('class="mo"',S)<>0) then
      begin
        infoor[infi,1]:=S;
        infoor[infi,2]:='mo';
        infi := infi +1;
      end;
    if (PoS('class=no',S)<>0) or (Pos('class="no"',S)<>0) then
      begin
        songor[texti,1]:=S;
        songor[texti,2]:='no';
        texti := texti +1;
      end;
    if (PoS('class=ch',S)<>0) or (Pos('class="ch"',S)<>0) then
      begin
        songor[texti,1]:=S;
        songor[texti,2]:='ch';
        texti := texti +1;
      end;
    if (PoS('class=te',S)<>0) or (Pos('class="te"',S)<>0) then
      begin
        songor[texti,1]:=S;
        songor[texti,2]:='te';
        texti := texti +1;
      end;
    until EOF(F);
    CloseFile(F);
  end;
  showinfo(Form1);
  showsong(Form1);
  song.SetFocus;
end;

procedure TForm1.HelpAboutItemClick(Sender: TObject);
begin
  AboutBox.Show;
end;

end.
