<script lang="ts">
    import { onMount } from "svelte"
    import Window from "../lib/Window.svelte"
    import type Element from "../models/Element"
    import { capitalize } from "../lib/util"

    let { element }: { element: Element } = $props()

    let canvas: HTMLCanvasElement
    let ctx: CanvasRenderingContext2D

    // Atom configurations
    const ELETRON_SPEED_LEVELS = [0, 1, 2, 5, 10, 20, 100]
    const ELETRON_RADIUS = 2
    const ELETRON_ANGULAR_SPEED = 0.03
    const ELETRON_LAYER_COLOR = "#fff"
    const ELETRON_COLOR = "#0000ff"
    let ELETRONS_ANGLE = 0

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

    const WIDTH = (element.atomic_radius || ATOMIC_RADIUS_DEFAULT) * ATOMIC_RADIUS_WEIGHT * 2 + BORDER * 2
    const HEIGHT = (element.atomic_radius || ATOMIC_RADIUS_DEFAULT) * ATOMIC_RADIUS_WEIGHT * 2 + BORDER * 2
    const CENTER = { x: WIDTH / 2, y: HEIGHT / 2 }

    const BLACK = '#000000'

    onMount(() => {
        ctx = canvas.getContext("2d")!
        ctx.lineWidth = 1

        canvas.width = WIDTH
        canvas.height = HEIGHT

        function draw() {
            ELETRONS_ANGLE += ELETRON_ANGULAR_SPEED
            if (ELETRONS_ANGLE > Math.PI * 2) ELETRONS_ANGLE = 0

            ctx.fillStyle = BLACK
            ctx.fillRect(0, 0, WIDTH, HEIGHT)

            let neutrons = element.neutrons
            let protons = element.protons
            while (neutrons > 0 || protons > 0) {
                ctx.fillStyle = NEUTRON_COLOR
                if (--neutrons > 0) {
                    ctx.beginPath()
                    const x = CENTER.x + Math.cos(Math.random() * 360) * Math.random() * CORE_RADIUS
                    const y = CENTER.y + Math.sin(Math.random() * 360) * Math.random() * CORE_RADIUS
                    ctx.arc(x, y, PROTON_RADIUS, 0, Math.PI * 2)
                    ctx.fill()
                }

                if (--protons > 0) {
                    ctx.beginPath()
                    ctx.fillStyle = PROTON_COLOR
                    const x = CENTER.x + Math.cos(Math.random() * 360) * Math.random() * CORE_RADIUS
                    const y = CENTER.y + Math.sin(Math.random() * 360) * Math.random() * CORE_RADIUS
                    ctx.arc(x, y, PROTON_RADIUS, 0, Math.PI * 2)
                    ctx.fill()
                }
            }

            ctx.fillStyle = ELETRON_COLOR
            for (let i = 0; i < element.layers.length; i++) {
                for (let j = 0; j < i; j++) {
                    const angle = ELETRONS_ANGLE * ((j / Math.PI) * 2 * i)
                    const distance = (((element.atomic_radius || ATOMIC_RADIUS_DEFAULT) * ATOMIC_RADIUS_WEIGHT) / i) * (1 + j) + CORE_RADIUS

                    const x = CENTER.x + Math.cos(angle) * distance
                    const y = CENTER.y + Math.sin(angle) * distance

                    ctx.beginPath()
                    ctx.arc(x, y, ELETRON_RADIUS, 0, Math.PI * 2)
                    ctx.fill()
                    ctx.closePath()
                }
            }

            setTimeout(() => requestAnimationFrame(draw), DELAY)
        }
        draw()
    })
</script>

<Window title={capitalize(element.oficial_name)}>
    <canvas bind:this={canvas}></canvas>
</Window>
