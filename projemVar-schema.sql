-- LastTest = 15.03.17
-- Suanlik PostgreSql de denedim! Calisiyor;

-- Users tablosunda kullanici girisi icin 'nickname' ve 'email_private' degiskenleri yapildi.
-- email_public degiskenide sitedeki herkesin ulasabilecegi email adresi yapildi.
DROP TABLE Users CASCADE;
CREATE TABLE Users (
    nickname varchar(12) not null,
    email_private varchar(20) not null,
    password varchar(20) not null,
    email_public varchar(20),
    primary key (nickname)
);

-- UsersSocialMedia tablosuda Users larin sosyal medya hesaplari tutuyor.
DROP TABLE UsersSocialMedia CASCADE;
CREATE TABLE UsersSocialMedia (
    nickname varchar(12) not null,
    website varchar(20),
    github varchar(20),
    stackoverflow varchar(20),
    medium varchar(20),
    primary key (nickname),
    foreign key (nickname) references Users(nickname)
);
