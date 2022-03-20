#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "QYBundleUtilities.h"
#import "QYDeviceUtilities.h"
#import "QYKeyChainUtilities.h"
#import "QYFile.h"
#import "QYFileManager.h"
#import "QYPathUtilities.h"
#import "QYFoundation.h"
#import "QYLogUtilities.h"
#import "QYQueueUtilities.h"
#import "QYTimer.h"

FOUNDATION_EXPORT double QYMobileKitVersionNumber;
FOUNDATION_EXPORT const unsigned char QYMobileKitVersionString[];

