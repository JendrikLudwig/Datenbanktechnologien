<script>
  import LoginProvider from "../../comp/providers/login_provider.svelte";
  import GameCard from "../../comp/game/gamecard.svelte";

  import { browser } from '$app/env';


  let data = [];
  let displaydata = []
  let input;

  async function loadgames() {
    const response = await fetch("./api/game.json").then((res) => {
      return res.json();
    });

    data = response;
    displaydata = response
  }



  function search() {
    displaydata = data.filter(x => (x.Title).toLowerCase().includes(input.toLowerCase()))
  }

  if (browser) {
    loadgames()
  } 

</script>

<style>

  #page_container {
    min-height: 100vh;


  }



</style>


<LoginProvider>
 <div id='page_container'>

  <input type="text" bind:value={input} on:input={search}/>
  {#each displaydata as game}
    <GameCard id={game.GameID}>
      {game.Title}
    </GameCard>
    
  {/each}
  {#if displaydata.length == 0}
     <p>Empty State</p>
  {/if}

 </div>
  
</LoginProvider>

