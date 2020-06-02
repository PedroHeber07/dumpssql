
drop database modulo;

create database modulo;

create table tbclientes(
idcliente int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
bairrocli varchar(50),
cidadecli varchar(50),
ufcli varchar(2),
cepcli varchar(10),
cpfcli varchar(11),
rgcli varchar (10),
fonecli varchar(50) not null, 
emailcli varchar(50)
);

create table tbproduto(
produtoid int primary key auto_increment,
descricao_pro varchar(100) unique not null,
preco_custo decimal(10,2) not null,
uni_estoque int not null,
idcat int not null,
idfabric int not null,
foreign key(idcat) references tbcategoria(categoriaid),
foreign key(idfabric) references tbfabricante(fabricanteid)
);

create table tbfabricante(
fabricanteid int primary key auto_increment,
nome_fab varchar(50) not null,
cnpj_fab varchar(50) not null,
end_fab varchar(100),
bairro_fab varchar(50),
cidade_fab varchar(50),
uf_fab varchar(2),
cep_fab varchar(10)not null,
fone_fab varchar(50),
email_fab varchar(50)
);

create table tbcategoria(
categoriaid int primary key,
nome_categoria varchar(30) not null
);

-- tabela do funcionário 
create table tbcolaborador(
id_func int primary key auto_increment,
nome_func varchar(50) not null,
fone_func varchar(20) not null,
func_nasc date not null,
func_end varchar(100),
func_bairro varchar(50),
func_cidade varchar(50),
func_uf varchar(2),
func_cep varchar(10),
func_cpf varchar(11),
func_rg varchar (10)
);

create table tbfornecedor(
fornecedorid int primary key auto_increment,
nomeforn varchar(50),
cnpjforn varchar(50),
endforn varchar(100),
bairroforn varchar(50),
cidadeforn varchar(50),
ufforn varchar(2),
cepforn varchar(10),
foneforn varchar(50),
emailforn varchar(50)
);

-- tabelas relativa a vendas e seu relacionamento


create table tbvenda(
vendaid int primary key auto_increment,
data_venda timestamp default current_timestamp,
idcli int not null,
idcolab int not null,
foreign key(idcli) references tbclientes(idcliente),
foreign key(idcolab) references tbcolaborador(id_func)
);

create table tbitensvenda(
cod_iv int primary key auto_increment,
quant_produto_venda int,
preco_venda decimal(10,2) not null,
id_produto_venda int not null,
id_venda int not null,
foreign key(id_produto_venda) references tbproduto(produtoid),
foreign key(id_venda) references tbvenda(vendaid)
);

create table tbcompras(
compraid int primary key auto_increment,
data_compra timestamp default current_timestamp,
id_colab_compra int not null,
id_forn int not null,
foreign key (id_colab_compra) references tbcolaborador(id_func),
foreign key (id_forn) references tbfornecedor(fornecedorid)
);


create table tbitenscompra(
cod_ic int primary key auto_increment,
quant_produto_compra int,
preco_compra decimal(10,2) not null,
id_produto_compra int not null,
id_compra int not null,
foreign key(id_produto_compra) references tbproduto(produtoid),
foreign key(id_compra) references tbcompras(compraid)
);



