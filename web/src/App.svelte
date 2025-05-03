<script lang="ts">
import { mount } from "svelte"
import Icon from "./lib/Icon.svelte"
import WindowPeriodicTable from "./windows/WindowPeriodicTable.svelte"
import WindowBrowser from "./windows/WindowBrowser.svelte"
import { target } from "./config";
</script>

<main>
    <Icon
        title="Tabela Periódica"
        icon="icon_periodic_table.svg"
        action={() => mount(WindowPeriodicTable, {target})} />

    <Icon
        title="Navegador"
        icon="icon_browser.svg"
        action={() => mount(WindowBrowser, {target})} />
</main>

<style>
main {
    background-color: #222222;
    width: 100%;
    height: 100%;
}
</style>