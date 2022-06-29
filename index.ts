import express, {json} from "express";
import cors from 'cors';
import {handleError} from "./utils/errors";
import {addItemRouter} from "./routers/Products/addItemRouter";
import {addPlaceRouter} from "./routers/Places/addPlaceRouter";
import {storageRouter} from "./routers/Products/storageRouter";
import {placesRouter} from "./routers/Places/placesRouter";
import {homeRouter} from "./routers/homePage/home.router";

const cookieParser = require('cookie-parser')

const app = express();
app.use(cors({
    origin: "http://localhost:3000",
    credentials: true,
}));
app.use(cookieParser());
app.use(json());
app.use('/', homeRouter);
app.use('/', addItemRouter);
app.use('/', storageRouter);
app.use('/', addPlaceRouter);
app.use('/', placesRouter);


app.use(handleError)
app.listen(3001, '0.0.0.0', () => console.log("Listening on http://localhost:3001"));
