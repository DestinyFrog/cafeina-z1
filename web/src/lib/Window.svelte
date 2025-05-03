<script lang="ts">
let {
    title,
    x: start_x = 10,
    y: start_y = 10,
    background_color = "white"
} = $props()

let is_dragging = false

let x = $state(start_x)
let y = $state(start_y)
let offset_x = $state(0)
let offset_y = $state(0)

function mouseDown(event:MouseEvent) {
    offset_x = x - event.clientX
    offset_y = y - event.clientY

    is_dragging = true
}

function windowMouseMove(event:MouseEvent) {
    if (!is_dragging) return

    if (is_dragging) {
        x = event.clientX + offset_x
        y = event.clientY + offset_y
    }
}

function windowMouseUp(_event:MouseEvent) {
    is_dragging = false
}

let thisWindow: Element
function close() {
    thisWindow.remove()
}
</script>

<svelte:window
    on:mousemove="{(ev) => windowMouseMove(ev)}"
    on:mouseup="{(ev) => windowMouseUp(ev)}"
    ></svelte:window>

<div bind:this={thisWindow} class="window" style="top: {y}px; left: {x}px;">

    <div aria-hidden="true" class="header"
        onmousedown={(ev) => mouseDown(ev)}>
        <p class="title">{ title }</p>
        <button class="closer" onclick={close} aria-label="false"></button>
    </div>

    <div class="content" style="background-color: {background_color};">
        <slot></slot>
    </div>

    <div class="footer">
        <slot name="footer"></slot>
    </div>
</div>

<style>
.window {
	position: fixed;
	width: min-content;
	height: min-content;
    border-radius: 4px;
    border: 2px solid black;
    background-color: beige;
}

.window .header {
    width: 100%;
	height: 100%;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	padding: 4px;
	color: aliceblue;
	cursor: pointer;
	user-select: none;
	font-size: 12px;
	border-bottom: 2px solid black;
}

.window .header .title {
    color: black;
    text-wrap: nowrap;
}

.window .content {
	display: flex;
	flex-direction: column;
	align-items: center;
    border: 2px solid black;
    padding: 4px;
    border-radius: 4px;
    margin: 4px 4px 0px 4px;
}

.closer {
    width: 12px;
    aspect-ratio: 1/1;
    border-radius: 50%;
    margin-left: 4px;
    border: 2px solid white;
    background-color: red;
    cursor: pointer;
}

.footer {
    padding: 4px;
}
</style>