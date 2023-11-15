/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     11/15/2023 8:14:33 AM                        */
/*==============================================================*/


drop index if exists BILD_PK;

drop table if exists Bild cascade;

drop index if exists INGREDIENTAMOUNT_ZUTAT_FK;

drop index if exists INGREDIENT_AMOUNT_PK;

drop table if exists Ingredient_Amount cascade;

drop index if exists KATEGORIE_PK;

drop table if exists Kategorie cascade;

drop index if exists KATEGORIE_REZEPT_FK2;

drop index if exists KATEGORIE_REZEPT_FK;

drop index if exists KATEGORIE_REZEPT_PK;

drop table if exists Kategorie_Rezept cascade;

drop index if exists REZEPT_PK;

drop table if exists Rezept cascade;

drop index if exists REZEPT_REZEPTSTEP_FK;

drop index if exists REZEPTSTEP_PK;

drop table if exists RezeptStep cascade;

drop index if exists ZUTAT_PK;

drop table if exists Zutat cascade;

/*==============================================================*/
/* Table: Bild                                                  */
/*==============================================================*/
create table Bild (
   URI                  VARCHAR(254)         not null,
   Beschreibung         VARCHAR(254)         null,
   B_ID                 INT8                 not null,
   constraint PK_BILD primary key (B_ID)
);

/*==============================================================*/
/* Index: BILD_PK                                               */
/*==============================================================*/
create unique index BILD_PK on Bild (
B_ID
);

/*==============================================================*/
/* Table: Ingredient_Amount                                     */
/*==============================================================*/
create table Ingredient_Amount (
   R_ID                 INT8                 not null,
   I_ID                 INT8                 not null,
   amount               NUMERIC              null,
   unit                 VARCHAR(254)         null,
   constraint PK_INGREDIENT_AMOUNT primary key (R_ID, I_ID)
);

/*==============================================================*/
/* Index: INGREDIENT_AMOUNT_PK                                  */
/*==============================================================*/
create unique index INGREDIENT_AMOUNT_PK on Ingredient_Amount (
R_ID,
I_ID
);

/*==============================================================*/
/* Index: INGREDIENTAMOUNT_ZUTAT_FK                             */
/*==============================================================*/
create  index INGREDIENTAMOUNT_ZUTAT_FK on Ingredient_Amount (
I_ID
);

/*==============================================================*/
/* Table: Kategorie                                             */
/*==============================================================*/
create table Kategorie (
   Name                 VARCHAR(254)         not null,
   constraint PK_KATEGORIE primary key (Name)
);

/*==============================================================*/
/* Index: KATEGORIE_PK                                          */
/*==============================================================*/
create unique index KATEGORIE_PK on Kategorie (
Name
);

/*==============================================================*/
/* Table: Kategorie_Rezept                                      */
/*==============================================================*/
create table Kategorie_Rezept (
   Name                 VARCHAR(254)         not null,
   R_ID                 INT8                 not null,
   constraint PK_KATEGORIE_REZEPT primary key (Name, R_ID)
);

/*==============================================================*/
/* Index: KATEGORIE_REZEPT_PK                                   */
/*==============================================================*/
create unique index KATEGORIE_REZEPT_PK on Kategorie_Rezept (
Name,
R_ID
);

/*==============================================================*/
/* Index: KATEGORIE_REZEPT_FK                                   */
/*==============================================================*/
create  index KATEGORIE_REZEPT_FK on Kategorie_Rezept (
Name
);

/*==============================================================*/
/* Index: KATEGORIE_REZEPT_FK2                                  */
/*==============================================================*/
create  index KATEGORIE_REZEPT_FK2 on Kategorie_Rezept (
R_ID
);

/*==============================================================*/
/* Table: Rezept                                                */
/*==============================================================*/
create table Rezept (
   Name                 VARCHAR(254)         null,
   Beschreibung         VARCHAR(254)         null,
   Rating               INT4                 null,
   R_ID                 INT8                 not null,
   B_ID                 INT8                 null,
   constraint PK_REZEPT primary key (R_ID)
);

/*==============================================================*/
/* Index: REZEPT_PK                                             */
/*==============================================================*/
create unique index REZEPT_PK on Rezept (
R_ID
);

/*==============================================================*/
/* Table: RezeptStep                                            */
/*==============================================================*/
create table RezeptStep (
   R_ID                 INT8                 not null,
   RS_ID                INT4                 not null,
   Beschreibung         VARCHAR(510)         null,
   constraint PK_REZEPTSTEP primary key (R_ID, RS_ID)
);

/*==============================================================*/
/* Index: REZEPTSTEP_PK                                         */
/*==============================================================*/
create unique index REZEPTSTEP_PK on RezeptStep (
R_ID,
RS_ID
);

/*==============================================================*/
/* Index: REZEPT_REZEPTSTEP_FK                                  */
/*==============================================================*/
create  index REZEPT_REZEPTSTEP_FK on RezeptStep (
R_ID
);

/*==============================================================*/
/* Table: Zutat                                                 */
/*==============================================================*/
create table Zutat (
   I_ID                 INT8                 not null,
   B_ID                 INT8                 null,
   Name                 VARCHAR(254)         null,
   Beschreibung         VARCHAR(254)         null,
   constraint PK_ZUTAT primary key (I_ID)
);

/*==============================================================*/
/* Index: ZUTAT_PK                                              */
/*==============================================================*/
create unique index ZUTAT_PK on Zutat (
I_ID
);

alter table Ingredient_Amount
   add constraint FK_INGREDIE_INGREDIEN_ZUTAT foreign key (I_ID)
      references Zutat (I_ID)
      on delete restrict on update restrict;

alter table Ingredient_Amount
   add constraint FK_INGREDIE_REZEPT_IN_REZEPT foreign key (R_ID)
      references Rezept (R_ID)
      on delete restrict on update restrict;

alter table Kategorie_Rezept
   add constraint FK_KATEGORI_KATEGORIE_KATEGORI foreign key (Name)
      references Kategorie (Name)
      on delete restrict on update restrict;

alter table Kategorie_Rezept
   add constraint FK_KATEGORI_KATEGORIE_REZEPT foreign key (R_ID)
      references Rezept (R_ID)
      on delete restrict on update restrict;

alter table Rezept
   add constraint FK_REZEPT_REFERENCE_BILD foreign key (B_ID)
      references Bild (B_ID)
      on delete restrict on update restrict;

alter table RezeptStep
   add constraint FK_REZEPTST_REZEPT_RE_REZEPT foreign key (R_ID)
      references Rezept (R_ID)
      on delete restrict on update restrict;

alter table Zutat
   add constraint FK_ZUTAT_REFERENCE_BILD foreign key (B_ID)
      references Bild (B_ID)
      on delete restrict on update restrict;

