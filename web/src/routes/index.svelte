<script>
    import LoginProvider from "../comp/providers/login_provider.svelte"

    let user = {};

    function test(text) {
        console.log(text, user);
    }


    

</script>

<LoginProvider bind:user={user} let:signout={signout}>

    <h1>Wilkommen auf der Seite</h1>
    <p>{user.username}</p>
    <button on:click={() => test("UserData:")}>User access</button>

    <button on:click={() => signout()}> Abmelden </button>

</LoginProvider>