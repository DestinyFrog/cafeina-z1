<script lang="ts">
import { onMount } from "svelte"
import Window from "../lib/Window.svelte"
import type Element from "../models/Element"

let { element }: { element: Element } = $props()

let canvas: HTMLCanvasElement
let ctx: CanvasRenderingContext2D

// Atom configurations
const ELETRON_SPEED_LEVELS = [0, 1, 2, 5, 10, 20, 100]
const ELETRON_RADIUS = 2
const ELETRON_ANGULAR_SPEED = 0.03
const ELETRON_LAYER_COLOR = '#000'
const ELETRON_COLOR = '#0000ff'
const ATOMIC_RADIUS_WEIGHT = 0.5
const PROTON_RADIUS = 4
const PROTON_COLOR = "#FF0000"
const NEUTRON_COLOR = "#00FF00"
const CORE_RADIUS = 8
const ATOMIC_RADIUS_DEFAULT = 200

// Canvas Configuration
const CANVAS_BACKGROUND_COLOR = "#fff"
const BORDER = 20

// Frames
const DELAY = 40

const WIDTH = (element.atomic_radius || ATOMIC_RADIUS_DEFAULT) * ATOMIC_RADIUS_WEIGHT*2 + BORDER*2
const HEIGHT = (element.atomic_radius || ATOMIC_RADIUS_DEFAULT) * ATOMIC_RADIUS_WEIGHT*2 + BORDER*2
const CENTER = { x: WIDTH/2, y: HEIGHT/2 }

onMount(() => {
    ctx = canvas.getContext('2d')!
    ctx.lineWidth = 1
})

function draw() {
    
}
</script>

<Window title={element.oficial_name}>
    <canvas bind:this={canvas}></canvas>
</Window>