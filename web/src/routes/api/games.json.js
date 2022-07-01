import {mysql} from 'mysql'

const con = mysql.createConnection({
  host: "localhost:3000",
  user: "root",
  password: "admin"
});




export async function get() {
    const items = ["Bein","Arm","Kopf"]

    con.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
    });
    
    con.end()

    return {
      body: { items }
    };
  }