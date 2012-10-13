//
//  RamencoderHelperTests.m
//  RamencoderHelperTests
//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.
//

#import "RamencoderHelperTests.h"
#import "RCSingletonObject.h"
@interface RamencoderHelperTests()
@property(nonatomic,assign)RCSingletonObject *rcObject;
@end
@implementation RamencoderHelperTests

- (void)setUp
{
    [super setUp];
    self.rcObject = [RCSingletonObject shared];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testNotNil {
    STAssertNotNil(self.rcObject, @"Should not be nil");
    STAssertNotNil([RCSingletonObject shared], @"Should not be nil");
}

@end
