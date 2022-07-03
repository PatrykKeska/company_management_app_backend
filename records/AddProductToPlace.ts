import {ValidationError} from "../utils/errors";
import {pool} from "../utils/dbConnection";
import {FieldPacket} from "mysql2";
import {v4 as uuid} from "uuid";
import {ProductsInPlaces} from "../types/ProductsInPlaces";

type Result = [ProductsInPlaces[], FieldPacket[]]

export class AddProductToPlace implements ProductsInPlaces {
    place_id: string;
    item_id: string;
    item_amount: number;
    item_price: number;

    constructor(obj: ProductsInPlaces) {

        this.place_id = obj.place_id;
        this.item_id = obj.item_id;
        this.item_amount = obj.item_amount;
        this.item_price = obj.item_price;
        
    }

    static async addNewItem(obj: ProductsInPlaces) {
        await pool.execute("INSERT INTO `places_products`(place_id, item_id, item_amount, item_price) VALUES(:place_id, :item_id, :item_amount, :item_price)", {
            place_id: obj.place_id,
            item_id: obj.item_id,
            item_amount: obj.item_amount,
            item_price: obj.item_price,
           
        });

    }

    static async showItemsInPlace(place_id: string) {
        const [response] = await pool.execute("SELECT (item_id) FROM `places_products` WHERE place_id = :place_id", {
            place_id
        }) as Result
        return response.map(item => new AddProductToPlace(item))
    }

}


