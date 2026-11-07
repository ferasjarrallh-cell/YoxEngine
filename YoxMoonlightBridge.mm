#import "YoxMoonlightBridge.h"

@implementation YoxMoonlightBridge
+ (instancetype)shared {
    static YoxMoonlightBridge *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ instance = [YoxMoonlightBridge new]; });
    return instance;
}
- (void)prepareWithHost:(NSString *)host {
    NSLog(@"YoxEngine scaffold: host=%@", host);
    // TODO: Integrate the exact pinned moonlight-common-c revision here.
    // This stub intentionally does NOT call LiStartConnection or claim streaming.
}
@end
