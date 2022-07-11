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
  let launcher = []

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

  //Error
  let error = ""

  
  function parseOption(arrObj) {
    const optArr = arrObj.map(elem => {
      return new Option(elem.Name, elem.LauncherID - 1)
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
    launcher = response.launcher

  }



  if (browser) {
    loadEnv();
  }

  function handleClick() {

    validateInputs()

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

     return newStruct.filter(x => selected_launcher.includes(String(x.LauncherID -1)))
  }


  function validateInputs() {
    let errorArr = []
    
    if(!input_name) errorArr.push("Name fehlt")
    if(!input_desc) errorArr.push("Beschreibung fehlt")
    if(input_features.length == 0) errorArr.push("Ein Feature muss angegeben werden")

    if (selected_launcher.length == 0) {
      errorArr.push("Ein Launcher muss ausgewählt werden")
    } else if(input_launcher.filter(x => x =! null).length !=  selected_launcher.length) {
      console.log(input_launcher.filter(x => x =! null).length, selected_launcher.length);
      errorArr.push("Mindestens ein Launcherlink fehlt")
    } else if(getLauncherInputs().filter(el => el.url.length == 0).length != 0) {
      console.log(getLauncherInputs().filter(el => el.url.length == 0).length != 0);
      errorArr.push("Mindestens ein Launcherlink fehlt")
    }



    //Launcher check
    if(!input_genre) errorArr.push("Genre fehlt")
    if(!input_fsk) errorArr.push("FSK Zertifizierung fehlt")
    if(!input_dev) errorArr.push("Ein Entwickler muss angegeben werden")
    if(!input_pub) errorArr.push("Publisher fehlt")
    if(!input_release) errorArr.push("Releasedate fehlt")


    


    error = errorArr.join(", ")
    if(errorArr.length == 0) return true
    return false
    
  }


</script>

<LoginProvider>
  <div id="page_container">
    <div class="box" />

    <form id="add_form">
      <h2>Spiel hinzufügen</h2>
      <p>Bitte gib alle relevanten Daten an.</p>
      <hr>
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
              <div class="launcher_label">{launcher[la].Name}</div>
              <input bind:value={input_launcher[launcher[la].LauncherID]} placeholder="Link zum {launcher[la].Name}-Launcher"/>
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
      
      <p class="error">{error}</p>     
      
      <button class="submit" on:click|preventDefault={handleClick}>Spiel hinzufügen</button>
          
    </form>
  </div>
</LoginProvider>

<style>
  @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
  
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

  p {
    margin: 1rem 0 0 0;
  }

  
  .box {
    display: flex;
    color: black;
    background-color: #14ffa0;
    height: 4.5rem;
    width: 100%;
  }



  input,
  textarea,
  select {
    font-family: "Montserrat", sans-serif;

  }

  button {
    border: 0;
    cursor: pointer;
    border-radius: 6px;
    padding: 8px 12px;
    font-weight: bold;
    box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.2);
  }

  #features_container {
    width: 100%;

  }

  #dev_pub_container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    width: 100%;
  }

  #dev_pub_container div {
    display: flex;
    flex-direction: column;
    width: calc(50% - 1rem);
  }

  :global(div.multiselect > ul.options) {
    max-height: var(--sms-options-max-height, 30vh);
  }

  :global(div.multiselect) {
    width: 100%;
  }


  #add_form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 2rem;
    background-color: white;
    border-radius: 0.5rem;
    margin: 2rem;
    width: 50rem;

  }

  #add_form input, #add_form select {
      height: 2rem;
      margin: 1rem 0;
      padding: 0 0.5rem;
      border: solid 1pt lightgrey;
      border-radius: 3pt;
  }

  #add_form textarea {
      height: 5rem;
      margin: 1rem 0;
      padding: 0.5rem;
      resize: vertical;
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
      min-height: 1rem;
      margin: 0 0 2rem 0;
  }
  
  h2 {
      margin: 0;
  }

  #launcher_url_input_element {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    margin: 1rem 0;
  }

  #launcher_url_input_element input {
    width: 70%;
    margin: 0;
  }

  .launcher_label {
    background-color: black;
    color: white;
    padding: 0.5rem;
    border-radius: 3pt;
  }




</style>
