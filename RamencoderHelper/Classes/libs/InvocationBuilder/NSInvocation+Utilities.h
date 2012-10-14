//
//  RamencoderHelper
//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.

#import <Foundation/Foundation.h>


@interface NSInvocation (Utilities)

/** Allows to build an NSInvocation instance using regular Objective-C syntax.
 
 In contrast with NSObject's performSelector: methods group, allows to send messages with unlimited number
 of arguments of any type.
 
 Example usage:
    NSInvocation* invocation = nil;
    [[NSInvocation buildInvocation:&invocation withTarget:someObject] doSomethingWithInteger:111
                                                                                      withObject:objArgument];
    [invocation invoke];  // equal to [someObject doSomethingWithInteger:42 withObject:objArgument];
 
 @param invocationReceiver  A pointer to the place where the invocation should be stored.
 @param target  The target of the invocation.
 @return  An object to which the message should be sent to build the invocation.
 */
+ (id)buildInvocation:(NSInvocation __strong**)invocationReceiver withTarget:(id)target;

@end
