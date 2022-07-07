<script>
  import LoginProvider from "../comp/providers/login_provider.svelte";
</script>

<LoginProvider>
  <div id="page_container">
    <div class="box" />

    <div class="title">
      <h3>Spiel hinzufügen</h3>
    </div>
    <form action="" method="">
      <p>Titel</p>
      <input type="text" name="title" value="" size="30" maxlength="50" />
      <p>Genre</p>
      <select genre>
        <option value="Action"> Action </option>
        <option value="Beat em up"> Beat 'em up </option>
        <option value="Shooter"> Shooter </option>
        <option value="Geschicklichkeit"> Geschicklichkeit </option>
        <option value="Jump n Run"> Jump 'n' Run </option>
        <option value="Open World"> Open World </option>
        <option value="Musik"> Musik </option>
        <option value="Tanz"> Tanz </option>
        <option value="RPG"> RPG </option>
        <option value="Simulation"> Simulation </option>
        <option value="Sport"> Sport </option>
        <option value="Strategie"> Strategie </option>
        <option value="Rennspiel"> Rennspiel </option>
        <option value="Survival"> Survival </option>
        <option value="Open-World-Survival"> Open-World-Survival </option>
        <option value="Multiplayer Online Battle Arena">
          Multiplayer Online Battle Arena
        </option>
      </select>
      <p>FSK</p>
      <select fsk>
        <option value="0"> 0 </option>
        <option value="6"> 6 </option>
        <option value="12"> 12 </option>
        <option value="16"> 16 </option>
        <option value="18"> 18 </option>
      </select>
      <p>Developer</p>
      <input type="text" name="developer" value="" size="30" maxlength="50" />
      <p>Publisher</p>
      <input type="text" name="publisher" value="" size="30" maxlength="50" />
      <p>ReleaseDate</p>
      <input
        type="date"
        name="releasedate"
        value="2000-01-01"
        min="1900-01-01"
        max="2022-07-15"
      />
      <p>Description</p>
      <textarea name="description" rows="4" cols="50" />
      <p>Features</p>
      <input type="checkbox" name="features" value="Einzelspieler" /><label
        for="features"
      >
        Einzelspieler
      </label>
      <br />
      <input type="checkbox" name="features" value="Mehrspieler" /><label
        for="features"
      >
        Mehrspieler
      </label><br />
      <input type="checkbox" name="features" value="MMO" /><label
        for="features"
      >
        MMO
      </label><br />
      <input type="checkbox" name="features" value="Hardcore Mechanics" /><label
        for="features"
      >
        Hardcore Mechanics
      </label><br />
      <input
        type="checkbox"
        name="features"
        value="Explore and Discover"
      /><label for="features"> Explore and Discover </label><br />
      <input type="checkbox" name="features" value="Online-PvP" /><label
        for="features"
      >
        Online-PvP
      </label>
      <br />
      <input type="checkbox" name="features" value="LAN-PvP" /><label
        for="features"
      >
        LAN-PvP
      </label><br />
      <input type="checkbox" name="features" value="PvE" /><label
        for="features"
      >
        PvE
      </label><br />
      <input type="checkbox" name="features" value="Splitscreen" /><label
        for="features"
      >
        Splitscreen
      </label>
      <br />
      <input type="checkbox" name="features" value="Blood and Gore" /><label
        for="features"
      >
        Blood and Gore
      </label><br />
      <input type="checkbox" name="features" value="Free to Play" /><label
        for="features"
      >
        Free to Play
      </label><br />
      <input type="checkbox" name="features" value="FPS" /><label
        for="features"
      >
        FPS
      </label><br />
      <input type="checkbox" name="features" value="Co-Op" /><label
        for="features"
      >
        Co-Op
      </label><br />
      <input type="checkbox" name="features" value="Versus" /><label
        for="features"
      >
        Versus
      </label><br />
      <input type="checkbox" name="features" value="Tracking" /><label
        for="features"
      >
        Tracking
      </label><br />
    </form>
  </div>
</LoginProvider>

<style>
  @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
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
  input,
  textarea,
  select {
    font-family: "Montserrat", sans-serif;
    font-weight: bold;
    margin-left: 4.5rem;
  }
  label {
    font-family: "Montserrat", sans-serif;
    font-weight: bold;
    margin-left: 1rem;
    color: white;
  }
</style>
