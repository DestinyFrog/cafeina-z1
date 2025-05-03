<script lang="ts">
import { onMount } from "svelte";
import { Vector3 } from "../lib/util"
import Window from "../lib/Window.svelte"
import type Molecula from "../models/Molecula"
import * as THREE from "three"

let {
    molecula
}: {
    molecula: Molecula
} = $props()

const proportion = 0.1

let content: HTMLElement

class Atom3D {
    color: number
    radius: number
    pos: Vector3

    mesh: THREE.Mesh

    constructor(line: string, center: Vector3) {
        const [color_str, radius_str, x_str, y_str, z_str] = line.split(" ")

        this.color = parseInt(color_str, 16)
        this.radius = parseFloat(radius_str) * proportion

        const x = parseFloat(x_str)
        const y = parseFloat(y_str)
        const z = parseFloat(z_str)
        const pos = new Vector3(x, y, z)

        this.pos = Vector3.sum(pos, center)
        this.pos.mutBy(proportion)

        this.mesh = this.render()
    }

    private render() {
        const geometry = new THREE.SphereGeometry(this.radius, 20, 6)
        const material = new THREE.MeshBasicMaterial({
            color: this.color,
            wireframe: false,
        })
        const sphere = new THREE.Mesh(geometry, material)
        sphere.position.x = this.pos.x
        sphere.position.y = this.pos.y
        sphere.position.z = this.pos.z
        return sphere
    }
}

class Molecula3D {
    atoms: Atom3D[]
    scale: Vector3
    center: Vector3

    constructor(z13: string) {
        const [sizes, ...lines] = z13.trim().split("\n")

        this.scale = this.handleSizes(sizes)
        this.center = new Vector3(0, 0, 0)

        this.atoms = lines.map((line) => new Atom3D(line, this.center))
    }

    get max_radius() {
        return Math.max(this.scale.x, this.scale.z) * proportion
    }

    private handleSizes(line: string): Vector3 {
        const [width_str, height_str, depth_str] = line.split(" ")
        const width = parseFloat(width_str)
        const height = parseFloat(height_str)
        const depth = parseFloat(depth_str)
        return new Vector3(width, height, depth)
    }

    public render(scene: THREE.Scene) {
        this.atoms.forEach((atom) => scene.add(atom.mesh))
    }

    public destroy(scene: THREE.Scene) {
        this.atoms.forEach((atom) => scene.remove(atom.mesh))
    }
}

let scene: THREE.Scene
let camera: THREE.Camera
let renderer: THREE.WebGLRenderer

onMount(() => {
    scene = new THREE.Scene()
    camera = new THREE.PerspectiveCamera(75, content.clientWidth / content.clientHeight, 0.1, 1000)
    renderer = new THREE.WebGLRenderer()

    camera.position.z = 10
    camera.lookAt(0, 0, 0)

    content.appendChild(renderer.domElement)
    renderer.render(scene, camera)

    molecula.get_z13()
    .then(z13 => {
        const molecula3d = new Molecula3D(z13)
        molecula3d.render(scene)
    })
    .catch(console.error)
})
</script>

<Window title={molecula.name}>
    <div class="a" bind:this="{content}"></div>
</Window>

<style>
.a {
    width: 200px;
    height: 200px;
}
</style>