import { Entity, PrimaryKey, Property, ManyToOne} from '@mikro-orm/core';
import { Zutat } from './zutat';
import {Rezept} from './rezept';

@Entity({tableName: 'Ingredient_Amount'})
export class Ingredient_Amount {
    @PrimaryKey()
    R_ID!: number;

    @PrimaryKey()
    I_ID!: number;

    @Property()
    amount!: number;

    @Property()
    unit!: string;

    @ManyToOne(() => Rezept)
    rezept!: Rezept;

    @ManyToOne(() => Zutat)
    zutat!: Zutat;
}