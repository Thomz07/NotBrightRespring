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

    BKSDisplayBrightnessSet(brightness, 0);
}

%end
%end

%ctor {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.notbrightrespringpreferences"];
    enable = [preferences boolForKey:@"enable"];
    brightness = [preferences floatForKey:@"brightness"];
    if(enable){
        %init(Main)
    }
}