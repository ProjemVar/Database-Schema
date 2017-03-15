DROP_TABLE Users CASCADE;
CREATE TABLE Users (
    nickname varchar(12) not null,
    email_private varchar(20) not null,
    password varchar(20) not null,
    email_public varchar(20),
    primary key (nickname)
);

