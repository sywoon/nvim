

class A {
    constructor() {
        this.a = 1;
    }
}

class B extends A {
    constructor() {
super();
this.a = 2;
    }
}


let b = new B();
console.log(b.a);


