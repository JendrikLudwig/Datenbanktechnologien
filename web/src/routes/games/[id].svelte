<script context="module">
  export async function load({ params, fetch }) {
    const res = await fetch(`/api/game/${params.id}.json`);
    const data = await res.json();

    if (res.ok) {
      return {
        props: {
          data: data.data,
        },
      };
    }
  }
</script>

<script>
  import LoginProvider from "../../comp/providers/login_provider.svelte";
  import Box from "../../comp/box.svelte";

  import { browser } from "$app/env";

  //FSK import
  import FSK0 from "../../lib/fsk_img/fsk0.jpg"
  import FSK6 from "../../lib/fsk_img/fsk6.jpg"
  import FSK12 from "../../lib/fsk_img/fsk12.jpg"
  import FSK16 from "../../lib/fsk_img/fsk16.jpg"
  import FSK18 from "../../lib/fsk_img/fsk18.jpg"


  export let data;
  if (browser) console.log(data);

  function parseFeatures(ft) {
    const nB = ft.replaceAll("[", "").replaceAll("]", "");
    const nA = nB.replaceAll('"', "");
    return nA.split(",");
  }


  async function deleteButtonHandler() {
    if (confirm("Möchtest du das Spiel wirklich löschen?") == true) {
      const response = await fetch(
        `/api/game/${data.id}.json`, {
        method: "DELETE"
      })
        .then(res => res.json())
      
      if(response.success) window.location.href = "/games"
      else window.alert("Spiel konnte nicht gelöscht werden.")
    }
      
  }

</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

{#if browser}
  <LoginProvider let:user={user}>
    <div id="page_container">
      <Box user={user} back="/games">
        <button class="deletebutton" on:click={deleteButtonHandler}><i class="fa fa-trash"></i>Löschen</button>
      </Box>

      <div class="title">
        
        {#if data.fsk == 0}
          <img class="fsk" src={FSK0} alt="FSK 0"/>
        {:else if data.fsk == 6}
          <img class="fsk" src={FSK6} alt="FSK 0"/>
        {:else  if data.fsk == 12}
          <img class="fsk" src={FSK12} alt="FSK 0"/>
        {:else if data.fsk == 16}
          <img class="fsk" src={FSK16} alt="FSK 0"/>
        {:else if data.fsk == 18}
          <img class="fsk" src={FSK18} alt="FSK 0"/>
        {/if}

        <h3>{data.title}</h3>
      </div>
      <p>Genre:</p>
      <div class="data">{data.Genre}</div>
      <p>Developer:</p>
      <div class="data">{data.developer}</div>
      <p>Publisher:</p>
      <div class="data">{data.publisher}</div>
      <p>ReleaseDate:</p>
      <div class="data">
        Erschienen am: {new Date(data.releasedate).toLocaleDateString()}
      </div>
      <p>Description:</p>
      <div class="data">{@html data.description}</div>
      <p>Features:</p>
      <div class="data">
        {#each parseFeatures(data.features) as feature}
          <li>{feature}</li>
        {/each}
      </div>
      <p>Launcher:</p>
      <div class="data">
        <div id="launcher_container">
          {#each data.launcher as launcher}
            <a  href={launcher.Link} target="_blank"><div class="launcher_item">{launcher.name}</div></a>
          {/each}
        </div>
      </div>
    </div>
  </LoginProvider>
{/if}


<style>
  @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
  

  .fa {
    margin: 0 0.4rem 0 0;
  }

  .title {
    display: flex;
    color: white;
    font-family: "Montserrat", sans-serif;
    font-size: xx-large;
    font-weight: bold;
    justify-content: center;
    align-items: center;
    background-color: black;
    height: 4.5rem;
    width: fit-content;
    padding: 1rem 2rem;
    margin-top: 0px;
  }
  p {
    color: white;
    font-family: "Montserrat", sans-serif;
    font-weight: bold;
    font-size: 20px;
    margin-left: 4.5rem;
  }
  .data {
    color: white;
    font-family: "Montserrat", sans-serif;
    font-size: 20px;
    margin-left: 9rem;
  }
  #page_container {
    min-height: 100vh;
    padding: 0 0 3rem 0;
  }

  #launcher_container {
    display: flex;
    flex-direction: row;
    width: 100%;
    flex-wrap: wrap;
    max-width: 60rem;
  }

  a {
    text-decoration: none;
  }

  .launcher_item {
    font-family: "Montserrat", sans-serif;
    font-weight: bolder;
    text-decoration: none;
    margin: 1rem;
    background-color: black;
    padding: 0.5rem;
    color: white;
    transition-duration: 0.2s;
    border-radius: .5rem;
  }

  .launcher_item:hover {
    transform: scale(.95);
    color: rgba(255, 255, 255,0.75);
  }

  .launcher_item:active {
    transform: scale(.85);
  }

  .fsk {
    height: 3rem;
    border-radius: 0.2rem;
    margin-right: 1rem;
  }
  .deletebutton {
    font-family: "Montserrat", sans-serif;
    font-weight: bolder;
    background-color: #FF5F4D;
    border-radius: 0.5rem;
    border-color: transparent;
    color: white;
    cursor: pointer;
    height: 2.5rem;
    width: 7rem;
    margin: 0 0 0 1rem;
    transition-duration: 0.2s;
  }

  .deletebutton:hover {
    cursor: pointer;
    transform: scale(0.95);
  }

  .deletebutton:active {
    cursor: progress;
    transform: scale(0.90);
  }


  
</style>