<script>

    let data;

    async function load() {
        data = await fetch("./api/games.json")
            .then(x => {return x.json()})
        console.log(data); 
    }

</script>
<style></style>



<h1>Wilkommen in unserem Projek</h1>
<button on:click={load}>Daten Laden</button>
<div>
    {JSON.stringify(data)}
</div>