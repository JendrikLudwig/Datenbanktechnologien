import mysql from 'mysql2/promise';

export const mysqlconn = await mysql.createConnection({ 
    host: 'localhost',
    port:'3306',
    user: 'root',
    password: 'admin',
    database: 'datenbanktechnologien_grojäglud'
});


export const post = async ({request}) => {
    const data = await request.json();
    let {mail, password} = data
    console.log(data);

}