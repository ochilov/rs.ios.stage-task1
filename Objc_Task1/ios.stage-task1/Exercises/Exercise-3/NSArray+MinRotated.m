#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
	if (!self.count) {
		return nil;
	}
	
	NSUInteger min = 0;
	NSUInteger max = self.count-1;
	// in default  - minVal is first element (for not rotated case)
	NSNumber * minVal = [self objectAtIndex:min];
	
	while (max > min) {
		NSUInteger mid = (min+max)/2;
		NSNumber * midVal = [self objectAtIndex:mid];
		if (minVal.integerValue <= midVal.integerValue) {
			// [min ... mid] - sorted
			NSNumber * maxVal = [self objectAtIndex:max];
			if (midVal.integerValue <= maxVal.integerValue) {
				// [mid ... max] - sorted, so
				// minVal is found
				break;
			}
			
			// [mid ... max] - not sorted, so
			// pivot and minVal is here
			minVal = maxVal;
			min = mid+1;
			
		} else {
			// [min ... mid] - not sorted, so
			// pivot and minVal is here
			minVal = midVal;
			max = mid-1;
		}
	}
	return minVal;
}

@end
