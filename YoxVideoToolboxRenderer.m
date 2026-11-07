#import "YoxVideoToolboxRenderer.h"
#import <VideoToolbox/VideoToolbox.h>

@implementation YoxVideoToolboxRenderer {
    VTDecompressionSessionRef _session;
    CMFormatDescriptionRef _format;
}
- (void)configureWidth:(NSInteger)width height:(NSInteger)height {
    // Placeholder only. A real session requires codec-specific SPS/PPS (H.264)
    // or VPS/SPS/PPS (HEVC) from Moonlight's decode units.
    [self invalidate];
    NSLog(@"YoxVideoToolboxRenderer: configure %ldx%ld; parameter sets required",
          (long)width, (long)height);
}
- (void)invalidate {
    if (_session) { VTDecompressionSessionInvalidate(_session); CFRelease(_session); _session = NULL; }
    if (_format) { CFRelease(_format); _format = NULL; }
}
- (void)dealloc { [self invalidate]; }
@end
