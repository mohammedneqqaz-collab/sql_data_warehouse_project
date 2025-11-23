CREATE TABLE [Stage].[Stage] (
    StageId INT IDENTITY(1,1) NOT NULL,
    Categorie CHAR(2) NOT NULL,
    Domaine CHAR(2) NOT NULL,
    DateCreation SMALLDATETIME NOT NULL,
    DateAnnulation DATE NULL,
    CommentairesPlanification VARCHAR(2000) NULL,
    CommentairesProduction VARCHAR(2000) NULL,
    Duree TINYINT NOT NULL,
    NombreStagiairesMaximum TINYINT NOT NULL,
    CONSTRAINT pk_Stage PRIMARY KEY (StageId)
);

CREATE TABLE [Contact].[Societe] (
    
    SocieteId INT IDENTITY(1,1) NOT NULL,
    Nom VARCHAR(60) NOT NULL,
    NumeroTVA VARCHAR(30) NULL,
    TypeRelance SMALLINT NOT NULL,
    FacturationAvantInscription BIT NOT NULL, 
    Telephone2 VARCHAR(30) NULL,
    Telephone1 VARCHAR(30) NULL,
    Remise TINYINT NOT NULL, 
    
    CONSTRAINT pk_Societe PRIMARY KEY (SocieteId),
    CONSTRAINT uq_Societe_Nom UNIQUE (Nom)
);

CREATE TABLE [Inscription].[Facture] (
    
    FactureCd VARCHAR(50) NOT NULL, 
    CodeRemise CHAR(2) NULL,
    Remise DECIMAL(10, 7) NULL,         
    DateCreation SMALLDATETIME NOT NULL,
    DateFacture DATE NULL,
    Relance TINYINT NOT NULL,           
    DateRelance DATE NULL,
    PART DECIMAL(7, 4) NULL,
    ReferenceCommande VARCHAR(100) NULL,
    MontantHT DECIMAL(7, 2) NOT NULL,
    MontantTTC DECIMAL(7, 2) NOT NULL,
    TauxTVA DECIMAL(5, 2) NOT NULL,
    
    CONSTRAINT pk_Facture PRIMARY KEY (FactureCd) 
);

CREATE TABLE [Stage].[Langue] (
    
    LangueCd CHAR(2) NOT NULL, 
    NomLocal VARCHAR(50) NOT NULL,
    NomFrancais VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_Langue PRIMARY KEY (LangueCd), 
    CONSTRAINT uq_Langue_NomFrancais UNIQUE (NomFrancais),
    CONSTRAINT uq_Langue_NomLocal UNIQUE (NomLocal)
);

CREATE TABLE [Contact].[Contact] (
    
    ContactId INT IDENTITY(1,1) NOT NULL, 
    Titre VARCHAR(3) NULL,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NULL,
    Email VARCHAR(150) NULL,
    Telephone VARCHAR(15) NULL,
    Telecopie VARCHAR(15) NULL,
    Sexe VARCHAR(1) NULL,
    Portable VARCHAR(15) NULL,
    AdressePostaleId INT NOT NULL, 
    SocieteId INT NULL,             
   
    CONSTRAINT pk_Contact PRIMARY KEY (ContactId),
    CONSTRAINT fk_Contact_Societe 
        FOREIGN KEY (SocieteId) 
        REFERENCES [Contact].[Societe](SocieteId)
);

CREATE TABLE [Stage].[Session] (    
    SessionId INT IDENTITY(1,1) NOT NULL, 
    StageId INT NOT NULL,           
    LangueCd CHAR(2) NOT NULL,      
    SalleFormationId INT NULL,      
    DateDebut DATE NOT NULL,
    Prix DECIMAL(8, 2) NULL,
    Note TINYINT NULL,
    Statut CHAR(10) NULL,
    DateCreation DATE NOT NULL,
    Duree TINYINT NULL,
    IntraEntrerprise BIT NOT NULL,
    Remarques VARCHAR(1500) NULL,
    FormateurId INT NULL,           
    
    CONSTRAINT pk_SessionStage PRIMARY KEY (SessionId),
    CONSTRAINT uq_SessionStage_CodeDateLieu UNIQUE (DateDebut, SalleFormationId),
    CONSTRAINT fk_Session_Stage 
        FOREIGN KEY (StageId) 
        REFERENCES [Stage].[Stage](StageId),
    CONSTRAINT fk_Session_Langue
        FOREIGN KEY (LangueCd)
        REFERENCES [Stage].[Langue](LangueCd)
);

CREATE TABLE [Inscription].[Inscription] (    
    InscriptionId INT IDENTITY(1,1) NOT NULL, 
    SessionId INT NOT NULL,                 
    DecideurInscriptionId INT NULL,         
    ContactId INT NULL,                    
    DateAnnulation DATE NULL,
    Remise TINYINT NOT NULL,
    Present BIT NOT NULL,
    DateCreation SMALLDATETIME NOT NULL,
    ReferenceCommande VARCHAR(100) NULL,
    ConventionEnvoyee BIT NOT NULL,
    ConvocationEnvoyee BIT NOT NULL,
    ListeAttente BIT NOT NULL,
    FeuilleEmargement VARCHAR(1000) NULL,
    
    CONSTRAINT pk_Inscription PRIMARY KEY (InscriptionId),
    CONSTRAINT fk_Inscription_Session 
        FOREIGN KEY (SessionId) 
        REFERENCES [Stage].[Session](SessionId),
    CONSTRAINT fk_Inscription_Contact_Stagiaire
        FOREIGN KEY (ContactId)
        REFERENCES [Contact].[Contact](ContactId),
    CONSTRAINT fk_Inscription_Contact_Decideur
        FOREIGN KEY (DecideurInscriptionId)
        REFERENCES [Contact].[Contact](ContactId)
);
GO

CREATE TABLE [Inscription].[InscriptionFacture] (    
    InscriptionId INT NOT NULL, 
    FactureCd VARCHAR(50) NOT NULL, 

    CONSTRAINT pk_InscriptionFacture PRIMARY KEY (InscriptionId, FactureCd),
    CONSTRAINT fk_IF_Inscription 
        FOREIGN KEY (InscriptionId) 
        REFERENCES [Inscription].[Inscription](InscriptionId),
    CONSTRAINT fk_IF_Facture
        FOREIGN KEY (FactureCd)
        REFERENCES [Inscription].[Facture](FactureCd)
);
