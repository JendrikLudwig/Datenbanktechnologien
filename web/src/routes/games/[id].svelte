<script context="module">
  export async function load({params, fetch}) {
      const res = await fetch(`/api/game/${params.id}.json`)
      const data = await res.json()

      if (res.ok) {
          return {
              props: {
                  data: data.data
              }
          }
      }
      
  }

</script>


<script>
  import LoginProvider from "../../comp/providers/login_provider.svelte";
  import { browser } from '$app/env';


  export let data;
  if(browser) console.log(data);

  function parseFeatures(ft){
    const nB = ft.replaceAll("[","").replaceAll("]","");
    const nA = nB.replaceAll('"',"");
    return nA.split(",")
  }


</script>



<style>
  @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
  .box {
    display: flex;
    padding: 1rem;
    color: black;
    background-color: rgb(20, 255, 160);
    height: 2.5rem;
    width: calc(100% - 2rem);
    justify-content: flex-end;
  }

  .box button {
    /* Euer CSS Für den Zurückknopf kommt hier hin :) */  
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

  .launcher_item {
    margin: 1rem;
    background-color: aqua;
  }
</style>


{#if browser}

  <LoginProvider>
    <div id="page_container">
      <div class="box">
        <button on:click={() => {window.location.href = "/games"}}> Zurück </button>
      </div>

      <div class="title">
        <h3>{data.title}</h3>
      </div>
      <p>Genre:</p>
      <div class="data">{data.Genre}</div>
      <p>FSK:</p>
      <div class="data">FSK {data.fsk}</div>
      <p>Developer:</p>
      <div class="data">{data.developer}</div>
      <p>Publisher:</p>
      <div class="data">{data.publisher}</div>
      <p>ReleaseDate:</p>
      <div class="data">Erschienen am: {new Date(data.releasedate).toLocaleDateString()}</div>
      <p>Description:</p>
      <div class="data">{data.description}</div>
      <p>Features:</p>
      <div class="data">

        {#each parseFeatures(data.features) as feature}

          <li>{feature}</li>
          
        {/each}


      </div>
      <p>Launcher:</p>
      <div class="data">
        
        {#each data.launcher as launcher}
          <a class="launcher_item" href="{launcher.Link}">{launcher.name} </a>
        {/each}

      </div>
    </div>
  </LoginProvider>

{/if}