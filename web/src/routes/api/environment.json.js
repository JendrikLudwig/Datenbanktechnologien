import { mysqlconn } from '$lib/db/mysql';

export async function get() {

   
    

    const genre_query = `
        SELECT 
            * 
        FROM 
            GENRE
    
    `

    const dev_query = `
        SELECT 
            * 
        FROM 
            DEVELOPER
    
    `

    const publisher_query = `
        SELECT 
            * 
        FROM 
            PUBLISHER
    
    `

    const feature_query = `
        SELECT 
            Features
        FROM
            GAME
        
    `
    const launcher_query = `
        SELECT 
            *
        FROM
            LAUNCHER
        
    `


    let genre_results = await mysqlconn.query(genre_query)
        .then(function([rows]) {
            return rows;
        });

    let dev_results = await mysqlconn.query(dev_query)
        .then(function([rows]) {
            return rows;
        });

    let publisher_results = await mysqlconn.query(publisher_query)
        .then(function([rows]) {
            return rows;
        });
    
    let feature_results = await mysqlconn.query(feature_query)
        .then(function([rows]) {
            return rows;
        });



    let usedFeatures = []  
    
    
    feature_results.forEach(ft => {
        const feature = parseFeatures(ft.Features);
        feature.forEach(f => {
            if(!usedFeatures.includes(f)) usedFeatures.push(f)   
        })
        
    });


    const return_data = {
        genre: genre_results,
        developer: dev_results,
        publisher: publisher_results,
        features: usedFeatures
    }

    


    return {
        body: return_data
    }
}

function parseFeatures(ft) {
    const nB = ft.replaceAll("[", "").replaceAll("]", "");
    const nA = nB.replaceAll('"', "");
    return nA.split(",");
}

