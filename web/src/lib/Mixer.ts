export let mixerObjs: {
    [key: string]: {
        x: number
        y: number
        width: number
        height: number
    }
} = {}

export function addUuid(uuid: string, obj: any) {
    mixerObjs[uuid] = obj
    console.log(mixerObjs)
}

export function removeUuid(uuid: string) {}
