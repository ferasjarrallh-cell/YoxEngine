#import <Foundation/Foundation.h>
#import <CoreVideo/CoreVideo.h>

NS_ASSUME_NONNULL_BEGIN
@interface YoxVideoToolboxRenderer : NSObject
- (void)configureWidth:(NSInteger)width height:(NSInteger)height;
- (void)invalidate;
@end
NS_ASSUME_NONNULL_END
