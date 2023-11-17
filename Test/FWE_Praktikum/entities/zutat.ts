import { Entity, PrimaryKey, Property, OneToMany, OneToOne, Collection, ManyToMany } from '@mikro-orm/core';
import { Bild } from './bild';
import { Ingredient_Amount } from './ingredient_amount'
import { Rezept } from './rezept';

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

    @ManyToMany({entity: () => Rezept, mappedBy : r => r.zutaten})
    rezepte = new Collection<Rezept>(this);
}