<script>

    let data = [];
    
    async function load() {
        const response = await fetch("/api/test.json")
            .then(x => {return x.json()})
        data = response;
    }

    let länge
    $: länge = data.length 
        
</script>


<h1>Hallo Grobiiii</h1>
<button on:click={load}>Hol Daten</button>

{#each data as game }
<p>{game.Title}</p>
    
{/each}
    

