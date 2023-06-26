﻿unit Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    editCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    codigoProduto: integer;
    codigoFornecedor: integer;
    codigoCliente: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses database;

procedure TForm1.Image1Click(Sender: TObject);
begin

  moduloDB.firebirdProdutos.first;

  while not moduloDB.firebirdProdutos.Eof do

  begin
    moduloDB.mysqlProdutos.Append;
    codigoProduto := codigoProduto + 1;
    editCodigo.text := IntToStr(codigoProduto);

    moduloDB.mysqlProdutos.FieldByName('codigo').Value :=
      FormatFloat('000000', (codigoProduto));

    moduloDB.mysqlProdutos.FieldByName('descr').Value :=
      moduloDB.firebirdProdutos.FieldByName('produto').Value;

    moduloDB.mysqlProdutos.FieldByName('descr_red').Value :=
      moduloDB.firebirdProdutos.FieldByName('DESCRICAO_COMPRA').Value;

    moduloDB.mysqlProdutos.FieldByName('referencia').Value :=
      moduloDB.firebirdProdutos.FieldByName('referencia').Value;

    moduloDB.mysqlProdutos.FieldByName('estfil01').Value :=
     moduloDB.firebirdProdutos.FieldByName('estoque').Value;

    moduloDB.mysqlProdutos.FieldByName('precovendai').Value :=
      moduloDB.firebirdProdutos.FieldByName('valor_venda').Value;

    moduloDB.mysqlProdutos.FieldByName('custo').Value :=
      moduloDB.firebirdProdutos.FieldByName('custo').Value;

    moduloDB.mysqlProdutos.FieldByName('Aquisicao').Value :=
      moduloDB.firebirdProdutos.FieldByName('valor_compra').Value;

    moduloDB.mysqlProdutos.FieldByName('cod_barra').Value :=
      moduloDB.firebirdProdutos.FieldByName('barras').Value;

    moduloDB.mysqlProdutos.FieldByName('codigoncm').Value :=
      moduloDB.firebirdProdutos.FieldByName('ncm').Value;

    moduloDB.mysqlProdutos.FieldByName('codigo_cest').Value :=
      moduloDB.firebirdProdutos.FieldByName('cest').Value;

    if moduloDB.firebirdProdutos.FieldByName('icms').asString = '18,00' then
    begin
      moduloDB.mysqlProdutos.FieldByName('cod_aliq').Value := 01
    end
    else
    begin
      moduloDB.mysqlProdutos.FieldByName('cod_aliq').Value := 'FF'
    end;

    moduloDB.mysqlProdutos.FieldByName('cst').Value :=
      moduloDB.firebirdProdutos.FieldByName('csosn').Value;

    moduloDB.mysqlProdutos.FieldByName('cstpiscofinsentrada').Value :=
      moduloDB.firebirdProdutos.FieldByName('cst_piscofins_entrada').Value;

    if moduloDB.firebirdProdutos.FieldByName('cst_piscofins_saida').asInteger = 1
    then
    begin
      moduloDB.mysqlProdutos.FieldByName('cstpiscofins').Value := '01'
    end
    else
    begin
      moduloDB.mysqlProdutos.FieldByName('cstpiscofins').Value := '04'
    end;
    moduloDB.mysqlProdutos.FieldByName('unidade').Value :=
      moduloDB.firebirdProdutos.FieldByName('unidade_comecial').Value;

    moduloDB.mysqlProdutos.FieldByName('Aquisicao').Value :=
      moduloDB.firebirdProdutos.FieldByName('valor_compra').Value;

    moduloDB.mysqlProdutos.Post;
    moduloDB.firebirdProdutos.Next
  end;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  moduloDB.firebirdFornecedores.first;

  while not moduloDB.firebirdFornecedores.Eof do

  begin
    moduloDB.mysqlFornecedores.Append;

    codigoFornecedor := codigoFornecedor + 1;

    editCodigo.text := IntToStr(codigoFornecedor);

    moduloDB.mysqlFornecedores.FieldByName('codigo').Value :=
      FormatFloat('00000', (codigoFornecedor));

    moduloDB.mysqlFornecedores.FieldByName('NomeFantasia').Value :=
      moduloDB.firebirdFornecedores.FieldByName('fantasia').Value;

    moduloDB.mysqlFornecedores.FieldByName('RazaoSocial').Value :=
      moduloDB.firebirdFornecedores.FieldByName('raz_social').Value;

    moduloDB.mysqlFornecedores.FieldByName('cod_mun').Value :=
      moduloDB.firebirdFornecedores.FieldByName('codigo_municipio').Value;

    moduloDB.mysqlFornecedores.FieldByName('cep').Value :=
      moduloDB.firebirdFornecedores.FieldByName('cep').Value;

    moduloDB.mysqlFornecedores.FieldByName('cgccpf').Value :=
      moduloDB.firebirdFornecedores.FieldByName('cnpj').Value;

    moduloDB.mysqlFornecedores.FieldByName('rg_ie').Value :=
      moduloDB.firebirdFornecedores.FieldByName('ie').Value;

    moduloDB.mysqlFornecedores.FieldByName('endereco').Value :=
      moduloDB.firebirdFornecedores.FieldByName('endereco').Value;

    moduloDB.mysqlFornecedores.FieldByName('bairro').Value :=
      moduloDB.firebirdFornecedores.FieldByName('bairro').Value;

    moduloDB.mysqlFornecedores.FieldByName('numero').Value :=
      moduloDB.firebirdFornecedores.FieldByName('numero').Value;

    moduloDB.mysqlFornecedores.FieldByName('cidade').Value :=
      moduloDB.firebirdFornecedores.FieldByName('municipio').Value;

    moduloDB.mysqlFornecedores.Post;
    moduloDB.firebirdFornecedores.Next
  end;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  moduloDB.firebirdClientes.first;

  while not moduloDB.firebirdClientes.Eof do

  begin
    moduloDB.mysqlClientes.Append;

    codigoCliente := codigoCliente + 1;

    editCodigo.text := IntToStr(codigoCliente);

    moduloDB.mysqlClientes.FieldByName('codigo').Value :=
      FormatFloat('00000', (codigoCliente));

    moduloDB.mysqlClientes.FieldByName('nome').Value :=
      moduloDB.firebirdClientes.FieldByName('raz_social').Value;
    if moduloDB.firebirdClientes.FieldByName('CPF_CNPJ').asString > '99999999999'
    then
      moduloDB.mysqlClientes.FieldByName('tipojf').Value := 'J'
    else
      moduloDB.mysqlClientes.FieldByName('tipojf').Value := 'F';

    moduloDB.mysqlClientes.FieldByName('endereco').Value :=
      moduloDB.firebirdClientes.FieldByName('logradouro').Value;

    moduloDB.mysqlClientes.FieldByName('numero').Value :=
      moduloDB.firebirdClientes.FieldByName('numero').Value;

    moduloDB.mysqlClientes.FieldByName('cep').Value :=
      moduloDB.firebirdClientes.FieldByName('cep').Value;

    moduloDB.mysqlClientes.FieldByName('uf').Value :=
      moduloDB.firebirdClientes.FieldByName('uf').Value;

    moduloDB.mysqlClientes.FieldByName('cgccpf').Value :=
      moduloDB.firebirdClientes.FieldByName('CPF_CNPJ').Value;

    moduloDB.mysqlClientes.FieldByName('bairro').Value :=
      moduloDB.firebirdClientes.FieldByName('bairro').Value;

    moduloDB.mysqlClientes.FieldByName('cep').Value :=
      moduloDB.firebirdClientes.FieldByName('cep').Value;

    moduloDB.mysqlClientes.FieldByName('cidade').Value :=
      moduloDB.firebirdClientes.FieldByName('municipio').Value;

    moduloDB.mysqlClientes.FieldByName('cod_mun').Value :=
      moduloDB.firebirdClientes.FieldByName('codigo_municipio').Value;

    moduloDB.mysqlClientes.FieldByName('rg_ie').Value :=
      moduloDB.firebirdClientes.FieldByName('ie_rg').Value;

    moduloDB.mysqlClientes.FieldByName('celular').Value :=
      moduloDB.firebirdClientes.FieldByName('celular').Value;

    moduloDB.mysqlClientes.FieldByName('cod_mun').Value :=
      moduloDB.firebirdClientes.FieldByName('codigo_municipio').Value;

    moduloDB.mysqlClientes.Post;
    moduloDB.firebirdClientes.Next
  end;
end;

end.
