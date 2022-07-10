import {ValidationError} from "../utils/errors";
import {pool} from "../utils/dbConnection";
import {FieldPacket} from "mysql2";
import {v4 as uuid} from "uuid";
import {ProductsInPlaces} from "../types/ProductsInPlaces";
import {AdEntityItem} from "../types/AdEntity";

type Result = [ProductsInPlaces[], FieldPacket[]]


export class AddProductToPlace implements ProductsInPlaces {
    place_id: string;
    item_id: string;
    amount: number;
    name: string;
    price: number;
    dateOfBuy: string;
    img: string


    constructor(obj: ProductsInPlaces) {

        this.place_id = obj.place_id;
        this.item_id = obj.item_id;
        this.amount = obj.amount;
        this.name = obj.name
        this.price = obj.price
        this.dateOfBuy = obj.dateOfBuy
        this.img = obj.img


    }

    static async addNewItem(obj: ProductsInPlaces) {
        await pool.execute("INSERT INTO `places_products`(place_id, item_id, amount, name, price, dateOfBuy,img) VALUES(:place_id, :item_id, :amount, :name, :price, :dateOfBuy, :img)", {
            place_id: obj.place_id,
            item_id: obj.item_id,
            amount: obj.amount,
            name: obj.name,
            price: obj.price,
            dateOfBuy: obj.dateOfBuy,
            img: obj.img


        });

    }

    static async getAllPlaces() {
        const [results] = await pool.execute("SELECT * FROM `places_products`") as Result
        return results.map((place: ProductsInPlaces) => new AddProductToPlace(place))
    }


    static async updateInventory(placeID: string, itemID: string, amount: number) {
        await pool.execute("UPDATE `places_products` SET `amount` = :amount  WHERE `place_id` = :placeID AND `item_id` = :itemID ", {
            placeID,
            itemID,
            amount

        })
    }

    static async findItem(id: string, placeID: string) {
        const [response] = await pool.execute("SELECT (place_id),(item_id),(amount) FROM `places_products` WHERE `item_id` = :id AND `place_id` = :placeID ", {
            id,
            placeID,
        }) as Result
        return response[0]
    }


    static async showItemsInPlace(place_id: string) {
        const [response] = await pool.execute("SELECT * FROM `places_products` WHERE `place_id` = :place_id", {
            place_id
        }) as Result
        return response.map(item => new AddProductToPlace(item))
    }

    static async isProductExistInPlace(placeID: string, itemID: string): Promise<AddProductToPlace> | null {
        const [response] = await pool.execute("SELECT `item_id` FROM `places_products` WHERE `place_id`=:placeID AND `item_id` = :itemID", {
            placeID,
            itemID,
        }) as Result;


        return response.length > 0 ? new AddProductToPlace(response[0]) : null

    }

    static async deleteProduct(place_id: string, item_id: string) {
        await pool.execute("DELETE FROM `places_products` WHERE place_id=:place_id AND item_id = :item_id", {
            place_id,
            item_id
        })
    }

}



