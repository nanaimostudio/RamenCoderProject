//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController(Nib)

+ (id)controllerWithNib:(NSString *)nibName;
+ (id)controllerWithDefaultNib;

- (id)initWithNib:(NSString *)nibName;
- (id)initWithDefaulNib;

@end
