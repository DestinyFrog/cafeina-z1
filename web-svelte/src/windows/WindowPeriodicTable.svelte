<script lang="ts">
import Window from "../lib/Window.svelte";
import Element from "../models/Element";

let elements: Element[] = []
Element.get_many()
    .then(data => elements = data)
    .catch(err => console.error(err))

</script>

<Window title="Tabela Periódica" >
    <ul class="periodic-table">
        {#each elements as element}
            <li style="
                grid-column-start: {element.xpos};
                grid-row-start: {element.ypos};
                background-color: {element.color};"
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
