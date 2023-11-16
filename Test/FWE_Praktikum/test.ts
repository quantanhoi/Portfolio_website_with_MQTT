import { MikroORM } from '@mikro-orm/core';
import mikroOrmConfig from './mikro-orm.config';
import { Bild } from './entities/bild';
import { Ingredient_Amount } from './entities/ingredient_amount';
import { Kategorie } from './entities/kategorie';
import { Rezept } from './entities/rezept';
import { RezeptStep } from './entities/rezeptstep';
import { Zutat } from './entities/zutat';


const main = async () => {
    const orm = await MikroORM.init(mikroOrmConfig);
    try {
        const em = orm.em.fork();
        const entitiesRepository = em.getRepository(Kategorie);
        const allEntities = await entitiesRepository.findAll();

        for (const kategorie of allEntities) {
            console.log(kategorie);
            // await kategorie.rezepte.init(); // populate the rezepte collection
            // const recipes = kategorie.rezepte;
            // recipes.getItems().forEach(element => { // use getItems() to get the items in the collection
            //     console.log(element);
            // });
        }
    } catch (error) {
        console.error(error);
    } finally {
        await orm.close(true);
    }
};

main().catch(console.error);

