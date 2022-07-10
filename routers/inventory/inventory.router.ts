import {Router, Request, Response, NextFunction} from 'express';
import {AddProductToPlace} from '../../records/AddProductToPlace';
import {AdRecordItem} from '../../records/AddRecordItem';
import {AddRecordPlace} from '../../records/AddRecordPlace';
import {calcAmount} from '../../utils/calcAmount';
import {calcSameKindAmount} from '../../utils/calcSameKindAmount';


export const inventoryRouter = Router()
    .post('/inventory/check', async (req, res) => {
        // console.log(req.body)
        const {place: incommingPlaces, items: incommingItems} = req.body

        // Adding Items to picked places and updating a storage values. 


        const inStorageItems = await AdRecordItem.getOneItem(incommingItems.id);
        const isExist = await AddProductToPlace.isProductExistInPlace(incommingPlaces.id, incommingItems.id)


        if (isExist !== null) {
            // if item exist in exact location just update the amount of products
            const getExistedItem = await AddProductToPlace.findItem(incommingItems.id, incommingPlaces.id);
            const amountUpdate = await calcSameKindAmount(getExistedItem.amount, incommingItems.amount);
            await AddProductToPlace.updateInventory(incommingPlaces.id, incommingItems.id, amountUpdate)
        } else {
            await AddProductToPlace.addNewItem({
                item_id: incommingItems.id,
                place_id: incommingPlaces.id,
                amount: incommingItems.amount,
                img: incommingItems.img,
                name: incommingItems.name,
                dateOfBuy: incommingItems.dateOfBuy,
                price: incommingItems.price

            });
        }
        // Storage Delete or Update After we move some amount of product to specific places...
        const newAmount = await calcAmount(inStorageItems.amount, incommingItems.amount);

        if (newAmount <= 0) {
            const data = await AdRecordItem.deleteProduct(incommingItems.id)

        } else {
            const {id, name, price, dateOfBuy, img} = incommingItems
            const data = await AdRecordItem.updateProduct({id: id, name, price, amount: newAmount, dateOfBuy, img})
        }

        res.status(200)
        res.send('ok')
    })

