import Molecula from "../models/molecula"
import { capitalize } from "../util"
import Window from "../widget/window"

class WindowMolecula extends Window {
    private molecula: Molecula

    div: HTMLDivElement

    constructor(molecula: Molecula) {
        super("molecula", capitalize(molecula.name))
        this.molecula = molecula

        this.div = document.createElement("div")
        this.appendToContent(this.div)
    }

    protected Render(): void {
        this.molecula
            .get_svg()
            .then((svg) => {
                this.div.innerHTML = svg
            })
            .catch(console.error)
    }
}

export default WindowMolecula
