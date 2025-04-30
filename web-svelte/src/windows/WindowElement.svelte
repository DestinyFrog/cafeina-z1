<script lang="ts">
import Window from "../lib/Window.svelte"
import type Element from "../models/Element"

let { element }: {
    element: Element
} = $props()


</script>

<Window title={element.oficial_name}>
    
</Window>