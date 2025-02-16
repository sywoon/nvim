

class A {
    constructor() {
        this.a = 1;
    }

    call1() {
        return this.a;
    }

    call2(name) {
        return name + ":" + this.a;
    }
}

let a = new A();
a.call3();

