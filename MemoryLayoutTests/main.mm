//
//  main.cpp
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#include <iostream>
#import "OFoo.h"
#include "Foo.h"
#include "Bar.h"

class Simple
{
public:
	Simple() { a = 10; }
	int a;
};

typedef int (Foo::*MyFuncPtrType)() const;

using namespace std;

int main(int argc, const char * argv[])
{
	Foo *foo1 = new Foo();
	Foo *foo2 = new Bar();
	foo1->setValue(10);
	Bar *bar1 = dynamic_cast<Bar *>(foo2);
	bar1->setValue(50);
	bar1->setDoubleValue(500.0);
	Baz *baz1 = dynamic_cast<Baz *>(bar1);

	Simple *s = new Simple();

	int *sa = &s->a;
	cout << "Simple *s is " << s << " and &s->a is " << sa << endl;
	cout << "size of Simple is " << sizeof(Simple) << endl;

	cout << endl;

	cout << "size of Foo is " << sizeof(Foo) << endl;
	cout << "size of Bar is " << sizeof(Bar) << endl;
	cout << "size of Baz is " << sizeof(Baz) << endl;

	cout << endl;

	cout << "foo1: " << foo1 << " foo1 value: " << foo1->getValue() << endl;
	cout << "foo2: " << foo2 << " foo2 value: " << foo2->getValue() << endl;
	cout << "bar1: " << bar1 << " bar1 value: " << bar1->getValue() << " double value: " << bar1->getDoubleValue() << endl;
	cout << "baz1: " << baz1 << " baz1 value: " << baz1->getValue() << " (" << baz1->a << ")" << endl;

	cout << endl;

	cout << "&foo1->a: " << &foo1->a << " offset is " << (size_t)&foo1->a - (size_t)foo1 << endl;
	cout << "&foo2->a: " << &foo2->a << " offset is " << (size_t)&foo2->a - (size_t)foo2 << endl;
	cout << "&bar1->a (from Baz): " << bar1->getValuePointer() << " offset is " << (size_t)bar1->getValuePointer() - (size_t)bar1 << endl;
	cout << "&bar1->b: " << &bar1->b << " offset is " << (size_t)&bar1->b - (size_t)bar1 << endl;
	cout << "&bar1->c: " << &bar1->c << " offset is " << (size_t)&bar1->c - (size_t)bar1 << endl;
	cout << "&baz1->a: " << &baz1->a << " offset is " << (size_t)&baz1->a - (size_t)baz1 << endl;

	delete foo1;
	delete foo2;
	delete s;

	return 0;
}

