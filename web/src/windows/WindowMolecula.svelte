<script lang="ts">
    import { mount } from "svelte"
    import { target } from "../config"
    import { capitalize } from "../lib/util"
    import Window from "../lib/Window.svelte"
    import type Molecula from "../models/Molecula"
    import WindowMolecula3D from "./WindowMolecula3D.svelte"

    let svg: string | null = $state(null)

    let {
        molecula,
    }: {
        molecula: Molecula
    } = $props()

    molecula
        .get_svg()
        .then((svg_content) => (svg = svg_content))
        .catch(console.error)

    function click() {
        mount(WindowMolecula3D, { target, props: { molecula } })
    }
</script>

<Window title={capitalize(molecula.name)}>
    {#if svg}
        {@html svg}
    {/if}

    <div slot="footer" class="menu">
        <button onclick={click}>z13</button>
    </div>
</Window>
