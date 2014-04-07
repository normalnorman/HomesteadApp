//  Copyright 2013 uTest. All rights reserved.


#import <Foundation/Foundation.h>
#import "APHDefines.h"


typedef NS_ENUM(NSInteger, APHSettingsMode)
{
    APHSettingsModeQA,
    APHSettingsModeSilent
};


/**
* Anonymous login name - you can set it as defaultUser parameter.
*/
APH_EXTERN NSString *const APHAnonymousUser;


@interface APHSettings : NSObject <NSCoding>

/**
* This value you get from Apphance application webpage.
*/
@property(nonatomic, strong) NSString *applicationId;

/**
* Version name that is used by Apphance. It is using CFBundleShortVersionString by default.
*/
@property(nonatomic, strong) NSString *applicationVersionName;

/**
* Version code that is used by Apphance. It is using CFBundleVersion by default.
*/
@property(nonatomic, strong) NSString *applicationVersionCode;

/**
* This will set default user. With this set on there will be no login screen.
*/
@property(nonatomic, strong) NSString *defaultUser;

/**
* This will enable/disable shake gesture to report a problem. It is enabled by default.
*/
@property(nonatomic, getter=isReportOnShakeEnabled) BOOL reportOnShakeEnabled;

/**
* Enable it when you use uTest with your apphance application. It is disabled by default.
*/
@property(nonatomic) BOOL withUTest;

/**
* Enable this flag to alter Apphance screen capturing method. When set to True Apphance will use system screenshots (stored in the device's gallery)
* In order to report bugs in such a mode, system screenshot needs to be created first.
* It is disabled by default.
*/
@property(nonatomic) BOOL screenShotsFromGallery;

/**
* Trap fatal signals via a Mach exception server. By default apphance is using BSD signal handler.
* More at https://www.plcrashreporter.org/documentation/api/v1.2-beta1/mach_exceptions.html
* It is disabled by default.
*
* @warning The Mach exception handler executes in-process, and will interfere with debuggers. It should not be used with debugging set on!
*/
@property(nonatomic, getter=isMathExceptionEnabled) BOOL machExceptionEnabled;

/**
* URL address of the target Apphance Server.
*/
@property(nonatomic, strong) NSString *serverURL;

/**
* Deprecated! Now apphance have only on mode.
*/
@property(nonatomic) APHSettingsMode apphanceMode __attribute__ ((deprecated));

/**
* Deprecated! With iOS7 report on double slide doesn't work.
*/
@property(nonatomic, getter=isReportOnDoubleSlideEnabled) BOOL reportOnDoubleSlideEnabled __attribute__ ((deprecated));

@end


/**
* Apphance internal enum.
*/
#define APH_OS_BASE_SDK_ABOVE_7 0
#ifdef __IPHONE_7_0
    #if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        #undef APH_OS_BASE_SDK_ABOVE_7
        #define APH_OS_BASE_SDK_ABOVE_7 1
    #endif
#endif
typedef NS_ENUM(NSInteger, APHSettingsOSBaseSDK)
{
    APHSettingsOSBaseSDKAbove7 = APH_OS_BASE_SDK_ABOVE_7
};
