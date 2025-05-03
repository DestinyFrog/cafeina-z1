import { URL_PREFIX } from "../config"
import type { Vec2 } from "../lib/util"

export const Category = {
    "hidrogênio": "#8c0250",
    "metal alcalino": "#f5a80b",
    "metal alcalino terroso": "#ff6600",
    "metal de transição": "#970700",
    "ametal": "#008000",
    "semimetal": "#aa007a",
    "outros metais": "#ff007f",
    "halogênio": "#304ee6",
    "gás nobre": "#7525FA",
    "lantanídeo": "#054f77",
    "actinídeo": "#4169e1",
    "desconhecido": "#333333"
}

export const Fase = {
    "S": {name: "sólido"},
    "L": {name: "líquido"},
    "G": {name: "gasoso"}
}

export type PeriodicTableFormats = 'normal' | 'extended'

export interface ElementPayload {
    atomic_number: number
    oficial_name: string
    symbol: string
    atomic_radius?: number
    category: keyof typeof Category
    atomic_mass?: number
    eletronegativity?: number
    period: number
    family: number
    fase: keyof typeof Fase
    xpos: number
    ypos: number
    layers: number[]
    electronic_configuration: string
    oxidation_state: number[]
    discovery_year?: number
    discovery: string[]
}

class Element implements ElementPayload {
    atomic_number: number
    oficial_name: string
    symbol: string
    atomic_radius: number | undefined
    category: keyof typeof Category
    atomic_mass?: number
    eletronegativity: number | undefined
    period: number
    family: number
    fase: keyof typeof Fase
    xpos: number
    ypos: number
    layers: number[]
    electronic_configuration: string
    oxidation_state: number[]
    discovery_year: number | undefined
    discovery: string[]

    constructor(payload: ElementPayload) {
        this.atomic_number = payload.atomic_number
        this.oficial_name = payload.oficial_name
        this.symbol = payload.symbol
        this.atomic_radius = payload.atomic_radius
        this.category = payload.category
        this.atomic_mass = payload.atomic_mass
        this.eletronegativity = payload.eletronegativity
        this.period = payload.period
        this.family = payload.family
        this.fase = payload.fase
        this.xpos = payload.xpos
        this.ypos = payload.ypos
        this.layers = payload.layers
        this.electronic_configuration = payload.electronic_configuration
        this.oxidation_state = payload.oxidation_state
        this.discovery_year = payload.discovery_year
        this.discovery = payload.discovery
    }

    get category_color(): string {
        return Category[this.category]
    }

    get eletrons(): number {
        return this.atomic_number
    }

    get protons(): number {
        return this.atomic_number
    }

    get neutrons(): number {
        if ( !this.atomic_mass ) return this.atomic_number
        return Math.floor(this.atomic_mass) - this.atomic_number 
    }

    get fase_name() {
        return Fase[this.fase].name
    }

    get_position(mode: PeriodicTableFormats = "normal"): Vec2 {
        let x = this.xpos
        let y = this.ypos

        switch(mode) {
            case "extended":
                if (this.category == "actinídeo" || this.category == "lantanídeo") {
                    x--
                    y -= 3
                }
                else if (this.xpos > 2)
                    x += 14
                break
        }

        return { x, y }
    }

    static async get_many() {
        const res = await fetch(`${URL_PREFIX}/element`)
        const data = (await res.json()) as ElementPayload[]
        return data.map(payload => new Element(payload))
    }
}

export default Element
