//
//  OFoo.m
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#import "OFoo.h"

@implementation OFoo

@synthesize a = _a;

- (int *)getValuePointer
{
	return &_a;
}

@end
