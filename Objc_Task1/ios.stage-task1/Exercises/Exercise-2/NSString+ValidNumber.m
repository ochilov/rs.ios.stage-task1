#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
	NSUInteger length = self.length;
	if (length <= 0 || 100 < length) {
		return NO;
	}
	for (NSUInteger i = 0; i < length; i++) {
		unichar character = [self characterAtIndex:i];
		if (!isdigit(character)) {
			return NO;
		}
	}
	return YES;
}

@end
