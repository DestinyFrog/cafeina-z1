import { URL_PREFIX } from "../config"

export interface MoleculaPayload {
    uid: string
    name: string
}

class Molecula implements MoleculaPayload {
    public uid: string
    public name: string

    constructor(payload:MoleculaPayload) {
        this.uid = payload.uid
        this.name = payload.name
    }

    async get_svg(): Promise<string> {
        const res = await fetch(`${URL_PREFIX}/molecula/${this.uid}/view`)
        const svg = await res.text()
        return svg
    }

    async get_z13(): Promise<string> {
        const res = await fetch(`${URL_PREFIX}/molecula/${this.uid}/view?mode=z13`)
        const z13 = await res.text()
        return z13
    }

    static async search_by_term(term:string) {
        const res = await fetch(`${URL_PREFIX}/mix/${term}`)
        const data = await res.json() as MoleculaPayload
        return new Molecula(data)
    }
}

export default Molecula