import { MikroORM } from '@mikro-orm/core';
import mikroOrmConfig from './mikro-orm.config';
import { Bild } from './entities/bild';
import { Ingredient_Amount } from './entities/ingredient_amount';
import { Kategorie } from './entities/kategorie';
import { Rezept } from './entities/rezept';
import { RezeptStep } from './entities/rezeptstep';
import { Zutat } from './entities/zutat';
import { KategorieRezept } from './entities/kategorie_rezept';


import express from 'express';

const app = express();
const port = 3000;

// const main = async () => {
//     const orm = await MikroORM.init(mikroOrmConfig);
//     try {
//         const em = orm.em.fork();
//         const entitiesRepository = em.getRepository(Rezept);
//         const bildRepository = em.getRepository(Bild);
//         const allEntities = await entitiesRepository.findAll();

//         for (const element of allEntities) {

//             await element.zutaten.init(); // populate the rezepte collection
//             const bild = await bildRepository.findOne({ B_ID: element.B_ID.B_ID })
//             console.log(element);
//             console.log(bild);

//         }
//     } catch (error) {
//         console.error(error);
//     } finally {
//         await orm.close(true);
//     }
// };

// main().catch(console.error);

app.get('/', (req, res) => {
    res.send('Hello, world!');
});


app.get('/api/rezept', async (req, res) => {
    const orm = await MikroORM.init(mikroOrmConfig);
    try {
        const em = orm.em.fork();
        const rezeptRepository = em.getRepository(Rezept);
        const bildRepository = em.getRepository(Bild);
        const allRezepte = await rezeptRepository.findAll();
        const response = [];
        for(const element of allRezepte) {
            await element.zutaten.init();
            await element.kategorien.init();
            const bild = await bildRepository.findOne({ B_ID: element.B_ID.B_ID });
            /* Since in Rezept there's only B_ID with the type is Bild
            *   We can't just assign URI in bild to B_ID due to difference in type
            *   therefore here instead of writing class Rezept to response
            *   I create a new reponse with custom Rezept which has B_ID replaced with URI
            */  
            if (bild) {
                const rezeptWithURI = {...element, B_ID: bild.URI}; // replace B_ID with URI
                response.push(rezeptWithURI);
            }
        }
        res.json(response);
    } catch (error) {
        console.error(error);
        res.status(500).send('An error occurred while fetching Rezepte.');
    } finally {
        await orm.close(true);
    }
});

app.get('/api/zutat',async (req, res) => {
    const orm = await MikroORM.init(mikroOrmConfig);
    try{
        const em = orm.em.fork();
        const zutatRepository = em.getRepository(Zutat);
        const bildRepository = em.getRepository(Bild);
        const allZutaten = await zutatRepository.findAll();
        const response = [];
        for (const element of allZutaten) {
            await element.rezepte.init();
            const bild = await bildRepository.findOne({B_ID: element.B_ID.B_ID});
            if(bild) {
                const zutatWithURI = {...element, B_ID: bild.URI};
                response.push(zutatWithURI);
            }
        }
        res.json(response);

    }
    catch(error) {
        console.error(error);
        res.status(500).send('An error occured while fetching Zutaten.');
    }
    finally {
        await orm.close(true);
    }

});




app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});