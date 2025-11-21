CREATE DATABASE DATAFORMATION;

USE DATAFORMATION;

CREATE TABLE Stage (
    StageId INT PRIMARY KEY,
    Categorie VARCHAR(100),
    Domaine VARCHAR(100),
    DateCreation DATE,
    DateAnnulation DATE,
    CommentairesPlanification TEXT,
    CommentairesProduction TEXT,
    Duree DECIMAL(4, 1),
    NombreStagiairesMaximum INT
);

CREATE TABLE Societe (
    SocieteId INT PRIMARY KEY,
    Nom VARCHAR(200) NOT NULL,
    NumeroTVA VARCHAR(50),
    TypeRelance VARCHAR(50),
    FacturationAvantInscription BIT, 
    Telephone2 VARCHAR(20),
    Telephone1 VARCHAR(20),
    Remise DECIMAL(5, 2)
);

CREATE TABLE Facture (
    FactureId INT PRIMARY KEY,
    CodeRemise VARCHAR(50),
    Remise DECIMAL(5, 2),
    DateCreation DATE,
    DateFacture DATE,
    Relance BIT, 
    DateRelance DATE,
    PART DECIMAL(10, 2),
    ReferenceCommande VARCHAR(100),
    MontantHT DECIMAL(10, 2),
    MontantTTC DECIMAL(10, 2),
    TauxTVA DECIMAL(5, 2)
);

CREATE TABLE Stagelangue (
    StageId INT,
    LangueCId INT,
    Titre VARCHAR(255),
    SousTitre VARCHAR(255),
    PhraseSynthese TEXT,
    PreRequis TEXT,
    ProfParticipants TEXT,
    Objectifs TEXT,
    PRIMARY KEY (StageId, LangueCId),
    FOREIGN KEY (StageId) REFERENCES Stage(StageId)
);

CREATE TABLE Contact (
    ContactId INT PRIMARY KEY,
    Titre VARCHAR(50),
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL,
    Email VARCHAR(150),
    Telephone VARCHAR(20),
    Telescopie VARCHAR(20),
    Sexe CHAR(1),
    Portable VARCHAR(20),
    AdressePostaleId INT,
    SocieteId INT,
    FOREIGN KEY (SocieteId) REFERENCES Societe(SocieteId)
);

CREATE TABLE Session (
    SessionId INT PRIMARY KEY,
    StageId INT NOT NULL,
    LangueCId INT,
    SalleFormationId INT,
    DateDebut DATE,
    Prix DECIMAL(10, 2),
    Note TEXT,
    Statut VARCHAR(50),
    DateCreation DATETIME,
    Duree DECIMAL(4, 1),
    IntraEntreprise BIT, 
    Remarques TEXT,
    FormateurId INT,
    FOREIGN KEY (StageId) REFERENCES Stage(StageId)
);

CREATE TABLE Inscription (
    InscriptionId INT PRIMARY KEY,
    SessionId INT NOT NULL,
    DecideurInscriptionId INT,
    ContactId INT NOT NULL,
    DateAnnulation DATE,
    Remise DECIMAL(5, 2),
    Present BIT, 
    DateCreation DATETIME,
    ReferenceCommande VARCHAR(100),
    ConventionEnvoyee BIT, 
    ConvocationEnvoyee BIT, 
    ListeAttente BIT, 
    FeuilleEmargement BIT, 
    FOREIGN KEY (SessionId) REFERENCES Session(SessionId),
    FOREIGN KEY (ContactId) REFERENCES Contact(ContactId)
);

CREATE TABLE InscriptionFacture (
    InscriptionId INT,
    FactureId INT,
    PRIMARY KEY (InscriptionId, FactureId),
    FOREIGN KEY (InscriptionId) REFERENCES Inscription(InscriptionId),
    FOREIGN KEY (FactureId) REFERENCES Facture(FactureId)
);
