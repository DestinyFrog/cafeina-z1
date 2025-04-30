<script lang="ts">
import { mount } from "svelte";
import WindowPeriodicTable from "./windows/WindowPeriodicTable.svelte";

let windows = []

const newWin = mount( WindowPeriodicTable, {
  target: document.getElementById('app')!,
  props: {}
} )

windows.push(newWin)
</script>

<main></main>

<style>
main {
    background-color: #222222;
    width: 100%;
    height: 100%;
}
</style>
