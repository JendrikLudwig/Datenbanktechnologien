<script>
  import LoginProvider from "../comp/providers/login_provider.svelte";
  import Box from "../comp/box.svelte"

  let signout; //Signout Function
  let user = {};


</script>

<LoginProvider bind:user bind:signout>
  <div id="page_container">
    <Box user={user}>
      <button class="sign_out_button" on:click={signout}><i class="fa fa-sign-out" aria-hidden="true"></i>Abmelden</button>
    </Box>
    
    <div class="title">
      <h1>Willkommen bei GameBase!</h1>
    </div>
      
    <button class="goto_games_button" on:click={() => {window.location.href = "/games"}}>Zu den Spielen</button>
  
    <div class="footer">
      <p class="description">a project by</p>
      <p class="descriptionnames">
        Jendrik Ludwig, Johannes Jäger & Tristan Grobasch
      </p>
    </div>
  </div>
</LoginProvider>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  #page_container {
    min-height: 100vh;
    margin: auto;
    text-align: center;
  }

  .title {
    margin-top: 10rem;
    color: white;
    font-family: "Montserrat", sans-serif;
    font-size: xx-large;
    font-weight: bold;
  }


  p {
    color: white;
    font-family: "Montserrat", sans-serif;
    font-size: 20px;
  }

  .sign_out_button {
    font-family: "Montserrat", sans-serif;
    font-weight: bolder;
    color: white;
    background-color: #FF5F4D;
    border-radius: .5rem;
    height: 2.5rem;
    padding: 0 1.5rem;
    border: none;
    transition-duration: 0.2s;
  } 


  .goto_games_button {
    font-family: "Montserrat", sans-serif;
    font-weight: bolder;
    color: black;
    width: 30rem;
    background-color: #14FFA0;
    border-radius: .5rem;
    height: 2.5rem;
    padding: 0 1.5rem;
    border: none;
    transition-duration: 0.2s;
    margin: 5rem 0 0 0;
  }

  .sign_out_button:hover, .goto_games_button:hover {
    cursor: pointer;
    transform: scale(0.95);
  }

  .sign_out_button:active, .goto_games_button:active {
    cursor: progress;
    transform: scale(0.90);
  }

  .fa {
    margin: 0 0.4rem 0 0;
  }

  .footer {
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    color: white;
    text-align: center;
  }
  .description {
    font-size: 10px;
    margin: 0;
  }
  .descriptionnames {
    margin-top: 1;
    font-size: 12px;
    font-weight: bold;
  }
</style>
