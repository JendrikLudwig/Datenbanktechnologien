<script>
    import LoginProvider from "../comp/providers/login_provider.svelte";

    let user = {}

</script>


<LoginProvider bind:user={user}>

    <h1>Hallo</h1>
    <p>{user.username}</p>
    <img src={user.pic} alt=""/>
    
</LoginProvider>
