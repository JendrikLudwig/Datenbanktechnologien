<script>
  import LoginProvider from "../comp/providers/login_provider.svelte";

  let signout; //Signout Function
  let user = {};

  function test(text) {
    console.log(text, user);
  }
</script>

<LoginProvider bind:user bind:signout>
  <div id="page_container">
    <div class="box" />
    <div class="title">
      <h1>Willkommen bei DBT!</h1>
    </div>
    <p>Angemeldeter User:</p>
    <p class="username">--- {user.username} ---</p>
    <button class="gamebutton" on:click={() => test("UserData:")}
      >Zu den Spielen</button
    >
    <button class="signoutbutton" on:click={signout}> Abmelden </button>
    <div class="footer">
      <p class="description">a project by</p>
      <p class="descriptionnames">
        Jendrik Ludwig, Johannes Jäger & Tristan Grobasch
      </p>
    </div>
  </div>
</LoginProvider>

<style>
  #page_container {
    min-height: 100vh;
    margin: auto;
    text-align: center;
  }
  .title {
    margin-top: 10rem;
    color: white;
    font-family: "Montserrat", sans-serif;
    font-size: xx-large;
    font-weight: bold;
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
  p {
    color: white;
    font-family: "Montserrat", sans-serif;
    font-size: 20px;
  }
  .username {
    font-weight: bold;
  }
  .gamebutton {
    font-family: "Montserrat", sans-serif;
    font-size: medium;
    font-weight: bold;
    background-color: rgb(36, 153, 106);
    color: white;
    border-color: transparent;
    margin: 1rem;
    transition-duration: 0.3s;
    padding: 0.2rem 1rem 0.2rem 1rem;
    border-radius: 3rem;
  }
  .signoutbutton {
    font-family: "Montserrat", sans-serif;
    font-size: medium;
    background-color: rgb(223, 104, 25);
    color: white;
    border-color: transparent;
    margin: 1rem;
    transition-duration: 0.3s;
    padding: 0.2rem 1rem 0.2rem 1rem;
    border-radius: 3rem;
  }
  button:hover {
    box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
      0 17px 50px 0 rgba(0, 0, 0, 0.19);
    cursor: pointer;
  }
  .footer {
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    color: white;
    text-align: center;
  }
  .description {
    font-size: 10px;
    margin: 0;
  }
  .descriptionnames {
    margin-top: 1;
    font-size: 12px;
    font-weight: bold;
  }
</style>
