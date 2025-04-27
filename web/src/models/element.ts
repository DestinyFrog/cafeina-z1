import { URL_PREFIX } from "../config"

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
    "desconhecido": "#333333",
}

interface ElementPayload {
    atomic_number: number
    oficial_name: string
    symbol: string
    atomic_radius?: number
    category: keyof typeof Category
    atomic_mass?: number
    eletronegativity?: number
    period: number
    family: number
    xpos: number
    ypos: number
    layers: number[]
    electronic_configuration: string
    oxidation_state: number[]
    discovery_year?: number
}

class Element implements ElementPayload {
    public atomic_number: number
    public oficial_name: string
    public symbol: string
    public atomic_radius: number | undefined
    public category: keyof typeof Category
    public atomic_mass?: number
    public eletronegativity: number | undefined
    public period: number
    public family: number
    public xpos: number
    public ypos: number
    public layers: number[]
    public electronic_configuration: string
    public oxidation_state: number[]
    public discovery_year: number | undefined

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
        this.xpos = payload.xpos
        this.ypos = payload.ypos
        this.layers = payload.layers
        this.electronic_configuration = payload.electronic_configuration
        this.oxidation_state = payload.oxidation_state
        this.discovery_year = payload.discovery_year
    }

    get color(): string {
        return Category[this.category]
    }

    static async get_many() {
        const res = await fetch(`${URL_PREFIX}/element`)
        const data = (await res.json()) as ElementPayload[]
        return data.map(payload => new Element(payload))
    }
}

export default Element
