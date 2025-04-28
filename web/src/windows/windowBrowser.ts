import "./windowBrowser.css"

import Window from "../widget/window"
import Element, { ElementPayload } from "../models/element"
import SearchObject from "../models/searchObject"
import WindowElement from "./windowElement"
import Molecula, { MoleculaPayload } from "../models/molecula"
import WindowMolecula from "./windowMolecula"

class WindowBrowser extends Window {
    private button_search: HTMLButtonElement
    private input_search: HTMLInputElement
    private ul_recomendation: HTMLUListElement

    private queue: Function[] = []

    constructor() {
        super("search", "Navegador")

        const div_search = document.createElement("div")
        div_search.className = "div-search"
        this.appendToContent(div_search)

        this.input_search = document.createElement("input")
        this.input_search.type = "text"
        this.input_search.className = "browser-input"

        this.button_search = document.createElement("button")
        this.button_search.className = "search-button"

        div_search.appendChild(this.input_search)
        div_search.appendChild(this.button_search)

        const img = document.createElement("img")
        img.src = "/icon_search.svg"
        img.alt = "search"
        img.style.height = "15px"
        this.button_search.appendChild(img)

        this.ul_recomendation = document.createElement("ul")
        this.ul_recomendation.className = "recomendation"
    }

    protected Render(): void {
        // this.appendToContent(this.input_search)
        // this.appendToContent(this.button_search)

        this.input_search.focus()
        this.input_search.select()

        this.button_search.addEventListener("click", () => {
            this.Search()
        })

        this.appendToContent(this.ul_recomendation)
        this.input_search.addEventListener("input", () => {
            this.Search()
        })
    }

    private updateQueue(fn?: Function) {
        if (fn) this.queue.push(fn)

        if (this.queue.length) {
            if (this.queue.length > 2)
                this.queue = [this.queue[0], this.queue[this.queue.length - 1]]

            const fn = this.queue[0]
            this.queue.shift()
            fn()
        }
    }

    public async Search() {
        const term = this.input_search.value
        if (term == "") {
            this.clear()
            return
        }

        const queueSearchFn = async () => {
            const data = await SearchObject.search(term)

            this.clear()

            data.elements.forEach((element) => {
                this.treatElement(element)
            })

            data.moleculas.forEach((molecula) => {
                this.treatMolecula(molecula)
            })

            this.updateQueue()
        }

        setTimeout(() => {
            this.updateQueue(queueSearchFn)
        }, 1000)
    }

    private clear() {
        this.ul_recomendation.innerHTML = ""
    }

    private treatElement(element: ElementPayload) {
        const li = document.createElement("li")
        li.textContent = element.oficial_name
        li.addEventListener("click", (_) => {
            const ready_element = new Element(element)
            const w = new WindowElement(ready_element)
            w.Start()
        })
        if (li) this.ul_recomendation.appendChild(li)
    }

    private treatMolecula(molecula: MoleculaPayload) {
        const li = document.createElement("li")
        li.textContent = molecula.name
        li.addEventListener("click", (_) => {
            const ready_molecula = new Molecula(molecula)
            const w = new WindowMolecula(ready_molecula)
            w.Start()
        })
        if (li) this.ul_recomendation.appendChild(li)
    }
}

export default WindowBrowser
