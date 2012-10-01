//
//  main.cpp
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#include <iostream>

#import <objc/runtime.h>

#include "Foo.h"
#include "Bar.h"
#include "Baz.h"

#import "OFoo.h"
#import "OBar.h"

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
	cout << "*** C++ Classes ***" << endl;

	cout << endl;

	Foo *foo1 = new Foo();
	Foo *foo2 = new Bar();
	foo1->setValue(10);
	Bar *bar1 = static_cast<Bar *>(foo2);
	bar1->setValue(50);
	bar1->setDoubleValue(500.0);
	Baz *baz1 = static_cast<Baz *>(bar1);

	Simple *s = new Simple();

	int *sa = &s->a;
	cout << "Simple *s is " << s << " and &s->a is " << sa << endl;
	cout << "size of Simple is " << sizeof(Simple) << endl;

	cout << endl;

	cout << "size of Foo is " << sizeof(Foo) << endl;
	cout << "size of Bar is " << sizeof(Bar) << endl;
	cout << "size of Baz is " << sizeof(Baz) << endl;

	cout << endl;

	cout << "foo1: " << foo1 << " value: " << foo1->getValue() << endl;
	cout << "foo2: " << foo2 << " value: " << foo2->getValue() << endl;
	cout << "bar1: " << bar1 << " value: " << bar1->getValue() << " double value: " << bar1->getDoubleValue() << endl;
	cout << "baz1: " << baz1 << " value: " << baz1->getValue() << " (" << baz1->a << ")" << endl;

	cout << endl;

	cout << "&foo1->a: " << &foo1->a << " offset is " << (size_t)&foo1->a - (size_t)foo1 << endl;
	cout << "&foo2->a: " << &foo2->a << " offset is " << (size_t)&foo2->a - (size_t)foo2 << endl;
	cout << "&bar1->a (from Baz): " << bar1->getValuePointer() << " offset is " << (size_t)bar1->getValuePointer() - (size_t)bar1 << endl;
	cout << "&bar1->b: " << &bar1->b << " offset is " << (size_t)&bar1->b - (size_t)bar1 << endl;
	cout << "&bar1->c: " << &bar1->c << " offset is " << (size_t)&bar1->c - (size_t)bar1 << endl;
	cout << "&baz1->a: " << &baz1->a << " offset is " << (size_t)&baz1->a - (size_t)baz1 << endl;

	cout << endl;

	cout << "offset of baz1: " << (size_t)baz1 - (size_t)bar1 << endl;

	cout << endl;
	
	size_t *vptr = reinterpret_cast<size_t *>(foo1);
	cout << hex;
	cout << "vptr of foo1 is " << vptr << " value 0x" << *vptr << endl;
	vptr = reinterpret_cast<size_t *>(bar1);
	cout << "vptr of bar1 is " << vptr << " value 0x" << *vptr << endl;
	vptr = reinterpret_cast<size_t *>(baz1);
	cout << "vptr of baz1 is " << vptr << " value 0x" << *vptr << endl;
	cout << dec;

	delete foo1;
	delete foo2;
	delete s;

	cout << endl;

	cout << "*** Objective-C Classes ***" << endl;

	cout << endl;

	OFoo *ofoo1 = [[OFoo alloc] init];
	OBar *obar1 = [[OBar alloc] init];

	ofoo1.a = 5;
	obar1.a = 10;
	obar1.b = 20;
	obar1.c = 10.;

	OFoo *ofoo2 = (OFoo *)obar1;

	cout << "ObjC Class size: " << sizeof(Class) << endl;
	cout << "OFoo instance size " << class_getInstanceSize([OFoo class]) << endl;
	cout << "OBar instance size " << class_getInstanceSize([OBar class]) << endl;

	cout << endl;

	cout << "OFoo class: " << [OFoo class] << endl;
	cout << "OBar class: " << [OBar class] << endl;

	cout << endl;

	cout << "ofoo1: " << ofoo1 << " value " << ofoo1.a << endl;
	cout << "obar1: " << obar1 << " value a " << obar1.a << " value b " << obar1.b << " value c " << obar1.c << endl;
	cout << "ofoo2: " << ofoo2 << " value " << ofoo2.a << endl;

	cout << endl;

	cout << "ofoo1 value pointer: " << [ofoo1 getValuePointer] << " offset is " << (size_t)[ofoo1 getValuePointer] - (size_t)ofoo1 << endl;
	cout << "ofoo2 value pointer: " << [ofoo2 getValuePointer] << " offset is " << (size_t)[ofoo2 getValuePointer] - (size_t)ofoo2 << endl;
	cout << "obar1 value pointer: " << [obar1 getValuePointer] << " offset is " << (size_t)[obar1 getValuePointer] - (size_t)obar1 << endl;
	cout << "obar1 double value pointer: " << [obar1 getDoubleValuePointer] << " offset is " << (size_t)[obar1 getDoubleValuePointer] - (size_t)obar1 << endl;

	cout << endl;

	cout << "ofoo1 isa: " << [ofoo1 class] << " raw 0x" << hex << *(size_t *)ofoo1 << dec << endl;
	cout << "ofoo2 isa: " << [ofoo2 class] << " raw 0x" << hex << *(size_t *)ofoo2 << dec << endl;
	cout << "obar1 isa: " << [obar1 class] << " raw 0x" << hex << *(size_t *)obar1 << dec << endl;

	[ofoo1 release];
	[obar1 release];

	cout << endl;

	cout << "*** END ***" << endl;

	return 0;
}

