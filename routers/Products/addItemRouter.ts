import {Router} from "express";
import {AdRecordItem} from "../../records/AddRecordItem";


export const addItemRouter = Router()
    .get('/add-new-item', async (req, res) => {
        const data = await AdRecordItem.getOneItem('xxx-xxx');
        res.json({
            message: data
        })
    })


    .post('/add-new-item', async (req, res) => {

        const {name,price,pieces,dateOfBuy,img} = req.body
        console.log(req.body)
        await AdRecordItem.insertNewItem({name,price,pieces,dateOfBuy,img})
        res.json({
            message: req.body
        })
    })