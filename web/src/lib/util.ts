export function capitalize(str: string): string {
    if (!str) return str
    return str
        .split(" ")
        .map(
            (word) =>
                word.charAt(0).toUpperCase() + word.slice(1).toLowerCase(),
        )
        .join(" ")
}

export interface Vec2 {
    x: number
    y: number
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
