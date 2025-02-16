#include <iostream>

class MyClass {
public:
  MyClass() { std::cout << "MyClass constructor"; }
  ~MyClass() { std::cout << "MyClass destructor"; }

  void myMethod() { std::cout << "MyClass myMethod"; }
};

int Test() {
  MyClass myClass;
  myClass.myMethod();
  return 0;
}

int i = Test();
