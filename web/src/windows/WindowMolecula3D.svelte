<script lang="ts">
    import { onMount } from "svelte"
    import type Molecula from "../models/Molecula"
    import Window from "../lib/Window.svelte"
    import * as THREE from "three"
    import { Vector3 } from "../lib/util"

    let content: HTMLCanvasElement

    let {
        molecula,
    }: {
        molecula: Molecula
    } = $props()

    const proportion = 0.01

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

    onMount(() => {
        content.width = 200
        content.height = 200

        const scene = new THREE.Scene()
        const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 1000)
        let renderer: THREE.WebGLRenderer

        let camera_angle = 0
        let camera_distance = 20
        const camera_acc = 1 / 2

        camera.position.z = 5

        const animate = () => {
            camera_angle += camera_acc
            if (camera_angle > 360) camera_angle = 360 % camera_angle
            camera.position.x =
                Math.cos((camera_angle / 180) * Math.PI) * camera_distance
            camera.position.z =
                Math.sin((camera_angle / 180) * Math.PI) * camera_distance
            camera.lookAt(0, 0, 0)

            renderer.render(scene, camera)
        }

        const createScene = (el: HTMLCanvasElement) => {
            renderer = new THREE.WebGLRenderer({ antialias: true, canvas: el })
            renderer.setAnimationLoop(animate)
        }

        createScene(content)

        molecula
            .get_z13()
            .then((z13) => {
                const mol = new Molecula3D(z13)
                camera_distance = mol.max_radius + 6
                mol.render(scene)
            })
            .catch(console.error)
    })
</script>

<Window title={molecula.name}>
    <canvas bind:this={content}></canvas>
</Window>
