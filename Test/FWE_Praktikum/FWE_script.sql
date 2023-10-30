/*==============================================================*/
/* DBMS name:      PostgreSQL 14.x                              */
/* Created on:     10/30/2023 7:13:15 PM                        */
/*==============================================================*/


drop index KATEGORIE_PK;

drop table Kategorie;

drop index KATEGORIE_REZEPT_FK2;

drop index KATEGORIE_REZEPT_FK;

drop index KATEGORIE_REZEPT_PK;

drop table Kategorie_Rezept;

drop index REZEPT_PK;

drop table Rezept;

drop index REZEPT_REZEPTSTEP_FK;

drop index REZEPTSTEP_PK;

drop table RezeptStep;

drop index REZEPTSTEP_ZUTAT_FK2;

drop index REZEPTSTEP_ZUTAT_FK;

drop index REZEPTSTEP_ZUTAT_PK;

drop table RezeptStep_Zutat;

drop index REZEPT_ZUTAT_FK2;

drop index REZEPT_ZUTAT_FK;

drop index REZEPT_ZUTAT_PK;

drop table Rezept_Zutat;

drop index ZUTAT_PK;

drop table Zutat;

/*==============================================================*/
/* Table: Kategorie                                             */
/*==============================================================*/
create table Kategorie (
   Name                 varchar(254)         not null,
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
   Name                 varchar(254)         not null,
   ID                   bigint               not null,
   constraint PK_KATEGORIE_REZEPT primary key (Name, ID)
);

/*==============================================================*/
/* Index: KATEGORIE_REZEPT_PK                                   */
/*==============================================================*/
create unique index KATEGORIE_REZEPT_PK on Kategorie_Rezept (
Name,
ID
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
ID
);

/*==============================================================*/
/* Table: Rezept                                                */
/*==============================================================*/
create table Rezept (
   Name                 varchar(254),
   Beschreibung         varchar(254),
   Rating               integer,
   Bilder               varchar(254),
   ID                   bigint               not null,
   constraint PK_REZEPT primary key (ID)
);

/*==============================================================*/
/* Index: REZEPT_PK                                             */
/*==============================================================*/
create unique index REZEPT_PK on Rezept (
ID
);

/*==============================================================*/
/* Table: RezeptStep                                            */
/*==============================================================*/
create table RezeptStep (
   Rez_ID               bigint               not null,
   ID                   integer              not null,
   Beschreibung         integer,
   constraint PK_REZEPTSTEP primary key (Rez_ID, ID)
);

/*==============================================================*/
/* Index: REZEPTSTEP_PK                                         */
/*==============================================================*/
create unique index REZEPTSTEP_PK on RezeptStep (
Rez_ID,
ID
);

/*==============================================================*/
/* Index: REZEPT_REZEPTSTEP_FK                                  */
/*==============================================================*/
create  index REZEPT_REZEPTSTEP_FK on RezeptStep (
Rez_ID
);

/*==============================================================*/
/* Table: RezeptStep_Zutat                                      */
/*==============================================================*/
create table RezeptStep_Zutat (
   Rez_Rez_ID           bigint               not null,
   Rez_ID               integer              not null,
   ID                   bigint               not null,
   constraint PK_REZEPTSTEP_ZUTAT primary key (Rez_Rez_ID, Rez_ID, ID)
);

/*==============================================================*/
/* Index: REZEPTSTEP_ZUTAT_PK                                   */
/*==============================================================*/
create unique index REZEPTSTEP_ZUTAT_PK on RezeptStep_Zutat (
Rez_Rez_ID,
Rez_ID,
ID
);

/*==============================================================*/
/* Index: REZEPTSTEP_ZUTAT_FK                                   */
/*==============================================================*/
create  index REZEPTSTEP_ZUTAT_FK on RezeptStep_Zutat (
Rez_Rez_ID,
Rez_ID
);

/*==============================================================*/
/* Index: REZEPTSTEP_ZUTAT_FK2                                  */
/*==============================================================*/
create  index REZEPTSTEP_ZUTAT_FK2 on RezeptStep_Zutat (
ID
);

/*==============================================================*/
/* Table: Rezept_Zutat                                          */
/*==============================================================*/
create table Rezept_Zutat (
   ID                   bigint               not null,
   Zut_ID               bigint               not null,
   constraint PK_REZEPT_ZUTAT primary key (ID, Zut_ID)
);

/*==============================================================*/
/* Index: REZEPT_ZUTAT_PK                                       */
/*==============================================================*/
create unique index REZEPT_ZUTAT_PK on Rezept_Zutat (
ID,
Zut_ID
);

/*==============================================================*/
/* Index: REZEPT_ZUTAT_FK                                       */
/*==============================================================*/
create  index REZEPT_ZUTAT_FK on Rezept_Zutat (
ID
);

/*==============================================================*/
/* Index: REZEPT_ZUTAT_FK2                                      */
/*==============================================================*/
create  index REZEPT_ZUTAT_FK2 on Rezept_Zutat (
Zut_ID
);

/*==============================================================*/
/* Table: Zutat                                                 */
/*==============================================================*/
create table Zutat (
   ID                   bigint               not null,
   Name                 varchar(254),
   Beschreibung         varchar(254),
   Bild                 varchar(254),
   constraint PK_ZUTAT primary key (ID)
);

/*==============================================================*/
/* Index: ZUTAT_PK                                              */
/*==============================================================*/
create unique index ZUTAT_PK on Zutat (
ID
);

alter table Kategorie_Rezept
   add constraint FK_KATEGORI_KATEGORIE_KATEGORI foreign key (Name)
      references Kategorie (Name)
      on delete restrict on update restrict;

alter table Kategorie_Rezept
   add constraint FK_KATEGORI_KATEGORIE_REZEPT foreign key (ID)
      references Rezept (ID)
      on delete restrict on update restrict;

alter table RezeptStep
   add constraint FK_REZEPTST_REZEPT_RE_REZEPT foreign key (Rez_ID)
      references Rezept (ID)
      on delete restrict on update restrict;

alter table RezeptStep_Zutat
   add constraint FK_REZEPTST_REZEPTSTE_REZEPTST foreign key (Rez_Rez_ID, Rez_ID)
      references RezeptStep (Rez_ID, ID)
      on delete restrict on update restrict;

alter table RezeptStep_Zutat
   add constraint FK_REZEPTST_REZEPTSTE_ZUTAT foreign key (ID)
      references Zutat (ID)
      on delete restrict on update restrict;

alter table Rezept_Zutat
   add constraint FK_REZEPT_Z_REZEPT_ZU_REZEPT foreign key (ID)
      references Rezept (ID)
      on delete restrict on update restrict;

alter table Rezept_Zutat
   add constraint FK_REZEPT_Z_REZEPT_ZU_ZUTAT foreign key (Zut_ID)
      references Zutat (ID)
      on delete restrict on update restrict;

