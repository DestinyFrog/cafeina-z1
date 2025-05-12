<script lang="ts">
    import { mount, onMount } from "svelte"
    import Window from "../lib/Window.svelte"
    import Element, { type PeriodicTableFormats } from "../models/Element"
    import WindowElement from "./WindowElement.svelte"
    import { target } from "../config"

    let elements: Element[] = []

    let mode: PeriodicTableFormats = "normal"

    function onclick(element: Element) {
        mount(WindowElement, { target, props: { element } })
    }

    onMount(() => {
        Element.get_many()
            .then((data) => (elements = data))
            .catch((err) => console.error(err))
    })
</script>

<Window title="Tabela Periódica" mixer={true}>
    <ul class="periodic-table">
        {#each elements as element}
            <li
                style="
                grid-column-start: {element.get_position(mode).x};
                grid-row-start: {element.get_position(mode).y};
                background-color: {element.category_color};"
            >
                <button onclick={() => onclick(element)}>
                    {element.symbol}
                </button>
            </li>
        {/each}
    </ul>

    <div slot="footer" class="menu">
        <button onclick={() => (mode = "normal")}>Normal</button>
        <button onclick={() => (mode = "extended")}>Extendida</button>
    </div>
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
    }

    .periodic-table li button {
        background-color: transparent;
        color: white;
        border: 0;
    }

    .menu button {
        border: 2px solid black;
        padding: 2px;
        border-radius: 4px;
        color: aliceblue;
    }

    .menu button:nth-child(1) {
        background-color: green;
    }

    .menu button:nth-child(2) {
        background-color: tomato;
    }
</style>
