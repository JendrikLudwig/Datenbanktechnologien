import mysql from 'mysql2/promise';

export const mysqlconn = await mysql.createConnection({ 
    host: 'localhost',
    port:'3306',
    user: 'root',
    password: 'admin',
    database: 'datenbanktechnologien_grojäglud'
});


export const post = async ({request}) => {
    
    try {
        const data = await request.json();

        let {mail, password} = data
        
        const query = `

            SELECT * FROM USER
            WHERE MAIL = "${mail}"
        
        
        `

        let results = await mysqlconn.query(query)
        .then(function([rows,fields]) {
            return rows;
        });

        console.log(results[0].Password, password);

        if (results[0].Password == password) {
            return {body:{
                id: results[0].UserID,
                username: results[0].UserName,
                pic: results[0].ProfilePicture    
            }}
        }
    

        return {
            status: 403,
            body: {
                message: "Falsches Passwort oder E-Mail"
            }
        };
        
    } catch (error) {
        return {
            status: 404,
            body: {
                error:error
            }
        };
    }
    
    
}