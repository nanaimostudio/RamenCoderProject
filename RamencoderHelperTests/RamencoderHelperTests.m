//
//  RamencoderHelperTests.m
//  RamencoderHelperTests
//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.
//

#import "RamencoderHelperTests.h"
#import "RCSingletonObject.h"
#import "NSObject+Invoking.h"
#import "RCInvocationBuilder.h"
#import "NSInvocation+Utilities.h"

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

- (void)testInvocationUtility {
    NSInvocation *action;
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1,@2, nil];
    [[array buildInvocation:&action] removeAllObjects];
    [action invoke];
    
    STAssertTrue([array count] == 0, @"array should be empty");
}

- (void)testInvocation {
    NSInvocation *action;
    NSMutableArray *array = [NSMutableArray array];
    [[array buildInvocation:&action] addObject:@"OBJ"];
    
    [action invoke];
    
    STAssertTrue([array count] == 1, @"Array has one object");;
    STAssertEquals([array objectAtIndex:0], @"OBJ", @"Array has OBJ");
}
@end
