
#import <Foundation/Foundation.h>

@interface RCObservable : NSObject {

}

// Observers are _not_ retained, make sure to remove an observer before it is destroyed.
- (void)addObserver:(id<NSObject>)observer;
- (void)removeObserver:(id<NSObject>)observer;
- (BOOL)containsObserver:(id<NSObject>)observer;

- (void)notifyObservers:(NSInvocation*)invocation;

@end
