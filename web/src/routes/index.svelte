<script>
    import LoginProvider from "../comp/providers/login_provider.svelte"


</script>

<LoginProvider let:user={user}>
    <h1>Wilkommen auf der Seite</h1>

    <p>{user.username}</p>

</LoginProvider>