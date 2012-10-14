//
//  RamencoderHelper
//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.

#import <Foundation/Foundation.h>


/** A builder of NSInvocation objects. Wraps up any message sent to it with all of the message arguments
 to a NSInvocation instance.
 */
@interface RCInvocationBuilder : NSProxy

/** Initializes the builder.
 
 @param invocationReceiver  A place where the resulting invocation object should be stored.
 @param target  An object that is assumed to be receiver of the message. It will be set up as the target
 of the resulting invocation.
 @return  An initialized builder instance.
 */
- (id)initWithReceiver:(NSInvocation __strong **)invocationReceiver target:(id)target;

@end
