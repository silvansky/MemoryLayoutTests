//
//  Baz.cpp
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#include <stdio.h>

#include "Baz.h"

Baz::Baz()
{
	a = 16;
}

Baz::~Baz()
{

}

int Baz::getValue() const
{
	return a;
}

void Baz::setValue(const int &value)
{
	a = value;
}

int * Baz::getValuePointer()
{
	return &a;
}

void Baz::printHello()
{
	// NOTE: this function uses "this" pointer
	// so we can call it directly from vtable, pointed by vptr,
	// but we can expect "this" to be garbage
	printf("Hello from Baz (%p)! a = %d, &a = %p\n", this, a, &a);
}

void Baz::bazSpecific()
{
	a *= 2;
}