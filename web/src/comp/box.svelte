<script>

  export let user;
  export let back;


</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

@import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap%27");
  .box {
    display: flex;
    padding: 1rem 2rem;
    color: black;
    background-color: rgb(20, 255, 160);
    height: 2.5rem;
    width: calc(100% - 4rem);
    justify-content: space-between;
    align-items: center;
    font-family: "Montserrat";
  }

  .fa {
    margin: 0 .4rem 0 0;
  }

  .back_button {
    font-family: "Montserrat", sans-serif;
    font-weight: bolder;
    text-align: center;
    align-self: center;
    color: white;
    background-color: rgb(0, 0, 0);
    border-radius: .5rem;
    height: 2.5rem;
    padding: 0 1.5rem;
    border: none;
    transition-duration: 0.2s;
  } 
  .back_button:hover {
    cursor: pointer;
    transform: scale(0.95);
  }

  .back_button:active {
    cursor: progress;
    transform: scale(0.90);
  }

  #user {
    display: flex;
    flex-direction: row;
    align-items: center;
    background-color: black;
    padding: 0 1rem;
    border-radius: 0.5rem;
    color: white;
  }

  #user img {
    height: 2rem;
    border-radius: 100%;
  }

  #user p {
    margin-right: 1rem;
  }


</style>


<div class="box">
  <div id="buttons">
    {#if back}
      <button class="back_button"
      on:click={() => {
        window.location.href = back;
      }} ><i class="fa fa-arrow-left" aria-hidden="true"></i>Zurück</button>

    {/if}
    <slot></slot>
  </div>
  <div id="user">
    <p class="username"> {user.username} </p>
    <img src={user.pic} alt=""/>
  </div>
</div>