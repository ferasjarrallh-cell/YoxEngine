#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface YoxMoonlightBridge : NSObject
+ (instancetype)shared;
- (void)prepareWithHost:(NSString *)host;
@end
NS_ASSUME_NONNULL_END
