

function test(): number {
    console.log("hello ts")
    let arr: number[] = []
    arr.push(11, 22)
    arr.sort((l, r) => {
        return l - r
    })
    arr.sort()
    return 999
}

function test2() {
    console.log('hello')
}

test()




