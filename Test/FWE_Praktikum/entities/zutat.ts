import { Entity, PrimaryKey, Property, OneToMany, OneToOne, Collection } from '@mikro-orm/core';
import { Bild } from './bild';
import { Ingredient_Amount } from './ingredient_amount'

@Entity({tableName : 'Zutat'})
export class Zutat {
    @PrimaryKey()
    I_ID!: number;

    @Property()
    Name!: string;

    @Property()
    Beschreibung!: string;

    @OneToOne(() => Bild)
    B_ID!: Bild;

    @OneToMany(() => Ingredient_Amount, ingredientAmount => ingredientAmount.zutat)
    ingredientAmounts = new Collection<Ingredient_Amount>(this);
}