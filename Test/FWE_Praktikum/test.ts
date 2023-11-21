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

app.use(express.json());

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
        for (const element of allRezepte) {
            await element.rezeptSteps.init();
            await element.zutaten.init();
            await element.kategorien.init();
            if(element.Bild) {
                const bild = await bildRepository.findOne({ B_ID: element.Bild.B_ID });
                if (bild) {
                    const rezeptWithURI = { ...element, Bild: bild.URI };
                    response.push(rezeptWithURI);
                }
                else {
                    const rezeptWithoutURI = {...element, Bild: 'n/a'}
                    response.push(rezeptWithoutURI);
                }
            }
            /* Since in Rezept there's only B_ID with the type is Bild
            *   We can't just assign URI in bild to B_ID due to difference in type
            *   therefore here instead of writing class Rezept to response
            *   I create a new reponse with custom Rezept which has B_ID replaced with URI
            */
        }
        res.json(response);
    } catch (error) {
        console.error(error);
        res.status(500).send('An error occurred while fetching Rezepte.');
    } finally {
        await orm.close(true);
    }
});

app.get('/api/zutat', async (req, res) => {
    const orm = await MikroORM.init(mikroOrmConfig);
    try {
        const em = orm.em.fork();
        const zutatRepository = em.getRepository(Zutat);
        const bildRepository = em.getRepository(Bild);
        const allZutaten = await zutatRepository.findAll();
        const response = [];
        for (const element of allZutaten) {
            await element.rezepte.init();
            if(element.Bild) {
                const bild = await bildRepository.findOne({ B_ID: element.Bild.B_ID });
                if (bild) {
                    const zutatWithURI = { ...element, Bild: bild.URI };
                    response.push(zutatWithURI);
                }
                else {
                    const zutatWithoutURI = {...element, Bild: 'n/a'}
                    response.push(zutatWithoutURI);
                }
            }
        }
        res.json(response);

    }
    catch (error) {
        console.error(error);
        res.status(500).send('An error occured while fetching Zutaten.');
    }
    finally {
        await orm.close(true);
    }

});
app.get('/api/rezept/search', async (req, res) => {
    const orm = await MikroORM.init(mikroOrmConfig);
    try {
        const em = orm.em.fork();
        const rezeptRepository = em.getRepository(Rezept);
        const bildRepository = em.getRepository(Bild);
        const query = req.query.q;
        if (typeof query !== 'string') {
            res.status(400).send('Invalid query parameter.');
            return;
        }
        const rezepte = await rezeptRepository.find({ Name: query });
        const response = [];
        for (const element of rezepte) {
            await element.zutaten.init();
            await element.kategorien.init();
            await element.rezeptSteps.init();
            if(element.Bild) {
                const bild = await bildRepository.findOne({ B_ID: element.Bild.B_ID });
                if (bild) {
                    const rezeptWithURI = { ...element, Bild: bild.URI };
                    response.push(rezeptWithURI);
                }
                else {
                    const rezeptWithoutURI = {...element, Bild: 'n/a'}
                    response.push(rezeptWithoutURI);
                }
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

app.get('/api/zutat/search', async (req, res) => {
    const orm = await MikroORM.init(mikroOrmConfig);
    try {
        const em = orm.em.fork();
        const zutatRepository = em.getRepository(Zutat);
        const bildRepository = em.getRepository(Bild);
        const query = req.query.q;
        if (typeof query !== 'string') {
            res.status(400).send('Invalid query parameter.');
            return;
        }
        const zutat = await zutatRepository.find({ Name: query });
        const response = [];
        for (const element of zutat) {
            element.rezepte.init();
            if(element.Bild) {
                const bild = await bildRepository.findOne({ B_ID: element.Bild.B_ID });
                if (bild) {
                    const zutatWithURI = { ...element, Bild: bild.URI };
                    response.push(zutatWithURI);
                }
                else {
                    const zutatWithoutURI = {...element, Bild: 'n/a'}
                    response.push(zutatWithoutURI);
                }
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

app.post('/api/rezept/add', async (req, res) => {
    // ... initialization code ...
    res.setHeader('Content-Type', 'application/json');
    const orm = await MikroORM.init(mikroOrmConfig);
    try {
        const em = orm.em.fork();
        const data = req.body[0];
        //creating new rezept instance and adding data to it
        const newRezept = new Rezept();
        newRezept.Name = data.Name;
        newRezept.Beschreibung = data.Beschreibung;
        newRezept.Rating = data.Rating;
        for (const step of data.rezeptSteps) {
            const newStep = new RezeptStep();
            newStep.Beschreibung = step.Beschreibung;
            newStep.RS_ID = step.RS_ID;
            newRezept.rezeptSteps.add(newStep);
        }
        for (const ingredientData of req.body.zutaten) {
            let ingredient = await em.findOne(Zutat, { Name: ingredientData.Name });
            if (!ingredient) {
                ingredient = new Zutat();
                ingredient.Name = ingredientData.Name;
                ingredient.Beschreibung = ingredientData.Beschreibung;
                em.persist(ingredient);
                console.log("persisted new ingredient" + ingredient.Name);
            }
            em.flush();
            console.log("Persisted new ingredient with ID: " + ingredient.I_ID);
            newRezept.zutaten.add(ingredient);
        }
        for (const categoryData of req.body.kategorien) {
            let category = await em.findOne(Kategorie, { Name: categoryData.Name });
            if (!category) {
                category = new Kategorie();
                category.Name = categoryData.Name;
                // Persist new category
                em.persist(category);
            }
            newRezept.kategorien.add(category);
        }
        em.persist(newRezept);
        await em.flush();
        res.status(201).json({ message: 'Rezept added successfully' });
    }
    catch (error) {
        console.error(error);
        res.status(500).send('An error occurred while adding Rezepte.');
    }
    finally {
        await orm.close(true);
    }
});

app.post('/api/zutat/add', async (req, res) => {
    // ... initialization code ...
    res.setHeader('Content-Type', 'application/json');
    const orm = await MikroORM.init(mikroOrmConfig);
    try {
        const em = orm.em.fork();
        const zutatData = req.body[0];
        let ingredient = await em.findOne(Zutat, { Name: zutatData.Name });
        if (!ingredient) {
            ingredient = new Zutat();
            ingredient.Name = zutatData.Name;
            ingredient.Beschreibung = zutatData.Beschreibung;
            em.persist(ingredient);
            console.log("persisted new ingredient " + ingredient.Name);
            em.flush();
            console.log("Persisted new ingredient with ID: " + ingredient.I_ID);
            let persistedIngredient = await em.findOne(Zutat, { Name: zutatData.Name });
            if (persistedIngredient) {
                ingredient = persistedIngredient;
            }
        }
        res.status(201).json({ message: 'Zutat added successfully' });
    }
    catch (error) {
        console.error(error);
        res.status(500).send('An error occurred while adding Rezepte.');
    }
    finally {
        await orm.close(true);
    }
});






app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});