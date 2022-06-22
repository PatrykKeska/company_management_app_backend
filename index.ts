import express, {json} from "express";
import cors from 'cors';
import {handleError} from "./utils/errors";
import {addItemRouter} from "./routers/addItemRouter";
import {storageRouter} from "./routers/storageRouter";


const app = express();

app.use(cors({
    origin: "http://localhost:3000"
}));
app.use(json());
app.use('/', addItemRouter);
app.use('/', storageRouter);
// app.use(express.static('public'));




app.use(handleError)
app.listen(3001, '0.0.0.0', () => console.log("Listening on http://localhost:3001"));
