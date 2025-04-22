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

document.body.addEventListener('resize', () => {
    console.log('resize')
}, false)

const app = document.getElementById( 'app' )!
app.appendChild( renderer.domElement )

const proportion = 0.03


const light = new THREE.PointLight(0xffffff, 500)
light.position.set(10, 10, 10)
scene.add(light)

let els: THREE.Mesh[] = []

scene.add(new THREE.AxesHelper(25))
const gridHelper = new THREE.GridHelper(100, 10)
scene.add(gridHelper)

const camera_distance = 30
camera.position.y = 6
let camera_angle = 0

fetch("out.z13")
.then(resp => resp.text())
.then(data => {
    for (var el of els) {
        scene.remove(el)
    }

    els = []
    
    data.trim().split("\n").forEach((text) => {
        const [ color_str, radius_str, x_str, y_str, z_str ] = text.split(" ")
    
        const color = parseInt(color_str, 16)
        const radius = parseFloat(radius_str)
        const x = parseFloat(x_str)
        const y = parseFloat(y_str)
        const z = parseFloat(z_str)

        const geometry = new THREE.SphereGeometry( radius * proportion, 32, 9 );
        const material = new THREE.MeshToonMaterial( { color, wireframe: false } ); 
        const sphere = new THREE.Mesh( geometry, material );
        sphere.position.x = x * proportion
        sphere.position.y = y * proportion
        sphere.position.z = z * proportion
        els.push(sphere)
        scene.add( sphere )
    })
})

    let camera_angle_rad = camera_angle / 180 * Math.PI
    camera.position.x = Math.cos(camera_angle_rad) * camera_distance
    camera.position.z = Math.sin(camera_angle_rad) * camera_distance

function animate() {

    renderer.render( scene, camera );

    camera.lookAt( 0, 0, 0 )
    controls.update()


    // camera_angle += 0.3
    if ( camera_angle > 360 ) camera_angle = 0
}

renderer.setAnimationLoop( animate );