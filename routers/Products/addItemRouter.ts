import {Router} from "express";
import {AdRecordItem} from "../../records/AddRecordItem";


export const addItemRouter = Router()
    .get('/add-new-item', async (req, res) => {
        // const test = await AdRecordItem.findRelation();
        // console.log(test)
        const data = await AdRecordItem.getOneItem('xxx-xxx');
        res.json({
            message: data
        })
    })


    .post('/add-new-item', async (req, res) => {

        const {name, price, amount, dateOfBuy, img} = req.body
        await AdRecordItem.insertNewItem({name, price, amount, dateOfBuy, img})
        res.json({
            message: req.body
        })
    })

    .patch('/storage/update', async (req, res) => {
        const {id, name, price, amount, dateOfBuy, img} = req.body as AdRecordItem
        const data = await AdRecordItem.updateProduct({id, name, price, amount, dateOfBuy, img})
    })

    .delete('/storage/delete', async (req, res) => {
        const {id} = req.body
        await AdRecordItem.deleteProduct(id)
    })


// @TODO Create API endpoints for handleSubmit PATCH DELETE  !!!