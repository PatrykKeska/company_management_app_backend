import {createPool} from "mysql2/promise";
import { dbConfig } from "./dbConfig";
export const pool = createPool({
    // host: 'localhost',
    host:dbConfig.host,
    user: dbConfig.user,
    password: dbConfig.password,
    database: dbConfig.database,
    namedPlaceholders:true,
    decimalNumbers: true,
    port:8889,
})