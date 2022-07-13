<script>
    import { goto } from '$app/navigation';
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
        //PW Korrekt: ID, Profilepic und username in user store speichern
        assignUser(JSON.stringify(response.body))

        // -> ReRouting auf index.svelte
        goto("/")
        
    }




</script>
<style>

    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27%27'); 




    #page_container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100%;
        width: 100%;
        min-height: 100vh;
        background-color: rgb(55, 63, 67);
        font-family: 'Montserrat','sans-serif';
    }

    #login_form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 2rem;
        background-color: white;
        border-radius: 0.5rem;
        border: solid 1px rgba(0, 0, 0, 0.3);

    }

    #login_form input {
        height: 2rem;
        margin: 1rem 0;
        padding: 0 0.5rem;
        border: solid 1pt lightgrey;
        border-radius: 3pt;

    }


    .submit {
        height: 3rem;
        background-color: #08e1ae;
        background-image: linear-gradient(315deg, #08e1ae 0%, #98de5b 74%);
        color: white;
        font-size: 1rem;
        border: none;
        border-radius: 0.5rem;
        transition-duration: 0.2s;
        font-weight: 600;

    }

    

    .submit:hover {
        transform: scale(1.05)
    }

    .submit:active {
        transform: scale(0.95);
    }

    .error {
        color: red;
        height: 1rem;
    }
    
    h2 {
        margin: 0;
    }



</style>

<div id="page_container">
    <form id="login_form">
        <h2>Anmelden</h2>
        <p>Bitte melde dich mit deinen Nutzerdaten an.</p>
        <input type="text" placeholder="E-Mail" bind:value={mail}/>
        <input type="password" placeholder="Passwort" bind:value={password}>
        <p class="error">{error}</p>
        <button class="submit" on:click|preventDefault={signin}>Anmelden</button>
        
    </form>
</div>
