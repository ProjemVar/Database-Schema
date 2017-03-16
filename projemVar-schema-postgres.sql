-- LastTest = 15.03.17
-- Suanlik PostgreSql de denedim! Calisiyor;

-- Users tablosunda kullanici girisi icin 'nickname' ve 'email_private' degiskenleri yapildi.
-- email_public degiskenide sitedeki herkesin ulasabilecegi email adresi yapildi.
DROP TABLE Users CASCADE;
CREATE TABLE Users (
    nickname        varchar(12) not null,
    email_private   varchar(20) not null,
    password        varchar(20) not null,
    email_public    varchar(20),
    primary key (nickname)
);

-- UsersSocialMedia tablosuda Users larin sosyal medya hesaplari tutuyor.
DROP TABLE UsersSocialMedia CASCADE;
CREATE TABLE UsersSocialMedia (
    nickname        varchar(12) not null,
    website         varchar(20),
    github          varchar(20),
    stackoverflow   varchar(20),
    medium          varchar(20),
    primary key (nickname),
    foreign key (nickname) references Users(nickname)
);

DROP TABLE Projects CASCADE;
CREATE TABLE Projects (
    project_name        varchar(20) not null,
    creator_nickname    varchar(20) not null,
    createdDate         date,
    project_size        int,    -- quota 5 or 10 or limitless
    project_status      int,    -- 1 ? Active : 2 ? Maintain : 3 ? Finished : None
    project_content     varchar(100) not null,
    project_team        varchar(20) not null, -- memberships
    project_tags        varchar(20) not null, -- tags like js, nodejs, express, python
    primary key (creator_nickname, project_name),
    foreign key (creator_nickname) references Users(nickname)
);