<script lang="ts">
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
</script>

<Window title="Diagrama de Linus Pauling">
    <canvas bind:this={canvas}></canvas>
</Window>
