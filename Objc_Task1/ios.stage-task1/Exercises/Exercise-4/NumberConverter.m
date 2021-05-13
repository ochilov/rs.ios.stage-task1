#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
	NSMutableArray *arr = [[NSMutableArray alloc] init];
	if (number) {
		NSInteger value = number.integerValue;
		if (value < 0)
			value = -value;
		NSString *strValue = [NSString stringWithFormat:@"%li", value];
		for (NSUInteger i = strValue.length; i > 0; ) {
			[arr addObject:[strValue substringWithRange:NSMakeRange(--i, 1)]];
		}
	}
	return [arr copy];
}

@end
