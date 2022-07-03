<script>
  export let id;
</script>

<div class="gamecard">
  <a href="´games/${id}´">
    <slot />
    <h4>Klicke hier für mehr Infos</h4>
  </a>
</div>

<style>
  @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
  .gamecard {
    background: rgb(20, 255, 160);
    padding: 20px;
    border-radius: 6px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    margin-top: 2%;
    margin-left: 30%;
    margin-right: 30%;
    text-align: center;
    font-family: "Montserrat", sans-serif;
    font-size: xx-large;
    font-weight: bold;
  }
  h4 {
    font-weight: lighter;
    font-size: small;
    margin-bottom: 1%;
  }
  .gamecard:hover {
    background: rgb(113, 254, 197);
    transform: scale(1.05);
    transition-duration: 0.2s;
    cursor: pointer;
  }
  a,
  a:hover,
  a:visited,
  a:active {
    color: inherit;
    text-decoration: none;
  }
</style>
