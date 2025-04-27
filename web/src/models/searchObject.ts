import { URL_PREFIX } from "../config"
import { ElementPayload } from "./element"
import { MoleculaPayload } from "./molecula"

export interface SearchObjectPayload {
    elements: ElementPayload[]
    moleculas: MoleculaPayload[]
}

class SearchObject implements SearchObjectPayload {
    public elements: ElementPayload[]
    public moleculas: MoleculaPayload[]

    constructor(payload: SearchObjectPayload) {
        this.elements = payload.elements
        this.moleculas = payload.moleculas
    }

    static async search(term: string): Promise<SearchObject> {
        const res = await fetch(`${URL_PREFIX}/search/${term}`)
        const data = (await res.json()) as SearchObjectPayload
        return new SearchObject(data)
    }
}

export default SearchObject
