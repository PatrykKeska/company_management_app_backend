import {AdEntityPlace} from "../types/AdEntity";
import {v4 as uuid} from 'uuid'
import {ValidationError} from "../utils/errors";
import {pool} from "../utils/dbConnection";
import {FieldPacket} from "mysql2";

type AdRecordPlaceResults = [AddRecordPlace[], FieldPacket[]];


export class AddRecordPlace implements AdEntityPlace {
    id: string;
    name: string;
    city: string;
    street: string;
    buildNumber: string;
    img?: string;

    constructor(obj: AdEntityPlace) {
        if (!obj.id) {
            obj.id = uuid();
        }
        if (obj.id.length > 36) {
            throw new ValidationError("id length can't be greater than 36 characters !")
        }
        if (!obj.name || obj.name.length < 3 || obj.name.length > 20) {
            throw new ValidationError("Name of the place can't be longer than 20 or less than 3 characters ")
        }
        if (!obj.city || obj.city.length < 3 || obj.name.length > 35) {
            throw new ValidationError("City name of the place can't be longer than 35 or less than 3 characters ")
        }
        if (!obj.street || obj.street.length < 3 || obj.street.length > 36) {
            throw new ValidationError("street name of the place can't be longer than 36 or less than 3 characters ")
        }
        if (!obj.buildNumber || obj.buildNumber.length > 20) {
            throw new ValidationError("build name of the place can't be longer than 20 or less than 3 characters ")
        }
        if (obj.img.length > 200) {
            throw new ValidationError("img link of the place can't be longer than 200 characters")
        }

        this.id = obj.id;
        this.name = obj.name;
        this.city = obj.city;
        this.street = obj.street;
        this.buildNumber = obj.buildNumber;
        this.img = obj.img;
    }

    static async getAllPlaces() {

        const [results] = await pool.execute("SELECT * FROM `places` ") as AdRecordPlaceResults;
        return results.map(place => new AddRecordPlace(place as AdEntityPlace))
    }

    static async getOnePlace(id: string): Promise<AddRecordPlace> | null {
        const [result] = await pool.execute("SELECT * FROM `places` WHERE `id`= :id", {
            id
        }) as AdRecordPlaceResults
        return result.length > 0 ? new AddRecordPlace(result[0]) : null
    }

    async insertNewPlace() {
        await pool.execute("INSERT INTO `places`(id,name,city,street,buildNumber,img) VALUES(:id,:name,:city,:street,:buildNumber,:img)", {
            id: this.id,
            name: this.name,
            city: this.city,
            street: this.street,
            buildNumber: this.buildNumber,
            img: this.img,

        })
    }

    static async updatePlace(obj: AddRecordPlace) {
        await pool.execute("UPDATE `places`  SET name =:name, city= :city, street=:street, buildNumber= :buildNumber, img= :img WHERE id = :id", {
            id: obj.id,
            name: obj.name,
            city: obj.city,
            street: obj.street,
            buildNumber: obj.buildNumber,
            img: obj.img,

        })
    }

    static async deletePlace(id: string) {

        await pool.execute("DELETE FROM `places` WHERE id=:id", {
            id
        })
    }
}