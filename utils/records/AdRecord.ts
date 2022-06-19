import {AdEntityItem} from "../../types/AdEntity";
import {ValidationError} from "../errors";
import {pool} from "../dbConnection";
import {FieldPacket} from "mysql2";

type AdRecordResults = [AdRecordItem[], FieldPacket[]];

export class AdRecordItem implements AdEntityItem {
    public id: string;
    public name: string;
    public price: number;
    public pieces: number;
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
        if (!obj.pieces || obj.pieces <= 0 || obj.pieces > 99999) {
            throw new ValidationError("pieces number have to greater than 0 and less than 99999")
        }
        if (!obj.dateOfBuy) {
            throw new ValidationError("Date have to be filled up!")
        }

        if (obj.img.length > 100) {
            throw new ValidationError("Img src link can't be longer than 100 characters!")
        }

        this.id = obj.id;
        this.name = obj.name;
        this.price = obj.price;
        this.pieces = obj.pieces;
        this.dateOfBuy = obj.dateOfBuy;
        this.img = obj.img;

    }


    static async getOneItem(id: string): Promise<AdRecordItem> | null {

        const [results] = await pool.execute("SELECT * FROM `products` WHERE id=:id", {
            id,
        }) as AdRecordResults
        return results.length === 0 ? null : new AdRecordItem(results[0])

    }

}



