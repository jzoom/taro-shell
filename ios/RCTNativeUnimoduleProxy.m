//
//  RCTNativeUnimoduleProxy.m
//  rn554
//
//  Created by JZoom on 2019/12/16.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RCTNativeUnimoduleProxy.h"
static const NSString *exportedMethodsNamesKeyPath = @"exportedMethods";
static const NSString *viewManagersNamesKeyPath = @"viewManagersNames";
static const NSString *exportedConstantsKeyPath = @"modulesConstants";

static const NSString *methodInfoKeyKey = @"key";
static const NSString *methodInfoNameKey = @"name";
static const NSString *methodInfoArgumentsCountKey = @"argumentsCount";
@implementation RCTNativeUnimoduleProxy
RCT_EXPORT_MODULE();

// This is our static function that we call from our code
+ (void)emitEventWithName:(NSString *)name andPayload:(NSDictionary *)payload
{
    // userInfo requires a dictionary so we wrap out name and payload into an array and stick
    // that into the dictionary with a key of 'detail'
    NSDictionary *eventDetail = @{@"detail":@[name, payload]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"event-emitted"
                                                        object:self
                                                      userInfo:eventDetail];
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - RCT_EXPORT_METHOD
RCT_EXPORT_METHOD(checkLogin:(RCTResponseSenderBlock)callback)
{
    BOOL hasLogined = NO;
    if (hasLogined) {
        // 已登录
      
    } else {
      
    }
    NSLog(@"hasLogined = %d", hasLogined);
}


- (NSArray<NSString *> *)supportedEvents
{
    return @[@"UserDidLoginNotify"];
}


- (void)startObserving
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(emitEventInternal:)
                                                 name:@"event-emitted"
                                               object:nil];
}

// This will stop listening if we require it
- (void)stopObserving
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// This will actually throw the event out to our Javascript
- (void)emitEventInternal:(NSNotification *)notification
{
    // We will receive the dictionary here - we now need to extract the name
    // and payload and throw the event
    NSArray *eventDetails = [notification.userInfo valueForKey:@"detail"];
    NSString *eventName = [eventDetails objectAtIndex:0];
    NSDictionary *eventData = [eventDetails objectAtIndex:1];
    
    [self sendEventWithName:eventName
                       body:eventData];
}

- (NSDictionary *)constantsToExport{
  NSMutableDictionary <NSString *, id> *exportedModulesConstants = [NSMutableDictionary dictionary];
  // Grab all the constants exported by modules
//  for (UMExportedModule *exportedModule in [_moduleRegistry getAllExportedModules]) {
//    @try {
//      exportedModulesConstants[[[exportedModule class] exportedModuleName]] = [exportedModule constantsToExport] ?: [NSNull null];
//    } @catch (NSException *exception) {
//      continue;
//    }
//  }
//
  // Also add `exportedMethodsNames`
  NSMutableDictionary<const NSString *, NSMutableArray<NSMutableDictionary<const NSString *, id> *> *> *exportedMethodsNamesAccumulator = [NSMutableDictionary dictionary];
  
  
  NSMutableArray* arr = [[NSMutableArray alloc]init];
  exportedMethodsNamesAccumulator[@"ExponentAccelerometer"]=arr;
  exportedMethodsNamesAccumulator[@"ExpoBarometer"]=arr;
    exportedMethodsNamesAccumulator[@"ExponentDeviceMotion"]=arr;
  exportedMethodsNamesAccumulator[@"ExponentGyroscope"]=arr;
     exportedMethodsNamesAccumulator[@"ExponentMagnetometer"]=arr;
    exportedMethodsNamesAccumulator[@"ExponentMagnetometerUncalibrated"]=arr;
  
  exportedMethodsNamesAccumulator[@"ExponentPedometer"]=arr;
  exportedMethodsNamesAccumulator[@"ExpoLocation"]=arr;
  
  
  
  
  
  
//  for (UMExportedModule *exportedModule in [_moduleRegistry getAllExportedModules]) {
//    const NSString *exportedModuleName = [[exportedModule class] exportedModuleName];
//    exportedMethodsNamesAccumulator[exportedModuleName] = [NSMutableArray array];
//    [[exportedModule getExportedMethods] enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull exportedName, NSString * _Nonnull selectorName, BOOL * _Nonnull stop) {
//      NSMutableDictionary<const NSString *, id> *methodInfo = [NSMutableDictionary dictionaryWithDictionary:@{
//                                                                                                              methodInfoNameKey: exportedName,
//                                                                                                              // - 3 is for resolver and rejecter of the promise and the last, empty component
//                                                                                                              methodInfoArgumentsCountKey: @([[selectorName componentsSeparatedByString:@":"] count] - 3)
//                                                                                                              }];
//      [exportedMethodsNamesAccumulator[exportedModuleName] addObject:methodInfo];
//    }];
//    [self assignExportedMethodsKeys:exportedMethodsNamesAccumulator[exportedModuleName] forModuleName:exportedModuleName];
//  }

  // Also, add `viewManagersNames` for sanity check and testing purposes -- with names we know what managers to mock on UIManager
  NSArray *viewManagers = @[];
  NSMutableArray<NSString *> *viewManagersNames = [NSMutableArray arrayWithCapacity:[viewManagers count]];
//  for (UMViewManager *viewManager in viewManagers) {
//    [viewManagersNames addObject:[viewManager viewName]];
//  }

  NSMutableDictionary <NSString *, id> *constantsAccumulator = [NSMutableDictionary dictionary];
  constantsAccumulator[viewManagersNamesKeyPath] = viewManagersNames;
  constantsAccumulator[exportedConstantsKeyPath] = exportedModulesConstants;
  constantsAccumulator[exportedMethodsNamesKeyPath] = exportedMethodsNamesAccumulator;

  return constantsAccumulator;
}
@end
