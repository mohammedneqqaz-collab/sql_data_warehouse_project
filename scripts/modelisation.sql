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
