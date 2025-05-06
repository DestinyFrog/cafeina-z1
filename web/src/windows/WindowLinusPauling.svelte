<script lang="ts">
    import { onMount } from "svelte"
    import Window from "../lib/Window.svelte"

    let canvas: HTMLCanvasElement

    const camadas = ["K", "L", "M", "N", "O", "P", "Q"]
    const diagramas = [
        {
            min: 1,
            max: 7,
            eletrons: 2,
            sublevel: "s",
        },
        {
            min: 2,
            max: 7,
            eletrons: 6,
            sublevel: "p",
        },
        {
            min: 3,
            max: 6,
            eletrons: 10,
            sublevel: "d",
        },
        {
            min: 4,
            max: 5,
            eletrons: 14,
            sublevel: "f",
        },
    ]

    const BLACK = '#000'
    const WHITE = '#fff'
    const SOFT_GRAY = '#666'

    onMount(() => {
        let ctx = canvas.getContext("2d")!

        const BORDER = 16
        const UNIT = 30

        const WIDTH = BORDER * 2 + UNIT * 5
        const HEIGHT = BORDER * 2 + UNIT * 7
        canvas.width = WIDTH
        canvas.height = HEIGHT

        ctx.fillStyle = BLACK
        ctx.fillRect(0, 0, WIDTH, HEIGHT)

        ctx.lineWidth = 2
        ctx.textAlign = "left"

        // ----------------- DESENHAR SETAS -----------------
        // desenhar linhas
        ctx.strokeStyle = SOFT_GRAY

        for (let i = 0; i <= 6; i++) {
            ctx.moveTo(BORDER + UNIT * (Math.floor(i / 2 + 0.1) + 2), BORDER + UNIT * Math.ceil(i / 2))
            ctx.lineTo(BORDER + UNIT, BORDER + UNIT * (i + 1))
            ctx.closePath()
        }

        ctx.moveTo(BORDER + UNIT * 5, BORDER + UNIT * 4)
        ctx.lineTo(BORDER + UNIT * 2, BORDER + UNIT * 7)
        ctx.closePath()

        ctx.stroke()

        // desenhar triangulos
        const a = 6
        ctx.beginPath()
        ctx.fillStyle = SOFT_GRAY

        for (let b = 1; b < 8; b++) {
            ctx.moveTo(BORDER + UNIT, BORDER + UNIT * b)
            ctx.lineTo(BORDER + UNIT, BORDER + UNIT * b - a)
            ctx.lineTo(BORDER + UNIT + a, BORDER + UNIT * b)
        }

        ctx.moveTo(BORDER + UNIT * 2, BORDER + UNIT * 7)
        ctx.lineTo(BORDER + UNIT * 2, BORDER + UNIT * 7 - a)
        ctx.lineTo(BORDER + UNIT * 2 + a, BORDER + UNIT * 7)

        ctx.closePath()
        ctx.fill()
        // --------------------------------------------------

        // ----------------- DESENHAR LETRAS ----------------
        ctx.font = (UNIT - 14).toString() + "px Arial"

        camadas.forEach((camada, i) => {
            ctx.fillStyle = WHITE
            const x = BORDER + 8
            const y = BORDER + UNIT * (i + 1) - 3
            ctx.fillText(camada, x, y)
        })
        // --------------------------------------------------

        // ---------------- DESENHAR DIAGRAMA ---------------
        diagramas.forEach((diagrama, idx) => {
            for (let i = diagrama.min; i <= diagrama.max; i++) {
                ctx.fillStyle = WHITE

                ctx.font = (UNIT - 12).toString() + "px Arial"
                const ax = BORDER + UNIT * (idx + 1) + 6
                const ay = BORDER + UNIT * i - 6
                ctx.fillText(`${i}${diagrama.sublevel}`, ax, ay)

                ctx.font = (UNIT - 20).toString() + "px Arial"
                const bx = BORDER + UNIT * (idx + 1) + (UNIT - 4)
                const by = BORDER + UNIT * (i - 1) + 16
                ctx.fillText(diagrama.eletrons.toString(), bx, by)
            }
        })
        // --------------------------------------------------
    })
</script>

<Window title="Diagrama de Linus Pauling">
    <canvas bind:this={canvas}></canvas>
</Window>
