//
//  OBar.m
//  MemoryLayoutTests
//
//  Created by Valentine Gorshkov on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#import "OBar.h"

@implementation OBar

@synthesize b = _b, c = _c;

- (int *)getValuePointer
{
	return &_b;
}

- (double *)getDoubleValuePointer
{
	return &_c;
}

@end
