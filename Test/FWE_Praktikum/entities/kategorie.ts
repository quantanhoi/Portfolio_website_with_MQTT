import { Entity, PrimaryKey, Collection, ManyToMany } from '@mikro-orm/core';
import { Rezept } from './rezept';


@Entity({tableName : 'Kategorie'})
export class Kategorie {
    @PrimaryKey()
    Name!: string;

    @ManyToMany(() => Rezept)
    rezepte = new Collection<Rezept>(this);
}