<script lang="ts">
import { capitalize } from "../lib/util"
import Window from "../lib/Window.svelte"
import type Element from "../models/Element"

let { element }: { element: Element } = $props()
</script>

<Window title={capitalize(element.oficial_name)} background_color={element.category_color}>
    <div class="container">
        <div class="main-content">
            <p class="atomic-number">{element.atomic_number}</p>
            <p class="symbol">{element.symbol}</p>
            <p class="name">{element.oficial_name}</p>
            <p class="atomic-mass">{element.atomic_mass}</p>
        </div>

        <ul class="layer">
            {#each element.layers as layer}
                <li>{ layer }</li>
            {/each}
        </ul>
    </div>
</Window>

<style>
.container {
    display: flex;
    flex-direction: row;
    color: white;
}

.main-content {
	width: 100%;
	min-width: 100px;
	min-height: 100px;
}

.atomic-number {
	font-size: 14px;
}

.symbol {
	font-size: 32px;
	font-weight: bolder;
	text-align: center;
	padding: 8px 0px;
}

.name {
	font-size: 12px;
	text-align: center;
	width: 100%;
}

.atomic-mass {
	font-size: 14px;
	text-align: center;
}

.layer {
	width: 10px;
	list-style: none;
	display: flex;
	flex-direction: column;
	text-align: center;
}

.layer li {
	width: 100%;
	font-size: 10px;
	text-align: center;
}
</style>