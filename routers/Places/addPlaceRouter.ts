import {Router} from "express";
import {AdRecordItem} from "../../records/AddRecordItem";
import {AdEntityPlace} from "../../types/AdEntity";
import {AddRecordPlace} from '../../records/AddRecordPlace'


export const addPlaceRouter = Router()
    .get('/add-new-item', async (req, res) => {
        const data = await AdRecordItem.getOneItem('xxx-xxx');
        res.json({
            message: data
        })
    })


    .post('/add-new-place', async (req, res) => {
        const {name, city, street, buildNumber, img} = req.body as AdEntityPlace
        const newPlace = new AddRecordPlace({name, city, street, buildNumber, img});
        newPlace.insertNewPlace()

    })


    .patch('/places/update', async (req, res) => {
        const {id, name, city, street, buildNumber, img} = req.body as AddRecordPlace
        await AddRecordPlace.updatePlace({id, name, city, street, buildNumber, img} as AddRecordPlace)
    })

    .delete('/places/delete', async (req, res) => {
        const {id} = req.body
        await AddRecordPlace.deletePlace(id)
    })