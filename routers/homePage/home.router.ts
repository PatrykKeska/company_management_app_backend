import {Router, Request, Response, NextFunction} from 'express';
import {user} from '../../.testdata'


export const homeRouter = Router()
    .get('/', (req, res) => {

    })

    .post('/', async (req, res) => {
        const {login, password} = req.body;
        if (login === user.loginBE && password === user.passwordBE) {

            res.json(
                {auth: true,
                }
            )
        }
    })


