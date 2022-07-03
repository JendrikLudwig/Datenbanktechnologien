<script>
  import LoginProvider from "../../comp/providers/login_provider.svelte";
  import GameCard from "../../comp/game/gamecard.svelte";

  import { browser } from '$app/env';


  let data = [];

  async function loadgames() {
    const response = await fetch("./api/game.json").then((res) => {
      return res.json();
    });

    data = response;
  }

 if (browser) loadgames() 

</script>
<LoginProvider>
    {#each data as game}
    <GameCard id={game.GameID}>
      {game.Title}
    </GameCard>
  {/each}
  
</LoginProvider>

