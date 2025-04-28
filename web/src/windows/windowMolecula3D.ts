import Molecula from "../models/molecula"
import { capitalize, Vector3 } from "../util"
import Window from "../widget/window"
import * as THREE from "three"
import { OrbitControls } from "three/addons/controls/OrbitControls.js"

const proportion = 0.1

class Atom3D {
    private color: number
    private radius: number
    private pos: Vector3

    public mesh: THREE.Mesh

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
        const material = new THREE.MeshLambertMaterial({
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
    private atoms: Atom3D[]
    public scale: Vector3
    private center: Vector3

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

class WindowMolecula3D extends Window {
    private molecula: Molecula

    private scene: THREE.Scene
    private camera: THREE.PerspectiveCamera
    private renderer: THREE.WebGLRenderer
    private controls: OrbitControls

    private light: THREE.Light

    private width = 200
    private height = 200

    private camera_angle = 180
    private camera_rotation_speed = 1 / 4
    private camera_radius = 100
    private camera_y_wave = 100

    constructor(molecula: Molecula) {
        super("molecula3d", capitalize(molecula.name))
        this.molecula = molecula

        this.scene = new THREE.Scene()
        this.camera = new THREE.PerspectiveCamera(75, this.width / this.height, 0.1, 1000)
        this.renderer = new THREE.WebGLRenderer()
        this.controls = new OrbitControls(this.camera, this.renderer.domElement)
    
        this.renderer.setSize(this.width, this.height)
        this.appendToContent(this.renderer.domElement)

        this.light = new THREE.PointLight(0xffffff, 4000)
        this.light.position.z = 100
        this.scene.add(this.light)
    }

    protected Render(): void {
        this.renderer.setAnimationLoop(() => this.Draw())

        this.molecula.get_z13()
            .then(z13 => {
                const molecula3d = new Molecula3D(z13)
                this.camera_radius = molecula3d.max_radius + 20
                molecula3d.render(this.scene)
            })
    }

    private Draw(): void {
        this.controls.update()

        this.camera_angle += this.camera_rotation_speed

        let camera_x = Math.cos((this.camera_angle * Math.PI) / 180) * this.camera_radius
        let camera_y = Math.sin(this.camera_angle / this.camera_y_wave) * 20
        let camera_z = Math.sin((this.camera_angle * Math.PI) / 180) * this.camera_radius
        this.camera.position.x = camera_x
        this.camera.position.y = camera_y
        this.camera.position.z = camera_z
        this.light.position.x = camera_x
        this.light.position.z = camera_z
        this.camera.lookAt(0, 0, 0)
    
        this.renderer.render(this.scene, this.camera)
    }
}

export default WindowMolecula3D
