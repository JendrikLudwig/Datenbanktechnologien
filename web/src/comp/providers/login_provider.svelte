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
    export const signout = function(){
        currentUser.set("");
        window.location.href = "/login"

    }

</script>


<style>
       
    #app_container {
        /*CSS for every page goes here*/
        height: 100%;
        width: 100%;
        background-color: rgb(55, 63, 67);     

    }

    #load {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        height: 100%;
        width: 100%;
    }

</style>
    
    {#if browser}
        <div id="app_container">
            {#if !user}
                <div id="load">
                    <p>Lädt...</p>
                </div>
            {:else}

                <slot user={user}>
                    <p>This page is empty</p>
                </slot>   
            {/if}
        </div>  
    {/if}


    