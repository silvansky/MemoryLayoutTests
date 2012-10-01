//
//  Baz.cpp
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

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

void Baz::bazSpecific()
{
	a *= 2;
}