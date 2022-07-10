import {Router, Request, Response, NextFunction} from 'express';
import {AddProductToPlace} from '../../records/AddProductToPlace';
import {AdRecordItem} from '../../records/AddRecordItem';


export const FinalizedRouter = Router()


    .get('/finalized', async (req, res) => {

        const data = await AddProductToPlace.getAllPlaces();
        res.json(
            {allPlaces: data,});

    })


    .post('/finalized', async (req, res) => {
        const {pickedPlaceID} = req.body;

        const pickedPlaceItems = await AddProductToPlace.showItemsInPlace(pickedPlaceID);

        res.json({
            response: pickedPlaceItems,
            place_id: pickedPlaceID
        })


    })


    .post('/finalized/delete', async (req, res) => {
        const {place_id, item_id} = req.body
        const pickedPlaceItems = AddProductToPlace.deleteProduct(place_id, item_id);
        const afterDelete = await AddProductToPlace.showItemsInPlace(place_id);
        res.json(
            {
                update: afterDelete
            }
        )
    })