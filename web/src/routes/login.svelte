<script>
    import { currentUser } from '../stores/user.js';

    // User Store 
    let signedUser;

    currentUser.subscribe(user => {
        signedUser = user
    });

    function assignUser(data) {
        currentUser.update(() => data)
        
    }


    // Variabeln 
    let mail = ""
    let password = ""
    let error =""




    async function signin() {

        const data = {
            "mail": mail,
            "password": password
        }

        //fetch
        //Antwort abwarten

        const response = await fetch('api/login.json', {
            method: 'POST',
            body: JSON.stringify(data),
        })

        .then(async res => {
            if (res.ok) {
                return {
                    ok: true,
                    body: await res.json()
                }
                
            }
            return {
                    ok: false,
                    body: await res.json()
                }

        })

        //ergebnis überprüfen

        if (!response.ok) {
            //Fehler anzeigen
            error = response.body.error
            return false;
        }

        assignUser(JSON.stringify(response.body))

        



    

        

 

        //PW Korrekt: ID, Profilepic und username in user store speichern
        // -> ReRouting auf index.svelte

        

        
        
        
        
        
    }




</script>
<style></style>

<form>
    <input type="text" placeholder="E-Mail" bind:value={mail}/>
    <input type="password" placeholder="Passwort" bind:value={password}>
    <button on:click|preventDefault={signin}>Anmelden</button>
    <p>{error}</p>
</form>