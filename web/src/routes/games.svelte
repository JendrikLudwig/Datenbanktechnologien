<script>
  import LoginProvider from "../comp/providers/login_provider.svelte";
  import GameCard from "../comp/game/gamecard.svelte";

  let data = [];

  async function loadgames() {
    const response = await fetch("/api/game.json").then((res) => {
      return res.json();
    });

    data = response;
  }
</script>

<LoginProvider>
  <button on:click={loadgames}>Senden</button>

  {#each data as game}
    <GameCard id={game.GameID}>
      {game.Title}
    </GameCard>
  {/each}
</LoginProvider>

<style>
</style>
