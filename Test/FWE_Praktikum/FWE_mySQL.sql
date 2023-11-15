/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/15/2023 10:14:07 AM                       */
/*==============================================================*/


alter table Ingredient_Amount 
   drop foreign key FK_INGREDIE_INGREDIEN_ZUTAT;

alter table Ingredient_Amount 
   drop foreign key FK_INGREDIE_REZEPT_IN_REZEPT;

alter table Kategorie_Rezept 
   drop foreign key FK_KATEGORI_KATEGORIE_KATEGORI;

alter table Kategorie_Rezept 
   drop foreign key FK_KATEGORI_KATEGORIE_REZEPT;

alter table Rezept 
   drop foreign key FK_REZEPT_REFERENCE_BILD;

alter table RezeptStep 
   drop foreign key FK_REZEPTST_REZEPT_RE_REZEPT;

alter table Zutat 
   drop foreign key FK_ZUTAT_REFERENCE_BILD;

drop table if exists Bild;


alter table Ingredient_Amount 
   drop foreign key FK_INGREDIE_REZEPT_IN_REZEPT;

alter table Ingredient_Amount 
   drop foreign key FK_INGREDIE_INGREDIEN_ZUTAT;

drop table if exists Ingredient_Amount;

drop table if exists Kategorie;


alter table Kategorie_Rezept 
   drop foreign key FK_KATEGORI_KATEGORIE_KATEGORI;

alter table Kategorie_Rezept 
   drop foreign key FK_KATEGORI_KATEGORIE_REZEPT;

drop table if exists Kategorie_Rezept;


alter table Rezept 
   drop foreign key FK_REZEPT_REFERENCE_BILD;

drop table if exists Rezept;


alter table RezeptStep 
   drop foreign key FK_REZEPTST_REZEPT_RE_REZEPT;

drop table if exists RezeptStep;


alter table Zutat 
   drop foreign key FK_ZUTAT_REFERENCE_BILD;

drop table if exists Zutat;

/*==============================================================*/
/* Table: Bild                                                  */
/*==============================================================*/
create table Bild
(
   URI                  varchar(254) not null  comment '',
   Beschreibung         varchar(254)  comment '',
   B_ID                 bigint not null  comment '',
   primary key (B_ID)
);

/*==============================================================*/
/* Table: Ingredient_Amount                                     */
/*==============================================================*/
create table Ingredient_Amount
(
   R_ID                 bigint not null  comment '',
   I_ID                 bigint not null  comment '',
   amount               numeric(8,0)  comment '',
   unit                 varchar(254)  comment '',
   primary key (R_ID, I_ID)
);

/*==============================================================*/
/* Table: Kategorie                                             */
/*==============================================================*/
create table Kategorie
(
   Name                 varchar(254) not null  comment '',
   primary key (Name)
);

/*==============================================================*/
/* Table: Kategorie_Rezept                                      */
/*==============================================================*/
create table Kategorie_Rezept
(
   Name                 varchar(254) not null  comment '',
   R_ID                 bigint not null  comment '',
   primary key (Name, R_ID)
);

/*==============================================================*/
/* Table: Rezept                                                */
/*==============================================================*/
create table Rezept
(
   Name                 varchar(254)  comment '',
   Beschreibung         varchar(254)  comment '',
   Rating               int  comment '',
   R_ID                 bigint not null  comment '',
   B_ID                 bigint  comment '',
   primary key (R_ID)
);

/*==============================================================*/
/* Table: RezeptStep                                            */
/*==============================================================*/
create table RezeptStep
(
   R_ID                 bigint not null  comment '',
   RS_ID                int not null  comment '',
   Beschreibung         varchar(510)  comment '',
   primary key (R_ID, RS_ID)
);

/*==============================================================*/
/* Table: Zutat                                                 */
/*==============================================================*/
create table Zutat
(
   I_ID                 bigint not null  comment '',
   B_ID                 bigint  comment '',
   Name                 varchar(254)  comment '',
   Beschreibung         varchar(254)  comment '',
   primary key (I_ID)
);

alter table Ingredient_Amount add constraint FK_INGREDIE_INGREDIEN_ZUTAT foreign key (I_ID)
      references Zutat (I_ID) on delete restrict on update restrict;

alter table Ingredient_Amount add constraint FK_INGREDIE_REZEPT_IN_REZEPT foreign key (R_ID)
      references Rezept (R_ID) on delete restrict on update restrict;

alter table Kategorie_Rezept add constraint FK_KATEGORI_KATEGORIE_KATEGORI foreign key (Name)
      references Kategorie (Name) on delete restrict on update restrict;

alter table Kategorie_Rezept add constraint FK_KATEGORI_KATEGORIE_REZEPT foreign key (R_ID)
      references Rezept (R_ID) on delete restrict on update restrict;

alter table Rezept add constraint FK_REZEPT_REFERENCE_BILD foreign key (B_ID)
      references Bild (B_ID) on delete restrict on update restrict;

alter table RezeptStep add constraint FK_REZEPTST_REZEPT_RE_REZEPT foreign key (R_ID)
      references Rezept (R_ID) on delete restrict on update restrict;

alter table Zutat add constraint FK_ZUTAT_REFERENCE_BILD foreign key (B_ID)
      references Bild (B_ID) on delete restrict on update restrict;

