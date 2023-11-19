import { Entity, PrimaryKey, Property, ManyToOne } from '@mikro-orm/core';
import { Rezept } from './rezept';


@Entity({tableName: 'RezeptStep'})
export class RezeptStep {
    @PrimaryKey()
    RS_ID!: number;

    @Property()
    Beschreibung!: string;

    @ManyToOne(() => Rezept, { primary: true, fieldName: 'R_ID' })
    rezept!: Rezept;

}