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

#import "Foundry.h"
#import "NSManagedObject+Foundry.h"
#import "NSObject+Foundry.h"
#import "TGFoundryObject.h"

FOUNDATION_EXPORT double FoundryVersionNumber;
FOUNDATION_EXPORT const unsigned char FoundryVersionString[];

