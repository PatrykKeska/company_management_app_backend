import {Router} from "express";
import { upload } from "../utils/FileTransfer/FileTransfer";
export const FileTransferRouter = Router()

    .post('/test', (req:any,res)=>{
        upload(req,res, (err:any)=>{
            if(err){
                return res.status(500).json(err)
            }
            return  res.status(200).send(req.file)
        })
    })