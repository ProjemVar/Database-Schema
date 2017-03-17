# Database-Schema
Database Schema

# Mysql Kurulumu (Arch Linux vs..)
```
  (bash)$ sudo pacman -S mysql              # Mysql i indiriyoruz.
  (bash)$ sudo systemctl start mysqld       # Mysql servisi calistiriyoruz.
  (bash)$ sudo mysql_secure_installation    # Mysql i kuruyoruz.
```

<a href="https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04">Debian Dagitimlari icin Kurulum</a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
<a href="https://www.if-not-true-then-false.com/2010/install-mysql-on-fedora-centos-red-hat-rhel/">Rpm Dagitimlari icin Kurulum</a>

# Mysql Shell ine ulasmak.
```
  (bash)$ mysql -u root -p
  Enter password:                           # Kurulum sirasinda girdiginiz parolayi giriniz.
  mysql>
```

# Mysql de yeni Veritabani ve yeni Kullanici olusturmak.
<h6>Yeni Veritabani olusturuyoruz. Adi da 'ProjemVar' olsun.</h6>

```
  mysql> CREATE DATABASE ProjemVar;
```

<h6>Yeni Kullanici olusturuyoruz. Adi da 'furkan' olsun.Parola da '123456' olsun.</h6>

```
  mysql> CREATE USER furkan@localhost IDENTIFIED BY '123456';
```

<h6>Olusturdugumuz kullaniciya veritabaninin haklarini veriyoruz.</h6>

```
  mysql> GRANT ALL PRIVILEGES ON ProjemVar.* TO furkan@localhost;
  mysql> exit
```

<h6>Yeni kullanicimizla veritabani ulasmak.</h6>

```
  (bash)$ mysql -u furkan -p
  Enter password:                             # Buraya '123456' degerini giriyoruz.
  mysql> show databases;                      # Kullanicimizin ulasabilecegi tum veritabanlarini gosteriyor.
```
