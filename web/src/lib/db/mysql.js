import mysql from 'mysql2/promise';

export const mysqlconn = await mysql.createConnection({ 
    host: 'localhost',
    port:'3306',
    user: 'frontend',
    password: 'datenbanktechnologien123!',
    database: 'datenbanktechnologien_grojäglud'
});
