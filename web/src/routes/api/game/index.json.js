import { mysqlconn } from '$lib/db/mysql';

export async function get() {
    
    let results = await mysqlconn.query('SELECT * FROM GAME')
        .then(function([rows]) {
            console.log(rows);
            return rows;
        });
    
    return {
        body: results
    }
}


export const post = async ({request}) => {

    const { input_desc,
            input_dev,
            input_features,
            input_fsk,
            input_genre,
            input_name,
            input_pub,
            input_release,
            launcher
    } = await request.json();

    if(!input_desc || !input_dev || !input_features || !input_fsk || !input_genre || !input_name || !input_pub || !input_release || !launcher) {
        return {
            status: 403,

            body: {
                error: "Fehlender Parameter"
            }
        };
    }

    const insert_query_game = `
        INSERT INTO GAME (Title, Genre, FSK, Developer, Publisher, ReleaseDate, Description, Features)
        VALUES("${input_name}","${input_genre}","${input_fsk}","${input_dev}","${input_pub}","${input_release}","${input_desc}",'${JSON.stringify(input_features)}')
    `

    

    let game_results = await mysqlconn.query(insert_query_game)
        .then(function([rows]) {
            console.log(rows);
            return rows;
        });

    console.log(game_results);

    const insert_query_launchergame = `
        INSERT INTO LAUNCHERGAME (GameID, LauncherID, Link)
        VALUES
    ` + launcher.map(la => {
            return `("${game_results.insertId}","${la.LauncherID}","${la.url}")`
        }).join(",")

         
    let launcher_games_results = await mysqlconn.query(insert_query_launchergame)
        .then(function([rows]) {
            console.log(rows);
            return rows;
        });



    return {
        status: 200,

        body: {
            success: true,
            id: game_results.insertId
        }

    };
}