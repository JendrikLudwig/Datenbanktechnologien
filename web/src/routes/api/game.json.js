import { mysqlconn } from '$lib/db/mysql';

export async function get() {
    
    let results = await mysqlconn.query('SELECT * FROM GAME')
        .then(function([rows,fields]) {
            console.log(rows);
            return rows;
        });
    
    return {
        body: results
    }
}


export const post = async ({request}) => {

    const data = await request.json();

    if(!data) {
        return {
            status: 403,
            body: {
                error: "Fehlender Parameter"
            }
        };
    }

    return {
        status: 404,
        body: {
            error: "POST-Request is not defined."
        }

    };
}