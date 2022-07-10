import {Router, Request} from "express";
import { upload } from "../utils/FileTransfer/FileTransfer";
import path from 'path'

export const FileTransfrerRouter = Router()

    .post('/test', async (req: any, res: any) => {
        const pathToFile = path.resolve(__dirname,)
        upload(req,res, (err:any)=>{
            console.log(req.file)
            if(err){
                return res.status(500).json(err)
            }

            return  res.status(200).send(req.file.path)
        })

    })