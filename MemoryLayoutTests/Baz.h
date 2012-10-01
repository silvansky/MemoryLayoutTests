//
//  Baz.h
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#ifndef __MemoryLayoutTests__Baz__
#define __MemoryLayoutTests__Baz__

class Baz
{
public:
	Baz();
	virtual ~Baz();
	virtual int getValue() const;
	virtual void setValue(const int &value);
	virtual int *getValuePointer();
	virtual void printHello();
	void bazSpecific();
public:
	int a;
};

#endif /* defined(__MemoryLayoutTests__Baz__) */
