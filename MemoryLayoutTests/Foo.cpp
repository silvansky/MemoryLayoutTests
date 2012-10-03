//
//  Foo.cpp
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#include "Foo.h"

#include <stdio.h>

Foo::Foo()
{
	a = 5;
}

Foo::~Foo()
{
	a = 0;
}

int Foo::getValue() const
{
	return a;
}

void Foo::setValue(const int &value)
{
	a = value;
}

void Foo::printHello()
{
	// NOTE: this function does not use "this" pointer
	// so we can call it directly from vtable, pointed by vptr
	printf("Hello from Foo!\n");
}

void Foo::fooSpecific()
{
	a += 10;
}