#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>

HBPreferences *preferences;
BOOL enable;
float brightness;

// get brightness functions
typedef struct BKSDisplayBrightnessTransaction *BKSDisplayBrightnessTransactionRef;

FOUNDATION_EXPORT BKSDisplayBrightnessTransactionRef BKSDisplayBrightnessTransactionCreate(CFAllocatorRef allocator);

FOUNDATION_EXPORT float BKSDisplayBrightnessGetCurrent();
FOUNDATION_EXPORT void BKSDisplayBrightnessSet(float brightness, NSInteger unknown);

%group Main
%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {
    %orig;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BKSDisplayBrightnessSet(brightness, 0);
    });
}

%end
%end

%ctor {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.notbrightrespringpreferences"];
    enable = [preferences objectForKey:@"enable"];
    brightness = [preferences floatForKey:@"brightness"];
    if(enable){
        %init(Main)
    }
}