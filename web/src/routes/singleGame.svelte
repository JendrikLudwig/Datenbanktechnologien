<script>
  import LoginProvider from "../comp/providers/login_provider.svelte";
const data = 
{
  "title": "ARK: Survival Evolved",
  "Genre": "Open-World-Survival",
  "fsk": "16",
  "developer": "Studio Wildcard",
  "publisher": "Studio Wildcard",
  "releasedate": "2017-08-26T22:00:00.000Z",
  "description": "Als ein nackte/r Mann/Frau frierend und hungrig auf einer mysteriösen Insel gestrandet, musst du jagen, sammeln, Gegenstände fertigen, Früchte anpflanzen und einen Unterschlupf bauen, um zu überleben. Benutze Geschick und List, um auf ARK lebende Dinosaurier und urzeitliche Lebewesen zu töten, auszubrüten und zu reiten und verbünde dich mit Hunderten von Spielern oder spiele lokal!",
  "features": "[\"Einzelspieler\", \"Mehrspieler\", \"MMO\", \"Hardcore Mechanics\", \"Explore and Discover\"]",
  "launcher": [
    {
      "name": "Epic Games Store",
      "Link": "https://store.epicgames.com/de/p/ark"
    },
    {
      "name": "Steam",
      "Link": "https://store.steampowered.com/app/346110/ARK_Survival_Evolved/"
    }
  ]
}

  //Launcher (vlt sogar als Link zu den passenden Seiten)

</script>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27');
  .box {
    color: black;
    background-color: rgb(20, 255, 160);
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
  .data {
    color: white;
    font-family: "Montserrat", sans-serif;
    font-size: 20px;
    margin-left: 9rem;
  }
#page_container{
  height: 100vh;
}

</style>

<LoginProvider>
  <div id="page_container">
    
    <div class="box">
    </div>

    <div class="title">
      <h3>{data.title}</h3>
    </div>
    <p>Genre:</p>
    <div class= "data">{data.Genre}</div>
    <p>FSK:</p>
    <div class= "data">{data.fsk}</div>
    <p>Developer:</p>
    <div class= "data">{data.developer}</div>
    <p>Publisher:</p>
    <div class= "data">{data.publisher}</div>
    <p>Releasedate:</p>
    <div class= "data">{data.releasedate}</div>
    <p>Description:</p>
    <div class= "data">{data.description}</div>
    <p>Features:</p>
    <div class= "data">{data.features}</div>
    <p>Launcher:</p>
    <div class= "data">{data.launcher}</div>
  </div>
</LoginProvider>



