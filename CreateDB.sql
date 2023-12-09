CREATE DATABASE palestra;
use palestra;

CREATE TABLE Trainer (
	CF CHAR(16) PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    TitoloStudio VARCHAR(50) NOT NULL,
    Stipendio NUMERIC(4) NOT NULL
);

CREATE TABLE Segretario (
	CF CHAR(16) PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    TitoloStudio VARCHAR(50) NOT NULL,
    Stipendio NUMERIC(4) NOT NULL
);

CREATE TABLE Attestato(
	Nome VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Scheda (
	Trainer_CF CHAR(16) NOT NULL REFERENCES Trainer(CF),
    Cliente_CF CHAR(16) NOT NULL REFERENCES Cliente(CF),
    DataInizio DATE,
    DataScadenza DATE NOT NULL,
    NumAllenamenti INT NOT NULL,
    PRIMARY KEY(Trainer_CF, Cliente_CF, DataInizio)
);

CREATE TABLE Cliente (
	CF CHAR(16) PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Provincia VARCHAR(20) NOT NULL,
    Citta VARCHAR(20) NOT NULL,
    Cap INT NOT NULL,
    Via VARCHAR(50) NOT NULL,
    Civico INT NOT NULL
);

CREATE TABLE Abbonamento (
	Cli_CF CHAR(16) NOT NULL REFERENCES Cliente(CF),
    DataInizio DATE,
    DataScadenza DATE NOT NULL,
    Costo Numeric(3) NOT NULL,
    NumClientiAbbonati INT NOT NULL,
    PRIMARY KEY(Cli_CF, DataInizio)
);

CREATE TABLE Evento (
	Nome VARCHAR(40),
    DataEvento DATE,
    Descrizione VARCHAR(50) NOT NULL,
    PRIMARY KEY(Nome, DataEvento)
);

CREATE TABLE Organizzazione (
	Segretario_CF CHAR(16) NOT NULL REFERENCES Segretario(CF),
    Evento_Nome VARCHAR(40) NOT NULL,
    Evento_Data DATE NOT NULL,
    FOREIGN KEY(Evento_Nome, Evento_Data) REFERENCES EVENTO(Nome, DataEvento),
    PRIMARY KEY(Segretario_CF, Evento_Nome, Evento_Data)
);

CREATE TABLE Possedere(
	Attestato_Nome VARCHAR(30) REFERENCES Attestato(Nome),
    T_CF CHAR(16) REFERENCES Trainer(CF),
    PRIMARY KEY(Attestato_Nome, T_CF)
);

CREATE TABLE Partecipazione(
	C_CF CHAR(16) REFERENCES Cliente(CF),
    E_Nome VARCHAR(40),
    E_Data DATE,
    NumPartecipante INT NOT NULL,
    PRIMARY KEY(C_CF, E_Nome, E_Data),
    FOREIGN KEY(E_nome, E_Data) REFERENCES Evento(Nome, DataEvento)
);

