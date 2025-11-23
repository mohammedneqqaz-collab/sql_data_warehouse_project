CREATE TABLE DimContact (
DimContactSk INT IDENTITY(1,1) PRIMARY KEY,
ContactId INT,
Nom VARCHAR(100),
Prenom VARCHAR(100),
Email VARCHAR(150),
Sexe VARCHAR(10),
Ville VARCHAR(100),
CodeDepartement VARCHAR(10),
NomDepartement VARCHAR(100),
CodePays VARCHAR(10),
NomPaysFrancais VARCHAR(100),
NomPaysAnglais VARCHAR(100),
SocieteId INT,
NomSociete VARCHAR(150)
);

CREATE TABLE DimSession (
DimSessionSk INT IDENTITY(1,1) PRIMARY KEY,
SessionId INT,
LangueLocal VARCHAR(50),
LangueFrancais VARCHAR(50),
DateDebut DATE,
Categorie VARCHAR(100),
Domaine VARCHAR(100),
Prix DECIMAL(10,2),
Note VARCHAR(50),
Duree INT,
FormateurId INT,
NomFormateur VARCHAR(100),
SocieteFormateurId INT,
NomSocieteFormateur VARCHAR(150),
NomVilleSocieteFormateur VARCHAR(100),
NomSalleFormation VARCHAR(150),
NomLieuFormation VARCHAR(150),
NomVilleFormation VARCHAR(100)
);

CREATE TABLE DimInscription (
DimInscriptionSk INT IDENTITY(1,1) PRIMARY KEY,
InscriptionId INT,
ReferenceCommande VARCHAR(150)
);

CREATE TABLE FactInscription (
FactInscriptionSk INT IDENTITY(1,1) PRIMARY KEY,
DimContactSk INT,
DimSessionSk INT,
DimInscriptionSk INT,
DateSession DATE,
MontantHT DECIMAL(10,2),
DateFacture DATE,

FOREIGN KEY (DimContactSk) REFERENCES DimContact(DimContactSk),
FOREIGN KEY (DimSessionSk) REFERENCES DimSession(DimSessionSk),
FOREIGN KEY (DimInscriptionSk) REFERENCES DimInscription(DimInscriptionSk)
);
