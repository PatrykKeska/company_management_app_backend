import {createPool} from "mysql2/promise";

export const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'company_assets',
    namedPlaceholders: true,
    decimalNumbers: true,
})