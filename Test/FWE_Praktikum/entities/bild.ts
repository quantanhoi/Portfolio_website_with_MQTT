import { Entity, PrimaryKey, Property  } from '@mikro-orm/core';
import { MySqlDriver } from '@mikro-orm/mysql';

@Entity({tableName: 'Bild'})
export class Bild {
    @PrimaryKey()
    B_ID!: number;

    @Property()
    URI!: string;

    @Property()
    Beschreibung!: string;
}