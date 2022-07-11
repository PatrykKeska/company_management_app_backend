import express, {json, Router} from "express";
import cors from 'cors';
import {handleError} from "./utils/errors";
import {addItemRouter} from "./routers/Products/addItemRouter";
import {addPlaceRouter} from "./routers/Places/addPlaceRouter";
import {storageRouter} from "./routers/Products/storageRouter";
import {placesRouter} from "./routers/Places/placesRouter";
import {homeRouter} from "./routers/homePage/home.router";
import {inventoryRouter} from "./routers/inventory/inventory.router";
import { FinalizedRouter } from "./routers/finalized/Finalized.router";
import path from "path";
import { FileTransfrerRouter } from "./routers/FileTransfrer.Router";
const cookieParser = require('cookie-parser');




const app = express();
app.use(cors({
    origin: "http://localhost:3000",
    credentials: true,
}));
app.use(cookieParser());
app.use(express.static(__dirname + '/public'));
app.use(json());
const router = Router();
router.use('/',homeRouter)
router.use('/',addItemRouter)
router.use('/',storageRouter)
router.use('/',addPlaceRouter)
router.use('/',placesRouter)
router.use('/',inventoryRouter)
router.use('/',FinalizedRouter)
router.use('/',FileTransfrerRouter)
app.use('/api', router);




app.use(handleError)
app.listen(3001, '0.0.0.0', () => console.log("Listening on http://localhost:3001"));
