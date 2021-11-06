unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RootUnit,
  Data.DB, REST.Response.Adapter, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, superobject;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    MemoJson: TMemo;
    MemoResultado: TMemo;
    DBGrid1: TDBGrid;
    Button4: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.JSON,
  REST.Json, REST.JsonReflect;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  objeto : TJSONObject;
  ObjetoArray: TJSONArray;
  ObjetoInputs: TJSONObject;
  I: Integer;
begin
  //Leitura
  objeto := TJsonObject.ParseJSONValue(MemoJson.Lines.Text) as TJSONObject;

  ShowMessage(objeto.Get('block_hash').ToString);
  ShowMessage(objeto.GetValue('block_hash').Value);

  ObjetoArray := objeto.Get('inputs').JsonValue as TJSONArray;

  for I := 0 to ObjetoArray.Size - 1 do
  begin
    MemoResultado.Lines.Add(
      ObjetoArray.Get(i).ToString + ': '
      + ObjetoArray.Get(i).Value);
  end;

  //Escrita
  objeto := TJSONObject.Create;
  ObjetoArray := TJSONArray.Create;

  objeto.AddPair('block_hash','123456789');
  Objeto.AddPair('Inputs',ObjetoArray);

  ObjetoInputs := TJSONObject.Create;
  ObjetoInputs.AddPair('prev_hash','987654321');
  ObjetoInputs.AddPair('script','1');

  ObjetoArray.Add(ObjetoInputs);
  MemoResultado.Lines.Text := objeto.ToString;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Objeto: ISuperObject;
  Inputs: ISuperObject;
begin
{  Objeto := SO(MemoJson.Lines.Text);
  ShowMessage(Objeto.S['block_hash']);
  ShowMessage(Objeto['block_hash'].AsString);

  for Inputs in objeto['inputs'] do
  begin
    MemoResultado.Lines.Add(Inputs.AsString);
  end;
}

  Objeto := SO;
  Objeto.S['block_hash'] := '123456789';
  Objeto.O['inputs'] := SA([]);

  Inputs := SO;
  Inputs.S['script'] := 'Teste script 1';
  Inputs.I['age'] := 30;
  Objeto.A['inputs'].O[0] := Inputs;

  Inputs := SO;
  Inputs.S['script'] := 'Teste script 2';
  Inputs.I['age'] := 60;

  Objeto.A['inputs'].O[1] := Inputs;

  MemoResultado.Lines.Text := Objeto.AsString;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  TesteJson: TRoot;
  Inputs: TInputs;
  I: Integer;
begin
  TesteJson := TJson.JsonToObject<TRoot>(MemoJson.Lines.Text);

  ShowMessage('BlockHash - '+TesteJson.BlockHash);

  for Inputs in TesteJson.Inputs do
  begin
    Showmessage('ScripType - '+Inputs.ScriptType);
  end;

  TesteJson := TRoot.Create;
  TesteJson.BlockHash := 'www.aquasoft.com.br';

  for I := 0 to 2 do
  begin
    Inputs := TInputs.Create;
    Inputs.Age := 20;
    Inputs.Script := 'teste script';

    TesteJson.Inputs.Add(Inputs);
  end;

  MemoResultado.Lines.Text :=
    TJson.ObjectToJsonString(TesteJson,[joIgnoreEmptyStrings]);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  lMarshal : TJSONMarshal;
  TesteJson: TRoot;
  Inputs: TInputs;
  I: Integer;
begin
  TesteJson := TRoot.Create;
  TesteJson.BlockHash := 'www.aquasoft.com.br';

  for I := 0 to 2 do
  begin
    Inputs := TInputs.Create;
    Inputs.Age := 20;
    Inputs.Script := 'teste script';

    TesteJson.Inputs.Add(Inputs);
  end;

  lMarshal := TJSONMarshal.Create (TJSONConverter.Create);
  MemoResultado.Lines.Text := lMarshal.Marshal(TesteJson).ToString();

  lMarshal.Free;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  RESTRequest1.Execute;
  RESTResponseDataSetAdapter1.Active := True;
end;

end.
