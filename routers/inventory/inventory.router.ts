import {Router, Request, Response, NextFunction} from 'express';
import {AddProductToPlace} from '../../records/AddProductToPlace';
import {AdRecordItem} from '../../records/AddRecordItem';

export const inventoryRouter = Router()
    .post('/inventory/check', async (req, res) => {
        console.log(req.body)
        const {place, items} = req.body
        

        await AddProductToPlace.addNewItem({
            item_id: items.id, place_id: place.id, item_amount: items.amount, item_price: items.price,
        });
    })

