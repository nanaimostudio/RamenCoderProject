//
//  Created by zitao xiong on 10/13/12.
//  Copyright (c) 2012 Nanaimostudio. All rights reserved.
//

#import "UIViewController+Nib.h"


@implementation UIViewController(Nib)

+ (id)controllerWithNib:(NSString *)nibName {
	return [[[self class] alloc] initWithNib:nibName];
}

+ (id)controllerWithDefaultNib {
	return [[[self class] alloc] initWithDefaulNib];
}

- (id)initWithNib:(NSString *)nibName {
	return [self initWithNibName: nibName
						  bundle: nil];			
}

- (id)initWithDefaulNib {
	return [self initWithNibName: NSStringFromClass([self class])
						  bundle: nil];		
}

@end
