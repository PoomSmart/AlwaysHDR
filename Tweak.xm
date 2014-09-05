#import <substrate.h>

%hook PLCameraView

- (int)lastSelectedHDRMode
{
	MSHookIvar<int>(self, "_lastSelectedHDRMode") = 1;
	return %orig;
}

- (void)setLastSelectedHDRMode:(int)mode
{
	%orig(1);
}

- (void)_setHDRMode:(int)mode
{
	%orig(1);
}

%end

%hook CAMHDRButton

- (int)_HDRModeForTriStateMode:(int)mode
{
	return 1;
}

- (int)_triStateModeForHDRMode:(int)mode
{
	return 1;
}

- (void)_setTriStateMode:(int)mode
{
	%orig(1);
}

- (void)_setTriStateMode:(int)mode notifyDelegate:(BOOL)notify
{
	%orig(1, notify);
}

- (void)setHDRMode:(int)mode
{
	%orig(1);
}

- (void)setHDRMode:(int)mode notifyDelegate:(BOOL)notify
{
	%orig(1, notify);
}

%end
