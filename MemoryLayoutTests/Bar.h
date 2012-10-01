//
//  Bar.h
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#ifndef __MemoryLayoutTests__Bar__
#define __MemoryLayoutTests__Bar__

#include "Foo.h"
#include "Baz.h"

class Bar : public Foo, public Baz
{
public:
	Bar();
	virtual ~Bar();
	virtual double getDoubleValue() const;
	virtual void setDoubleValue(const double &value);
	virtual int getValue() const;
	virtual void setValue(const int &value);
	void barSpecific();
public:
	double b;
	int c;
};

#endif /* defined(__MemoryLayoutTests__Bar__) */
