//
//  RamencoderHelper
//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.

#import "NSInvocation+Utilities.h"

#import "RCInvocationBuilder.h"


@implementation NSInvocation (Utilities)

+ (id)buildInvocation:(NSInvocation __strong **)invocationReceiver withTarget:(id)target {
    RCInvocationBuilder* builder = [[RCInvocationBuilder alloc] initWithReceiver:invocationReceiver target:target];
    return builder;
}

@end
