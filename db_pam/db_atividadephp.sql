create database atividadephp;

use atividadephp;

create table estado(
idEstado int auto_increment primary key,
nomeEstado varchar(100),
siglaEstado char(2),
constraint um_estado unique (nomeEstado)
);

create table cidade(
idCidade int auto_increment primary key,
nomeCidade varchar(100),
idEstado int,
constraint fk_estado foreign key (idEstado) REFERENCES estado (idEstado),
constraint uma_cidade unique (nomeCidade)
);

create table bairro(
idBairro int auto_increment primary key,
nomeBairro varchar(100),
idCidade int,
constraint fk_cidade foreign key (idCidade) references cidade (idCidade),
constraint um_bairro unique (nomeBairro)
);

create table cliente(
idCliente int auto_increment primary key,
nomeCli varchar(100),
dataNascCli date,
cpfCli varchar(13),
rgCli varchar(11),
logradouroCli varchar(100),
rendaCli decimal(10,2),
emailCli varchar(100),
generoCli char(2),
idBairro int,
constraint fk_bairro_cli foreign key (idBairro) references bairro (idBairro),
constraint um_rg unique (rgCli),
constraint um_cpf unique (cpfCli),
constraint CH_cli1 check (generoCli IN ("F", "M")),
constraint CH_cli2 check (rendaCli>=0)
);

create table funcionario(
idFuncionario int auto_increment primary key,
nomeFunc varchar(100),
dataNascFunc date,
cpfFunc varchar(13),
rgFunc varchar(11),
logradouroFunc varchar(100),
salarioFunc decimal(10,2),
emailFunc varchar(100),
generoFunc char(2),
dependenteFunc varchar(100),
idBairro int,
constraint fk_bairro_func foreign key (idBairro) references bairro (idBairro),
constraint um_rg1 unique (rgFunc),
constraint um_cpf1 unique (cpfFunc),
constraint ch_func check (generoFunc IN ('F', 'M')),
constraint ch_func1 check (salarioFunc>=0)
);

create table checklist(
idChecklist int auto_increment primary key,
dataCheck date,
statusCheck varchar(30)
);

create table Reserva(
idReserva int auto_increment primary key,
dataReserva date,
valorReserva decimal(10,2),
idCliente int,
idChecklist int,
idFuncionario int,
constraint fk_idCliente foreign key (idCliente) references Cliente (idCliente),
constraint fk_idChecklist foreign key (idChecklist) references Checklist (idChecklist),
constraint fk_idFuncionario foreign key (idFuncionario) references Funcionario (idFuncionario),
constraint ch_valreserva check (valorReserva>=0)
);

create table Veiculo(
idVeiculo int auto_increment primary key,
modeloVeiculo varchar(60),
corVeiculo varchar(20),
tipoVeiculo varchar(60),
anoVeiculo char(6),
placaVeiculo varchar(10),
idCliente int,
idReserva int,
idChecklist int,
constraint fk_idCliente1 foreign key (idCliente) references Cliente (idCliente),
constraint fk_idReserva foreign key (idReserva) references Reserva (idReserva),
constraint fk_idChecklist1 foreign key (idChecklist) references Checklist (idChecklist),
constraint uma_placa unique (placaVeiculo)
);

create table Prestadora_Serv(
idPrestadora_Serv int auto_increment primary key,
tipoServ varchar(100),
dataServ date,
idVeiculo int,
constraint fk_idVeiculo foreign key (idVeiculo) references Veiculo (idVeiculo)
);