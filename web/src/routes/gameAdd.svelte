<script>
  import LoginProvider from "../comp/providers/login_provider.svelte";
  import { browser } from "$app/env";

  import MultiSelect from 'svelte-multiselect'

  let selected_launcher = []

  //Fetched Data
  let genres = [];
  let features = [];
  let publisher = [];
  let devs = [];
  let launcher = [{id: 0, name:"Microsoft"},{id: 1, name:"Steam"},];


  //Input Data
  let input_name;
  let input_desc;
  let input_features;
  let input_genre;
  let input_fsk;
  let input_dev;
  let input_pub;
  let input_release;
  let input_launcher = [];

  
  function parseOption(arrObj) {
    const optArr = arrObj.map(elem => {
      return new Option(elem.name, elem.id)
    })

    return optArr
    
  }


  async function loadEnv() {
    const response = await fetch("./api/environment.json").then((res) => {
      return res.json();
    });

    genres = response.genre;
    features = response.features;
    publisher = response.publisher;
    devs = response.developer

  }



  if (browser) {
    loadEnv();
  }

  function handleClick() {
    const data = {
        input_name,
        input_desc,
        input_features,
        input_genre,
        input_fsk,
        input_dev,
        input_pub,
        input_release,
        launcher: getLauncherInputs()
    }


    console.log(data);
  }


  function getLauncherInputs() {

    const newStruct = input_launcher.map(x => {
      return {
        LauncherID: input_launcher.indexOf(x),
        url: x
      }
    })

     return newStruct.filter(x => selected_launcher.includes(String(x.LauncherID)))
  }


</script>

<LoginProvider>
  <div id="page_container">
    <div class="box" />

    <div class="title">
      <h3>Spiel hinzufügen</h3>
    </div>
    <form action="" method="">
      <p>Titel</p>
      <input type="text" name="title" size="30" maxlength="50" bind:value={input_name}/>
      <p>Description</p>
      <textarea name="description" rows="4" cols="50" bind:value={input_desc}/>
      
      <div id="features_container">
        <p>Features</p>
        <!-- Dokumentation: https://svelte-multiselect.netlify.app/ -->
        <MultiSelect bind:selectedValues={input_features} options={features} allowUserOptions={true}/> 
      </div>

      <div id="features_container">
        <p>Launcher</p>
        <!-- Dokumentation: https://svelte-multiselect.netlify.app/ -->

        <MultiSelect bind:selectedValues={selected_launcher} options={parseOption(launcher)}></MultiSelect>

        {#if selected_launcher.length != 0}

          Bitte gib den Link zur Launcherstore Seite an.

          {#each selected_launcher as la }
            <div id="launcher_url_input_element">
              <div class="label">{launcher[la].name}</div>
              <input bind:value={input_launcher[launcher[la].id]} placeholder="Link zum {launcher[la].name}-Launcher"/>
            </div>
          {/each}
          
        {/if}
        
      </div>
      <p>Genre</p>
      <select name="genre_select" bind:value={input_genre}>
          {#each genres as genre}
            <option value={genre.GenreID}>{genre.Name}</option>
          {/each}
      </select>

      
      <p>FSK</p>
      <select name="fsk_select" bind:value={input_fsk}>
        <option value="0"> 0 </option>
        <option value="6"> 6 </option>
        <option value="12"> 12 </option>
        <option value="16"> 16 </option>
        <option value="18"> 18 </option>
      </select>

      <div id="dev_pub_container">

        <div>

          <p>Developer</p>
          <select name="dev_select" bind:value={input_dev}>
            {#each devs as dev}
              <option value={dev.DeveloperID}>{dev.Name}</option>
            {/each}
          </select>

        </div>

        <div>
          <p>Publisher</p>
          <select name="publisher_select" bind:value={input_pub}>
            {#each publisher as pub}
              <option value={pub.PublisherID}>{pub.Name}</option>
            {/each}
          </select>
        </div>
        
      

      </div>

      
      <p>ReleaseDate</p>
      <input type="date" name="releasedate" bind:value={input_release} min="1900-01-01" max="2022-07-15"/>
          
      </form>
    <button class="add" on:click={handleClick}> ADD </button>
  </div>
</LoginProvider>

<style>
  @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
  
  #page_container {
    min-height: 120vh;
  }
  
  .box {
    color: black;
    background-color: #14ffa0;
    height: 4.5rem;
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
  input,
  textarea,
  select {
    font-family: "Montserrat", sans-serif;
    font-weight: bold;
    margin-left: 4.5rem;
  }
  label {
    font-family: "Montserrat", sans-serif;
    font-weight: bold;
    margin-left: 1rem;
    color: white;
  }
  button {
    border: 0;
    cursor: pointer;
    border-radius: 6px;
    padding: 8px 12px;
    font-weight: bold;
    box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.2);
  }
  .add {
    background: #14ffa0;
    color: white;
  }

  #features_container {
    width: 25rem;
    margin-left: 4.5rem;

  }

  #dev_pub_container {
    display: flex;
    flex-direction: row;
  }

  :global(div.multiselect > ul.options) {
    max-height: var(--sms-options-max-height, 30vh);
  }
</style>
