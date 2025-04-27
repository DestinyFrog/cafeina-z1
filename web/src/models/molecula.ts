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
}

export default Molecula