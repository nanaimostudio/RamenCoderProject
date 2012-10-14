//
//  RamencoderHelper
//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.

#import "NSObject+Invoking.h"

#import "NSInvocation+Utilities.h"
#import <objc/runtime.h>


@implementation NSObject (Invoking)

#pragma mark -
#pragma mark Private

- (id)buildInvocation:(NSInvocation __strong**)invocationReceiver {
    return [NSInvocation buildInvocation:invocationReceiver withTarget:self];
}

@end
