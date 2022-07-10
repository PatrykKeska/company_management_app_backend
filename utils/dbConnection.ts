import {createPool} from "mysql2/promise";

export const pool = createPool({
    // host: 'localhost',
    host:"0.0.0.0",
    user: 'root',
    password: 'root',
    database: 'company_assets',
    namedPlaceholders: true,
    decimalNumbers: true,
    port:8889,
})