unit uAplicacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.ListView, FMX.Layouts, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmAplicacao = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    LvLancto: TListView;
    Button1: TButton;
    Layout5: TLayout;
    lblEntradas: TLabel;
    lblValorEntradas: TLabel;
    Layout6: TLayout;
    lblSaidas: TLabel;
    lblValorSaidas: TLabel;
    img_grupo: TImage;
    lbl_saldo: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure LvLanctoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure LvLanctoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure LvLanctoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure Adiciona(pNumLancto, pHistorico, pGrupo: string; pValor: double; pData: TDateTime; pImg: TStream);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAplicacao: TfrmAplicacao;

implementation

{$R *.fmx}

procedure TfrmAplicacao.Button1Click(Sender: TObject);
var mImg: TStream;
    k: integer;
begin
  mImg := TMemoryStream.Create;
  img_grupo.Bitmap.SaveToStream(mImg);
  for k := 1 to 8 do
    Adiciona('123456'+inttostr(k), 'Mercado XYQ01234567890123456789012345678901234567890123456789', 'Alimentacao',100.00, now, mImg);
end;

procedure TfrmAplicacao.LvLanctoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  showmessage(aItem.TagString);
  if AItem.Height > 60 then
     AItem.Height := 60
  else
    AItem.Height := 120;
end;

procedure TfrmAplicacao.LvLanctoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if TListView(Sender).Selected <> nil then
  begin
    if ItemObject is TListItemImage then
    begin
      TListItemImage(ItemObject).Bitmap
    end;
    if ItemObject is TListItemText then
    begin
      lbl_saldo.text := TlistItemText(ItemObject).text;
    end;
  end;
end;

procedure tfrmAplicacao.lvLanctoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var item: TListItemText;
    img:  TListItemImage;

begin
  item := TListItemText(AItem.Objects.FindDrawable('txtHistorico'));
  item.Width := lvLancto.width - (70+item.PlaceOffset.x);
  if item.Width < 200 then
  begin
    img := TListItemImage(AItem.Objects.FindDrawable('imgIcone'));
    img.Visible := false;
    item.PlaceOffset.X := 5;
    item.Width := lvLancto.width - (20+item.PlaceOffset.x);
  end;

end;

procedure tFrmAplicacao.Adiciona(pNumLancto, pHistorico, pGrupo: string;
pValor: double;
pData: TDateTime;
pImg: TStream);
var item: TListitemText;
    img: TListItemImage;
    bmp: TBitmap;

begin

  with LvLancto.Items.Add do
  begin
    tagString := pNumLancto;
    item := TListItemText(Objects.FindDrawable('txtHistorico'));
    item.Text := pHistorico;
    TListItemText(Objects.FindDrawable('txtValor')).text := FormatFloat('#,##9.99',pValor);
    TListItemText(Objects.FindDrawable('txtGrupo')).Text := pGrupo;
    TListItemText(Objects.FindDrawable('txtData')).Text := formatDateTime('dd/mm', pdata);

    img := TListItemImage(Objects.FindDrawable('imgIcone'));
    if pImg <> nil then
    begin
      bmp := TBitmap.Create;
      bmp.LoadFromStream(pImg);
     // img.OwnsBitmap := true;
     // img.Bitmap := bmp;
    end;


  end;

end;

end.
