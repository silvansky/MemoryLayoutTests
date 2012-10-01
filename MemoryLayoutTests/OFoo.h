//
//  OFoo.h
//  MemoryLayoutTests
//
//  Created by Valentine Silvansky on 01.10.12.
//  Copyright (c) 2012 silvansky. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OFoo : NSObject
{
	int _a;
}

@property (nonatomic, assign) int a;

- (int *)getValuePointer;

@end
