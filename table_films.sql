CREATE DOMAIN Dsexe char(1) NOT NULL DEFAULT 'F' check(@col in ( 'M','F'));

CREATE TABLE tbReal (
    realId       int default AUTOINCREMENT,
    realNom      char(30) NOT NULL,
    realPrenom   char(15) NULL,
    realSexe     Dsexe,

    CONSTRAINT pk_tbReal PRIMARY KEY (realID),
);


CREATE TABLE tbUser (
    userId       int default AUTOINCREMENT,
    userNom      char(30) NOT NULL,
    userPrenom   char(15) NULL,
    userWatchTime int NOT NULL,

    CONSTRAINT pk_tbUser PRIMARY KEY (userId),
);

CREATE TABLE tbGenre (
    genreId      int default AUTOINCREMENT,
    genreNom     char(20) NOT NULL,

    CONSTRAINT pk_tbGenre PRIMARY KEY (genreId)
);

CREATE TABLE tbFilms (
    filmId       int default AUTOINCREMENT,
    filmTitre    char(40) NOT NULL,
    genreId      int NOT NULL,
    realID       int NOT NULL,
    filmDuree    int NOT NULL,
    filmNotteMoyenne    int NOT NULL,

    CONSTRAINT pk_tbFilms PRIMARY KEY (filmId),
    CONSTRAINT fk_tbGenre FOREIGN KEY (genreId) REFERENCES tbGenre(genreId),
    CONSTRAINT fk_tbUser FOREIGN KEY (userId) REFERENCES tbUser(userId),
    CONSTRAINT fk_tbReal FOREIGN KEY (realId) REFERENCES tbReal(realId),

);

CREATE TABLE tbWish (
    wishId       int default AUTOINCREMENT,
    userId       int NOT NULL,
    filmId       int NOT NULL,

    CONSTRAINT pk_wishId PRIMARY KEY (wishId),
    CONSTRAINT fk_tbUser FOREIGN KEY (userId) REFERENCES tbUser(userId),
    CONSTRAINT fk_tbFilms FOREIGN KEY (filmId) REFERENCES tbFilms(filmId),

);

CREATE TABLE tbVu (
    vuId         int default AUTOINCREMENT,
    userId       int NOT NULL,
    filmId       int NOT NULL,

    CONSTRAINT pk_vuId PRIMARY KEY (vuId),
    CONSTRAINT fk_tbUser FOREIGN KEY (userId) REFERENCES tbUser(userId),
    CONSTRAINT fk_tbFilms FOREIGN KEY (filmId) REFERENCES tbFilms(filmId),

);


