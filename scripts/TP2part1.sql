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
