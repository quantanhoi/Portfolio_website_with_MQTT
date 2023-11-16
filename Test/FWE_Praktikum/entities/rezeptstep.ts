import { Entity, PrimaryKey, Property, ManyToOne } from '@mikro-orm/core';
import { Rezept } from './rezept';


@Entity({tableName: 'RezeptStep'})
export class RezeptStep {
    @PrimaryKey()
    R_ID!: number;

    @PrimaryKey()
    RS_ID!: number;

    @Property()
    Beschreibung!: string;

    @ManyToOne(() => Rezept)
    rezept!: Rezept;
}