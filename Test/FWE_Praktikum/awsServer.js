import express from 'express';

const app = express();
const port = 3000;

class Entity {
    constructor(id, name) {
        this.id = id;
        this.name = name;
    }
}
app.get('/test', (req, res) => {
    let e = new Entity(1, 'test');
    res.send(e);
})

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});