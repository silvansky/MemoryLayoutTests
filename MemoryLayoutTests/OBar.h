//
//  OBar.h
//  MemoryLayoutTests
//
//  Created by Valentine Gorshkov on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#import "OFoo.h"

@interface OBar : OFoo
{
	int _b;
	double _c;
}

@property (nonatomic, assign) int b;
@property (nonatomic, assign) double c;

- (int *)getValuePointer;
- (double *)getDoubleValuePointer;

@end
