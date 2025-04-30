<script lang="ts">
import { mount, onMount } from "svelte";
import Window from "../lib/Window.svelte";
import Element from "../models/Element";
import WindowElement from "./WindowElement.svelte";

let elements: Element[] = []

function onclick(element:Element) {
    mount( WindowElement, {
        target: document.getElementById('app')!,
        props: { element }
    } )
}

onMount(() => {
    Element.get_many()
        .then(data => elements = data)
        .catch(err => console.error(err))
})
</script>

<Window title="Tabela Periódica" >
    <ul class="periodic-table">
        {#each elements as element}
            <!-- svelte-ignore a11y_click_events_have_key_events -->
            <!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
            <li style="
                grid-column-start: {element.xpos};
                grid-row-start: {element.ypos};
                background-color: {element.category_color};"
                onclick={() => onclick(element)}
                >{ element.symbol }</li>
        {/each}
    </ul>
</Window>

<style>
.periodic-table {
    list-style: none;
    display: grid;
    gap: 1px;
}

.periodic-table li {
    width: 26px;
    aspect-ratio: 1/1;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}
</style>
