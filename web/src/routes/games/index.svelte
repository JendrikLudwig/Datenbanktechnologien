<script>
  import LoginProvider from "../../comp/providers/login_provider.svelte";
  import GameCard from "../../comp/game/gamecard.svelte";

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

<LoginProvider>
  <div id="page_container">
    <div class="box">
      <button
        on:click={() => {
          window.location.href = "/";
        }}
      >
        Zurück
      </button>
    </div>
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
    height: 2rem;
    width: 25rem;
    margin: 1rem 0;
    padding: 0 0.5rem;

  }


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
    font-family: "Montserrat", sans-serif;
    font-weight: bolder;
    color: white;
    background-color: rgb(0, 0, 0);
    border-radius: 10%;
  }
  .box button:hover {
    cursor: pointer;
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
