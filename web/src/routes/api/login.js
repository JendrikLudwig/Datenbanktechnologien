import mysql from 'mysql2/promise';

export const mysqlconn = await mysql.createConnection({ 
    host: 'localhost',
    port:'3306',
    user: 'root',
    password: 'admin',
    database: 'datenbanktechnologien_grojäglud'
});



export async function post() {
    //Login über Mail
    // USER Aus DB ziehen (oder hash)
    // Abgleichen (hash oder nicht)
    //bestätigungstoken zurückgeben
}