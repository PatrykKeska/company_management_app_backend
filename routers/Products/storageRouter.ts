import {Router} from "express";
import {AdRecordItem} from "../../records/AddRecordItem";


export const storageRouter = Router()
    .get('/storage', async (req, res) => {
        const data = await AdRecordItem.getAllItems();
        const obj = JSON.stringify(data)
        res.json({
            message: data
        })
    })

