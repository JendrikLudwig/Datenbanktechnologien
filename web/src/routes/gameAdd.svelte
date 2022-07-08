<script>
  import LoginProvider from "../comp/providers/login_provider.svelte";
  import { browser } from "$app/env";

  import MultiSelect from 'svelte-multiselect'

  const ui_libs = [`Svelte`, `React`, `Vue`, `Angular`, `...`]

  let selected_features = []

  let genres = [];
  let features = [];
  let publisher = [];
  let devs = [];


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
    alert("clicked");
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
      <input type="text" name="title" value="" size="30" maxlength="50" />
      <p>Genre</p>
      <select name="genre_select">
          {#each genres as genre}
            <option value={genre.GenreID}>{genre.Name}</option>
          {/each}
      </select>

      
      <p>FSK</p>
      <select name="fsk_select">
        <option value="0"> 0 </option>
        <option value="6"> 6 </option>
        <option value="12"> 12 </option>
        <option value="16"> 16 </option>
        <option value="18"> 18 </option>
      </select>

      <p>Developer</p>
      <select name="dev_select">
        {#each devs as dev}
          <option value={dev.DeveloperID}>{dev.Name}</option>
        {/each}
      </select>
      <p>Publisher</p>
      <select name="publisher_select">
        {#each publisher as pub}
          <option value={pub.PublisherID}>{pub.Name}</option>
        {/each}
      </select>
      <p>ReleaseDate</p>
      <input
        type="date"
        name="releasedate"
        value="2000-01-01"
        min="1900-01-01"
        max="2022-07-15"
      />
      <p>Description</p>
      <textarea name="description" rows="4" cols="50" />
      <p>Features</p>


      <!-- Dokumentation: https://svelte-multiselect.netlify.app/ -->

      <MultiSelect bind:selected_features options={features} allowUserOptions={true}/> 
      </form>
    <button class="add" on:click={handleClick}> ADD </button>
  </div>
</LoginProvider>

<style>
  @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
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
</style>
