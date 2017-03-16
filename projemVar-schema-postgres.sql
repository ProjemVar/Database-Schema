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
    unique(nickname, email_private),
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
    unique(nickname),
    primary key (nickname),
    foreign key (nickname) references Users(nickname)
);

-- Projects tablosunda projelerin ozelliklerini tutuyoruz.
DROP TABLE Projects CASCADE;
CREATE TABLE Projects (
    pno			        int,
    project_name        varchar(20) not null,
    creator_nickname    varchar(20) not null,
    createdDate         date,
    project_size        int,    -- quota 5 or 10 or limitless
    project_status      int,    -- 1 ? Active : 2 ? Maintain : 3 ? Finished : None
    project_content     varchar(100) not null,
    unique(project_name),
    primary key (pno),
    foreign key (creator_nickname) references Users(nickname)
);


-- ProjectsTeam tablosunda projede bulunan uyeler var.
DROP TABLE ProjectsTeam CASCADE;
CREATE TABLE ProjectsTeam ( -- membership
    pno	        int,
    nickname 	varchar(20) not null,
    primary key(pno, nickname),
    foreign key(pno) references Projects(pno),
    foreign key(nickname) references Users(nickname)
);

-- ProjectsTags tablosunda projenin tag leri yani 'nodejs', 'cava', 'fayton' gibi ifadeleri tutuyoruz.
DROP TABLE ProjectsTags CASCADE;
CREATE TABLE ProjectsTags (
    pno	int,
    tag	varchar(15) not null,
    primary key(pno),
    foreign key(pno) references Projects(pno)
);
