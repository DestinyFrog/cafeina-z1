export interface Vec2 {
    x: number
    y: number
}

export function generateRandomString(size = 8) {
    let result = ""
    const characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    const charactersLength = characters.length
    for (let i = 0; i < size; i++) {
        result += characters.charAt(
            Math.floor(Math.random() * charactersLength)
        )
    }
    return result
}

export function DegreesToRadians(degrees: number) {
    return (degrees / 180) * Math.PI
}

export function generateRandomVec2(max_x: number, max_y: number): Vec2 {
    return {
        x: Math.floor(Math.random() * max_x),
        y: Math.floor(Math.random() * max_y),
    }
}

export function capitalize(str: string): string {
    if (!str) return str
    return str
        .split(" ")
        .map(
            (word) => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase()
        )
        .join(" ")
}

export class Vector3 {
    public x: number
    public y: number
    public z: number

    constructor(x: number, y: number, z: number) {
        this.x = x
        this.y = y
        this.z = z
    }

    static sum(a: Vector3, b: Vector3): Vector3 {
        return new Vector3(a.x + b.x, a.y + b.y, a.z + b.z)
    }

    static mutBy(a: Vector3, mut: number) {
        return new Vector3(a.x * mut, a.y * mut, a.z * mut)
    }

    mutBy(mut: number) {
        this.x *= mut
        this.y *= mut
        this.z *= mut
    }
}
