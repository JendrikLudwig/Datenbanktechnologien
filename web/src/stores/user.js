import { writable } from 'svelte/store';
import { browser } from '$app/env';


export const currentUser = writable(
    (browser) ? localStorage.getItem("user") : ""
);



currentUser.subscribe(val => browser && localStorage.setItem("user", val));