import {AdEntityItem} from "../types/AdEntity";
import {ValidationError} from "../utils/errors";
import {pool} from "../utils/dbConnection";
import {FieldPacket} from "mysql2";
import {v4 as uuid} from "uuid";

type AdRecordResults = [AdEntityItem[], FieldPacket[]];


export class AdRecordItem implements AdEntityItem {
    public id?: string;
    public name: string;
    public price: number;
    public amount: number;
    public dateOfBuy: string;
    public img?: string;

    constructor(obj: AdEntityItem) {
        if (obj.id.length > 36) {
            throw new ValidationError("id length can't be greater than 36 characters !")
        }

        if (!obj.name || obj.name.length < 3 || obj.name.length > 30) {
            throw new ValidationError("Name of the item can't be longer than 30 or less than 3 characters ")
        }
        if (!obj.price || obj.price <= 0 || obj.price > 999999) {
            throw new ValidationError("price have to greater than 0 and less than 999999")
        }
        if (!obj.amount || obj.amount <= 0 || obj.amount > 99999) {
            throw new ValidationError("pieces number have to greater than 0 and less than 99999")
        }
        if (!obj.dateOfBuy) {
            throw new ValidationError("Date have to be filled up!")
        }

        if (obj.img.length > 200) {
            throw new ValidationError("Img src link can't be longer than 200 characters!")
        }

        this.id = obj.id;
        this.name = obj.name;
        this.price = obj.price;
        this.amount = obj.amount;
        this.dateOfBuy = obj.dateOfBuy;
        this.img = obj.img;

    }


    static async insertNewItem(obj: AdRecordItem) {
        if (!obj.id) {
            obj.id = uuid();
        }
        await pool.execute("INSERT INTO `products` (id,name,price,amount,dateOfBuy,img) VALUES(:id,:name,:price,:amount,:dateOfBuy,:img)", {
            id: obj.id,
            name: obj.name,
            price: obj.price,
            amount: obj.amount,
            dateOfBuy: obj.dateOfBuy,
            img: obj.img
        })

    }


    static async getOneItem(id: string): Promise<AdRecordItem> {

        const [results] = await pool.execute("SELECT * FROM `products` WHERE id=:id", {
            id,
        }) as AdRecordResults
        return new AdRecordItem(results[0])

    }

    static async getAllItems() {

        const [results] = await pool.execute("SELECT * FROM `products`") as AdRecordResults
        return results.map(item => new AdRecordItem(item))

    }

    static async filterAllItems(name: string): Promise<AdRecordItem[]> {
        const [results] = await pool.execute("SELECT * FROM `products` WHERE `name` LIKE :search", {
            search: `%${name}`
        }) as AdRecordResults;
        return results.map(item => new AdRecordItem(item))

    }

    static async updateProduct(obj: AdRecordItem) {
        await pool.execute("UPDATE `products`  SET name =:name, price= :price, amount=:amount, dateOfBuy= :dateOfBuy, img= :img WHERE id = :id", {
            id: obj.id,
            name: obj.name,
            price: obj.price,
            amount: obj.amount,
            dateOfBuy: obj.dateOfBuy,
            img: obj.img,

        })
    }

    static async deleteProduct(id: string) {


        await pool.execute("SET FOREIGN_KEY_CHECKS=0");
        await pool.execute("DELETE FROM `products` WHERE id=:id", {
            id
        })
        await pool.execute(' SET FOREIGN_KEY_CHECKS=1 ');

    }

  

    // @TODo Create  methods for handle Update and Delete Item !


}



