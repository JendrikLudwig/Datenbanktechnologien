<script>
    import {currentUser} from "../../stores/user.js"
    import { browser } from '$app/env';
    import { goto } from '$app/navigation';


    export let user;

    currentUser.subscribe(val => user = (data => {
        if(data) return JSON.parse(val)
        return data
    })(val));
    if(browser && (user == null)) goto("/login");


</script>

    {#if browser}
        <slot user={user}>

            <p>This page is empty</p>

        </slot>
    {/if}

    