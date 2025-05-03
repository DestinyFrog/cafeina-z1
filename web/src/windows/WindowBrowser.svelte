<script lang="ts">
import { mount } from "svelte";
import Window from "../lib/Window.svelte"
import type { ElementPayload } from "../models/Element";
import Element from "../models/Element"
import type { MoleculaPayload } from "../models/Molecula";
import SearchObject from "../models/SearchObject"
import WindowElement from "./WindowElement.svelte";
import Molecula from "../models/Molecula";
import WindowMolecula from "./WindowMolecula.svelte";

let term: string = $state("")

let l_elements: ElementPayload[] = $state([])
let l_moleculas: MoleculaPayload[] = $state([])

const target = document.getElementById("app")!

let running_state: number|null = null

function change() {
    if (!running_state)
        running_state = setTimeout(() => search(), 400)
}

function search() {
    if (term == "") {
        clear()
        running_state = null
        return
    }

    SearchObject.search(term)
        .then(({elements, moleculas}) => {
            l_elements = elements
            l_moleculas = moleculas
        })
        .catch(console.error)
        .finally(() => running_state = null)
}

function clear() {
    l_elements = []
    l_moleculas = []
}

function open_element(elementPayload:ElementPayload) {
    const element = new Element(elementPayload)
    mount(WindowElement, { target, props: { element } })
}

function open_molecula(moleculaPayload:MoleculaPayload) {
    const molecula = new Molecula(moleculaPayload)
    mount(WindowMolecula, { target, props: { molecula }})
}
</script>

<Window title="Navegador">
    <div>
        <input class="input" type="text"
            onkeydown={change} bind:value={term}/>

        <ul class="recomendation-list">
           {#each l_elements as element}
            <li class="recomendation">
                <button onclick={() => open_element(element)}>
                    {element.oficial_name}
                </button>
            </li>
           {/each}

           {#each l_moleculas as molecula}
            <li class="recomendation">
                <button onclick={() => open_molecula(molecula)}>
                    {molecula.name}
                </button>
            </li>
            {/each}
        </ul>
    </div>
</Window>

<style>
.input {
    outline: none;
    border: 0;
    margin-bottom: 4px;
    background-color: #00000055;
    padding: 4px;
    border-radius: 5px;
}

.recomendation-list {
    list-style: none;
    max-height: 200px;
    overflow-y: scroll;
}

.recomendation button {
    border: 0;
    background-color: transparent;
    width: 100%;
    text-align: left;
    padding: 4px 2px;
}

.recomendation:hover {
    background-color: #ffff0022;
}
</style>