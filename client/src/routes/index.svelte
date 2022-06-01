<script lang="ts">
    import { onMount } from 'svelte';

    onMount(() => {
        let exampleSocket = new WebSocket('ws://localhost:8080/list');
        exampleSocket.addEventListener('open', (e) => {
            exampleSocket.send(Uint8Array.from([4, 2]));
        });

        exampleSocket.addEventListener('message', (e) => {
            console.log(e.data);
        });

        return () => exampleSocket.close();
    });
</script>

<h1>Welcome to SvelteKit</h1>
<p>
    Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation
</p>
