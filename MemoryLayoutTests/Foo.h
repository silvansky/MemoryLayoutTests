//
//  Foo.h
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#ifndef __MemoryLayoutTests__Foo__
#define __MemoryLayoutTests__Foo__

class Foo
{
public:
	Foo();
	virtual ~Foo();
	virtual int getValue() const;
	virtual void setValue(const int &value);
public:
	int a;
};

#endif /* defined(__MemoryLayoutTests__Foo__) */
