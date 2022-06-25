import {Router} from "express";
import {AddRecordPlace} from "../../records/AddRecordPlace";


export const placesRouter = Router()

    .get('/places', async (req, res) => {
        const data = await AddRecordPlace.getAllPlaces();
        res.json({
            message: data
        })
    })

