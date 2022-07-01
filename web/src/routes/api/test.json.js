import mysql from 'mysql2/promise';

export const mysqlconn = await mysql.createConnection({ 
    host: 'localhost',
    port:'3306',
    user: 'root',
    password: 'admin',
    database: 'datenbanktechnologien_grojäglud'
});


export async function get() {
    
    let results = await mysqlconn.query('SELECT * FROM game')
        .then(function([rows,fields]) {
            console.log(rows);
            return rows;
        });
    
    return {
        body: results
    }
}