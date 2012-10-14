

#import "RCObservable.h"

@interface RCObservable() {
@private
	NSMutableSet* observers;
	NSMutableSet* pendingAdds;
	NSMutableSet* pendingRemoves;
	BOOL notifying;
}

@end
@implementation RCObservable

- (id)init {
	self = [super init];
	if (self) {
		// Create non-retaining sets
		observers = (NSMutableSet*)CFBridgingRelease(CFSetCreateMutable(NULL, 0, NULL));
		pendingAdds = (NSMutableSet*)CFBridgingRelease(CFSetCreateMutable(NULL, 0, NULL));
		pendingRemoves = (NSMutableSet*)CFBridgingRelease(CFSetCreateMutable(NULL, 0, NULL));
	}
	return self;
}

- (void)addObserver:(id<NSObject>)observer {
	if (notifying) {
		// The main set cannot be mutated while iterating, add to a secondary set
		// to be processed when the iteration finishes
		[pendingRemoves removeObject:observer];
		[pendingAdds addObject:observer];
	} else {
		[observers addObject:observer];
	}
}

- (void)removeObserver:(id<NSObject>)observer {
	if (notifying) {
		// The main set cannot be mutated while iterating, add to a secondary set
		// to be processed when the iteration finishes
		[pendingAdds removeObject:observer];
		[pendingRemoves addObject:observer];
	} else {
		[observers removeObject:observer];
	}
}

- (BOOL)containsObserver:(id<NSObject>)observer {
	return ([observers containsObject:observer] && ![pendingRemoves containsObject:observer]) ||
    [pendingAdds containsObject:observer];
}

- (void)commitPending {
	NSAssert(!notifying, @"Tried to commit pending observers while notifying");
	for (id<NSObject> observer in pendingRemoves)
		[observers removeObject:observer];
	[pendingRemoves removeAllObjects];
    
	for (id<NSObject> observer in pendingAdds)
		[observers addObject:observer];
	[pendingAdds removeAllObjects];
}

- (void)notifyObservers:(NSInvocation*)invocation {
	notifying = YES;
	for (id<NSObject> observer in observers) {
		if (![pendingRemoves containsObject:observer] && [observer respondsToSelector:[invocation selector]]) {
			[invocation setTarget:observer];
			[invocation invoke];
		}
	}
	notifying = NO;
	[self commitPending];
}

@end
