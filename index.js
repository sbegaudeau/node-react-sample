import express from 'express';
import bodyParser from 'body-parser';

const app = express();

app.use(bodyParser.json());
app.use(express.static('frontend/build'));
app.use(express.static('static'));

const port = process.env.PORT || 8081;
app.listen(port, () => {
    console.log(`App running on port ${port}`);
});