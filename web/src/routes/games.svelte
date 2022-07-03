<script>
    import LoginProvider from "../comp/providers/login_provider.svelte"
    import GameCard from "../comp/game/gamecard.svelte"


    let data = [];


    async function loadgames() {
        const response = await fetch("/api/game.json")
        .then(res => {return res.json()})
        
        data = response
    }

</script>
<style>


</style>


<LoginProvider>
    <button on:click={loadgames}>Senden</button>

    {#each data as game}
        <GameCard>{game.Title}</GameCard>

    {/each}

</LoginProvider>



