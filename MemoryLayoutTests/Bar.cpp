//
//  Bar.cpp
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#include "Bar.h"

Bar::Bar()
{
	b = 10.0;
	c = 100;
}

Bar::~Bar()
{

}

double Bar::getDoubleValue() const
{
	return b;
}

void Bar::setDoubleValue(const double &value)
{
	b = value;
}

int Bar::getValue() const
{
	return c;
}

void Bar::setValue(const int &value)
{
	c = value;
}

void Bar::barSpecific()
{
	b += c;
}