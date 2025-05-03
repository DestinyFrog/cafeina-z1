<script lang="ts">
import { capitalize } from "../lib/util"
import Window from "../lib/Window.svelte"
import type Element from "../models/Element"

let {
    element
}: {
    element: Element
} = $props()
</script>

<Window title={capitalize(element.oficial_name)} background_color={element.category_color}>
    <div>
        <div class="container">
            <p class="atomic-number">{element.atomic_number}</p>
            <p class="symbol">{element.symbol}</p>
            <p class="name">{ capitalize(element.oficial_name) }</p>
            <p class="atomic-mass">{element.atomic_mass} pm</p>

            <ul class="layer">
                {#each element.layers as layer}
                    <li>{ layer }</li>
                {/each}
            </ul>
        </div>
    </div>
</Window>

<style>
.container {
    display: flex;
    flex-direction: column;
    color: white;

    width: 100%;
	min-width: 100px;
	min-height: 100px;
    position: relative;
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
    margin-bottom: 4px;
}

.atomic-mass {
	font-size: 12px;
	text-align: center;
}

.layer {
	list-style: none;
    position: absolute;
    right: 0;
}

.layer li {
	width: 100%;
	font-size: 10px;
	text-align: right;
}
</style>