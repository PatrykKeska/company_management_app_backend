import {Router, Request, Response, NextFunction} from 'express';
import {AddProductToPlace} from '../../records/AddProductToPlace';


const obj: AddProductToPlace = {
    place_id: '12213',
    item_id: '41562',
    item_amount: 3,
}
export const inventoryRouter = Router()


    .get('/inventory', async (req, res) => {
        const response = AddProductToPlace.addNewItem(obj)
        res.json(response);
    })


.post('/inventory', async (req,res)=>{
    const response = await AddProductToPlace.showItemsInPlace('ea7e9ac8-7ff3-4e3d-b4e0-e72612569be3');
    res.json(response)
})