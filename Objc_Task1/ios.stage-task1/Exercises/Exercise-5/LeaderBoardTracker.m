#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
	if (!playerArray.count) {
		return @[];
	}
	NSMutableArray *scores = [[NSMutableArray alloc] initWithCapacity:playerArray.count];
	for (NSNumber *player in playerArray) {
		NSInteger score = 1;
		NSNumber *prevRank;
		for (NSNumber *rank in rankedArray) {
			if (prevRank != nil && prevRank.integerValue == rank.integerValue) {
				continue;
			}
			if (player.integerValue >= rank.integerValue) {
				break;
			}
			score++;
			prevRank = rank;
		}
		[scores addObject:@(score)];
	}
	return [scores copy];
}

@end
