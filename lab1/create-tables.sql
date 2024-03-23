DROP TABLE IF EXISTS Динозавры CASCADE;
DROP TABLE IF EXISTS Голоса_Динозавров CASCADE;
DROP TABLE IF EXISTS Состояния_Динозавров CASCADE;
DROP TABLE IF EXISTS Люди CASCADE;
DROP TABLE IF EXISTS Действия CASCADE;

CREATE TABLE IF NOT EXISTS Голоса_Динозавров (
    ID SERIAL PRIMARY KEY,
    Звук VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS Состояния_Динозавров (
    ID SERIAL PRIMARY KEY,
    Состояние VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS Динозавры (
    ID SERIAL PRIMARY KEY,
    Вид VARCHAR(255),
    Размер INT,
    Голос_ID INT UNIQUE,
    Состояние_ID INT,
    FOREIGN KEY (Голос_ID) REFERENCES Голоса_Динозавров(ID),
    FOREIGN KEY (Состояние_ID) REFERENCES Состояния_Динозавров(ID)
);

CREATE TABLE IF NOT EXISTS Люди (
    ID SERIAL PRIMARY KEY,
    Имя VARCHAR(255),
    Возраст INT
);

CREATE TABLE IF NOT EXISTS Действия (
    ID SERIAL PRIMARY KEY,
    Дата_и_время TEXT,
    Описание TEXT,
    Динозавр_ID INT,
    Человек_ID INT,
    FOREIGN KEY (Динозавр_ID) REFERENCES Динозавры(ID) ON DELETE CASCADE,
    FOREIGN KEY (Человек_ID) REFERENCES Люди(ID) ON DELETE CASCADE
);

