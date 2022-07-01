<script>

    let data;

    async function load() {
        data = await fetch("https://api.chucknorris.io/jokes/random").then(x => {return x.json()})//.then(x => {return JSON.stringify(x)}) 
        console.log(data); 
    }

</script>
<style></style>



<h1>Wilkommen in unserem Projek</h1>
<button on:click={load}>Daten Laden</button>
<div>
    {data?.value}
</div>