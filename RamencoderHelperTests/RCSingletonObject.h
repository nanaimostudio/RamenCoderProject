//
//  RCSingletonObject.h
//  RamencoderHelper
//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDSingleton.h"

@interface RCSingletonObject : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(RCSingletonObject)
@end
