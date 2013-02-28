unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Data.Win.ADODB;

type
  TfrmPrincipal = class(TForm)
    btnAbrir: TButton;
    dbgrd1: TDBGrid;
    btnFechar: TButton;
    qryDBF: TADOQuery;
    dsDBF: TDataSource;
    Edit1: TEdit;
    lbl1: TLabel;
    conDBF: TADOConnection;
    lblNumRegistros: TLabel;
    lblNumReg: TLabel;
    procedure btnAbrirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function LongFileName (ShortName: string): string;
var
   SR: TSearchRec;
begin
   Result := '';
   if (pos ('\\', ShortName) + pos ('*', ShortName) + pos ('?', ShortName) <> 0) or not FileExists (ShortName) then
      { ignore NetBIOS name, joker chars and invalid file names }
      Exit;
   while FindFirst (ShortName, faAnyFile, SR) = 0 do
   begin
      { next part as prefix }
      Result := '\' + SR.Name + Result;
      FindClose (SR);  { the SysUtils, not the WinProcs procedure! }
      { directory up (cut before '\') }
      ShortName := ExtractFileDir (ShortName);
      if length (ShortName) <= 2 then
         Break;  { ShortName contains drive letter followed by ':' }
   end;

   Result := ExtractFileDrive (ShortName) + Result;
end;

function ShortFileName (const FileName: string): string;
var
   aTmp: array[0..255] of char;
begin
   if not FileExists (FileName) then
      Result := ''
   else
      if GetShortPathName (PChar (FileName), aTmp, Sizeof (aTmp) - 1) = 0 then
         Result:= FileName
      else
         Result:= StrPas (aTmp);
end;

procedure TfrmPrincipal.btnAbrirClick(Sender: TObject);
var
   dbf_folder  : AnsiString;
//   dbf_file    : AnsiString;
   opdAbrir    : TOpenDialog;
   intLinhas   : Integer;
begin
   try
      opdAbrir := TOpenDialog.Create(Self);
      if opdAbrir.Execute then
      begin
         try
            conDBF.Connected := False;
            dbf_folder := ExtractFilePath(opdAbrir.FileName);
            conDBF.LoginPrompt := False;
            conDBF.ConnectionString :=
               // Sistemas tanto em 32 como 64 bits - Usando driver MSDASQL
               Format(Edit1.Text, [ dbf_folder ]);
//             Format('Provider=MSDASQL.1;Persist Security Info=False;Data Source=dBASE Files;Initial Catalog=%s', [ dbf_folder ]);
            conDBF.Connected := True;

            qryDBF.Close;
            qryDBF.SQL.Clear;
            // Com ADO somente funcionou com nomes de arquivos no formato DOS 8.3
            qryDBF.SQL.Text := 'select * from "'+  ExtractFileName(ShortFileName(opdAbrir.FileName))+ '"';

//          Tentando nesta maneira e varias outras nao consegui abrir arquivos com formato de nome de arquivo do Windows
//            dbf_file := StringReplace((ShortFileName(opdAbrir.FileName)), '\', '//', [rfReplaceAll]);
//            qryDBF.SQL.Text := 'select * from "'+ dbf_file + '"'; //make your SQL query using the name of the dbf file

            qryDBF.Open;
            qryDBF.DisableControls;
            intLinhas := 0;
            while not qryDBF.eof do
            begin
               inc(intLinhas);
               qryDBF.Next;
            end;
         finally
            qryDBF.EnableControls;
            lblNumReg.Caption := IntToStr(intLinhas);
         end;
      end;
   except
      on E : Exception do
         ShowMessage(E.Message);
   end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
   qryDBF.Close;
   conDBF.Connected := False;
   lblNumReg.Caption := '0';
end;

end.
