<script>
let {
    title,
    x: start_x = 10,
    y: start_y = 10
} = $props()

let is_dragging = false

let x = $state(start_x)
let y = $state(start_y)
let offset_x = $state(0)
let offset_y = $state(0)

function mouseDown(event) {
    offset_x = x - event.clientX
    offset_y = y - event.clientY

    is_dragging = true
}

function windowMouseMove(event) {
    if (!is_dragging) return

    if (is_dragging) {
        x = event.clientX + offset_x
        y = event.clientY + offset_y
    }
}

function windowMouseUp(event) {
    is_dragging = false
}
</script>

<svelte:window
    on:mousemove="{windowMouseMove}"
    on:mouseup="{windowMouseUp}"
    ></svelte:window>

<div class="window" style="top: {y}px; left: {x}px;">
    <div aria-hidden="true" class="header"
        onmousedown={(ev) => mouseDown(ev)}>
        <p class="title">{ title }</p>
        <div class="closer"></div>
    </div>

    <div class="content">
        <slot></slot>
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
    margin: 4px;
    padding: 4px;
    background-color: white;
    border-radius: 4px;
}

.closer {
    width: 12px;
    aspect-ratio: 1/1;
    border-radius: 50%;
    margin-left: 4px;
    border: 2px solid white;
    background-color: red;
}
</style>