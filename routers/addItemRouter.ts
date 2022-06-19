import {Router} from "express";
import {AdRecordItem} from "../records/AddRecordItem";


export const addItemRouter = Router()
    .get('/', async (req, res) => {
        const data = await AdRecordItem.getOneItem('xxx-xxx');
        console.log(data)
        res.json({
            message: data
        })
    })