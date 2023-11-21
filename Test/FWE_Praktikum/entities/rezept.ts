import { Entity, PrimaryKey, Property, OneToMany, OneToOne, Collection, ManyToMany, Cascade } from '@mikro-orm/core';
import { Bild } from './bild';
import { Ingredient_Amount } from './ingredient_amount'
import { RezeptStep } from './rezeptstep';
import { KategorieRezept } from './kategorie_rezept';
import { Kategorie } from './kategorie';
import { Zutat } from './zutat';
@Entity({tableName : 'Rezept'})
export class Rezept {
    @PrimaryKey({fieldName: 'R_ID'})
    R_ID!: number;

    @Property({fieldName: 'Name'})
    Name!: string;

    @Property({default: 'n/a', fieldName: 'Beschreibung'})
    Beschreibung?: string;

    @Property({default: 0, fieldName: 'Rating'})
    Rating?: number;

    @OneToOne(() => Bild ,{nullable: true, default: 'n/a', fieldName: 'B_ID'})
    Bild?: Bild;

    // @OneToMany(() => Ingredient_Amount, ingredientAmount => ingredientAmount.rezept)
    // ingredientAmounts = new Collection<Ingredient_Amount>(this);

    @OneToMany(() => RezeptStep, rezeptStep => rezeptStep.rezept, { cascade: [Cascade.ALL] })
    rezeptSteps = new Collection<RezeptStep>(this);


    @ManyToMany({entity: () => Zutat, pivotEntity: () => Ingredient_Amount, cascade: [Cascade.ALL] })
    zutaten = new Collection<Zutat>(this);

    // @OneToMany(() => KategorieRezept, kr => kr.rezept)
    // kategorieRezepte = new Collection<KategorieRezept>(this);
    @ManyToMany({entity: () => Kategorie, mappedBy: k => k.rezepte, cascade: [Cascade.PERSIST]})
    kategorien = new Collection<Kategorie>(this)
}