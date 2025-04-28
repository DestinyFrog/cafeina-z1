import "./windowMolecula.css"

import Molecula from "../models/molecula"
import { capitalize } from "../util"
import Window from "../widget/window"
import WindowMolecula3D from "./windowMolecula3D"

class WindowMolecula extends Window {
    private molecula: Molecula

    private div: HTMLDivElement
    private button_z13: HTMLButtonElement

    constructor(molecula: Molecula) {
        super("molecula", capitalize(molecula.name))
        this.molecula = molecula

        this.div = document.createElement("div")
        this.div.className = 'molecula-svg'
        this.appendToContent(this.div)

        this.button_z13 = document.createElement("button")
        this.button_z13.textContent = "Z13"
        this.appendToFooter(this.button_z13)
    }

    protected Render(): void {
        this.molecula.get_svg()
            .then((svg) => {
                this.div.innerHTML = svg

                this.button_z13.addEventListener('click', _ => {
                    const w = new WindowMolecula3D(this.molecula)
                    w.Start()
                })
            })
            .catch(console.error)
    }
}

export default WindowMolecula
