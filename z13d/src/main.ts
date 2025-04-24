import './style.css'
import * as THREE from 'three'
import { OrbitControls } from 'three/addons/controls/OrbitControls.js'

const WIDTH = window.innerWidth
const HEIGHT = window.innerHeight

const scene = new THREE.Scene()
const camera = new THREE.PerspectiveCamera( 75, WIDTH/HEIGHT, 0.1, 1000 )

const renderer = new THREE.WebGLRenderer()
renderer.setSize( WIDTH, HEIGHT )

const controls = new OrbitControls( camera, renderer.domElement )

const app = document.getElementById( 'app' )!
app.appendChild( renderer.domElement )

const light = new THREE.PointLight( 0xffffff, 8000 )
light.position.x = 50
light.position.y = 40
scene.add( light )

const light2 = new THREE.PointLight( 0xffffff, 8000 )
light.position.x = -50
light.position.y = 40
scene.add( light )

scene.add( new THREE.AxesHelper( 25 ) )
const gridHelper = new THREE.GridHelper( 200, 10 )
scene.add( gridHelper )

const proportion = 0.1

class Vector3 {
    public x: number
    public y: number
    public z: number

    constructor( x:number, y:number, z:number ) {
        this.x = x
        this.y = y
        this.z = z
    }

    static sum( a:Vector3, b:Vector3 ): Vector3 {
        return new Vector3( a.x + b.x, a.y + b.y, a.z + b.z )
    }

    static mutBy( a:Vector3, mut:number ) {
        return new Vector3( a.x * mut, a.y * mut, a.z * mut )
    }

    mutBy(mut:number) {
        this.x *= mut
        this.y *= mut
        this.z *= mut
    }
}

class Atom {
    private color: number
    private radius: number
    private pos: Vector3

    public mesh: THREE.Mesh

    constructor( line:string, center:Vector3 ) {
        const [ color_str, radius_str, x_str, y_str, z_str ] = line.split(" ")
    
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
        const geometry = new THREE.SphereGeometry( this.radius, 32, 9 );
        const material = new THREE.MeshToonMaterial( { color: this.color, wireframe: false } ); 
        const sphere = new THREE.Mesh( geometry, material );
        sphere.position.x = this.pos.x
        sphere.position.y = this.pos.y
        sphere.position.z = this.pos.z
        return sphere
    }
}

class Molecula {
    private atoms: Atom[]
    private scale: Vector3
    private center: Vector3

    constructor(z13:string) {
        const [sizes, ... lines] = z13.trim().split("\n")

        this.scale = this.handleSizes(sizes)
        this.center = new Vector3(0, this.scale.y, 0)

        this.atoms = lines.map(line => new Atom(line, this.center))
    }

    private handleSizes(line:string): Vector3 {
        const [ width_str, height_str, depth_str ] = line.split(" ")
        const width = parseFloat(width_str)
        const height = parseFloat(height_str)
        const depth = parseFloat(depth_str)
        return new Vector3(width, height, depth)
    }

    public render( scene: THREE.Scene, camera: THREE.Camera ) {
        camera.position.x = 200
        camera.position.z = 30
        camera.position.y = this.center.y * proportion

        camera.lookAt(this.center.x, this.center.y, this.center.z )
        this.atoms.forEach(atom => scene.add(atom.mesh))
    }

    public destroy( scene:THREE.Scene ) {
        this.atoms.forEach(atom => scene.remove(atom.mesh))
    }

    static async load( file:string ): Promise<Molecula> {
        const res = await fetch(file)
        const data = await res.text()
        return new Molecula(data)
    }
}

function animate() {
    renderer.render( scene, camera );
    controls.update()
}

Molecula.load( "out.z13" )
    .then( molecula => molecula.render( scene, camera ) )
    .then( _ => renderer.setAnimationLoop( animate ) )