//
//  AVAudioPlayer+PGFade.h
//  Cluckhen Brilliant
//
//  Created by jonny on 05/09/2012.
//
//

#import <AVFoundation/AVFoundation.h>

typedef void (^AVAudioPlayerFadeCompleteBlock)();

@interface AVAudioPlayer (PGFade)

@property (nonatomic, readonly) BOOL fading;
@property (nonatomic, readonly) float fadeTargetVolume;

- (void) fadeToVolume:(float)volume duration:(NSTimeInterval)duration;
- (void) fadeToVolume:(float)volume duration:(NSTimeInterval)duration completion:(AVAudioPlayerFadeCompleteBlock)completion;

- (void) stopWithFadeDuration:(NSTimeInterval)duration;

- (void) playWithFadeDuration:(NSTimeInterval)duration;

@end