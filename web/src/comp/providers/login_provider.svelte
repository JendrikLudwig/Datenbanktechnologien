<script>
    import {currentUser} from "../../stores/user.js"
    import { browser } from '$app/env';
    import { goto } from '$app/navigation';


    export let user;

    currentUser.subscribe(val => user = (data => {
        if(data) return JSON.parse(val)
        return data
    })(val));
    if(browser && (user == null || user == "")) goto("/login");



    //User Abmelden
    export const signout = function signout(){
      window.location.href = "/login"
      currentUser.set("");
    }

</script>


<style>
    #app_container {
        /*CSS for every page goes here*/
        height: 100%;
        width: 100%;
    }

</style>


    {#if browser}
        <div id = "app_container">
            <slot user={user}>

                <p>This page is empty</p>

            </slot>

        </div>
    {/if}

    