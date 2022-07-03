import { mysqlconn } from '$lib/db/mysql';

export const post = async ({request}) => {
    
        const data = await request.json();

        let {mail, password} = data

        if(!mail, !password) {
            return {
                status: 403,
                body: {
                    error: "Fehlender Parameter"
                }
            };
        }
        
        const query = `

            SELECT * FROM USER
            WHERE MAIL = "${mail}"
        
        
        `

        let results = await mysqlconn.query(query)
        .then(function([rows,fields]) {
            return rows;
        });

        console.log(results?.[0]?.Password, password);



        if (results?.[0]?.Password == password) {
            return {body: {
                id: results[0].UserID,
                username: results[0].UserName,
                pic: results[0].ProfilePicture    
            }}
        }
    

        return {
            status: 403,
            body: {
                error: "Falsches Passwort oder E-Mail"
            }

        };
        
    
    
}