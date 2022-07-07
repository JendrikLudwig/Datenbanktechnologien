import { mysqlconn } from '$lib/db/mysql';

export async function get({params}) {


    const game_query = `
    
        SELECT 
            g.title,
            ge.Name AS Genre,
            g.fsk,
            de.Name AS developer,
            pu.Name AS publisher,
            g.releasedate,
            g.description,
            g.features
        FROM
            GAME AS g
                JOIN
            genre AS ge ON g.genre = ge.GenreID
                JOIN
            developer AS de ON g.developer = de.DeveloperID
                JOIN
            publisher AS pu ON g.publisher = pu.PublisherID
        WHERE
            gameid = ${params.id}

        
    
    `

    const launcher_query = `
    
        SELECT 
            l.name, Link
        FROM
            launchergame AS lg
                JOIN
            Launcher AS l ON lg.LauncherID = l.LauncherID
        WHERE
            gameid = ${params.id}

    `  
    
    
    let game_results = await mysqlconn.query(game_query)
        .then(function([rows,fields]) {
            return rows[0];
        });


    let launcher_results = await mysqlconn.query(launcher_query)
        .then(function([rows,fields]) {
            return rows;
        });
    




    return {
        body: {
            data: {
                ...game_results,
                launcher: launcher_results,
            }
                
            
            
            
        }
    }
}

