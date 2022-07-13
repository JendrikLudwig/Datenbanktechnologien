<script>
  import LoginProvider from "../../comp/providers/login_provider.svelte";
  import GameCard from "../../comp/game/gamecard.svelte";
  import Box from "../../comp/box.svelte";

  import { browser } from "$app/env";

  let data = [];
  let displaydata = [];
  let input;

  async function loadgames() {
    const response = await fetch("./api/game.json").then((res) => {
      return res.json();
    });

    data = response;
    displaydata = response;
  }

  function search() {
    displaydata = data.filter((x) =>
      x.Title.toLowerCase().includes(input.toLowerCase())
    );
  }

  if (browser) {
    loadgames();
  }
</script>

<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
/>

<LoginProvider let:user={user}>
  <div id="page_container">
    <Box user={user} back="/">
      <button class="add_game_button" on:click={() =>{window.location.href = "/add"}}><i class="fa fa-plus" />Spiel hinzufügen</button>
    </Box>
    <p>Suche nach Spielen</p>
    <input
      type="text"
      class="searchfield"
      placeholder="Suche nach Spielen..."
      bind:value={input}
      on:input={search}
    />
    {#each displaydata as game}
      <GameCard id={game.GameID}>
        {game.Title}
      </GameCard>
    {/each}
    {#if displaydata.length == 0}
      <p class="empty">Leider ergab deine Suchanfrage kein Spiel!</p>
    {/if}
  </div>
</LoginProvider>

<style>
  #page_container {
    min-height: 100vh;
    margin: auto;
    text-align: center;
    padding-bottom: 5rem;
  }
  .searchfield {
    font-family: "Montserrat", sans-serif;
    height: 2rem;
    width: 25rem;
    margin: 1rem 0;
    padding: 0 0.5rem;
    border: solid 1pt lightgrey;
    border-radius: 3pt;
  }

  .add_game_button {
    font-family: "Montserrat", sans-serif;
    font-weight: bolder;
    color: white;
    background-color: #008FA1;
    border-radius: .5rem;
    height: 2.5rem;
    padding: 0 1.5rem;
    border: none;
    transition-duration: 0.2s;
    margin: 0 0 0 1rem;
  } 
  .add_game_button:hover {
    cursor: pointer;
    transform: scale(0.95);
  }

  .add_game_button:active {
    cursor: progress;
    transform: scale(0.90);
  }

  .fa { 
    margin: 0 0.4rem 0 0;
  }

  p {
    color: white;
    font-family: "Montserrat", sans-serif;
    font-weight: bold;
    font-size: 40px;
  }
  .empty {
    font-size: 20px;
    color: rgb(245, 118, 14);
  }
</style>
