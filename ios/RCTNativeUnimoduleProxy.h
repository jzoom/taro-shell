//
//  RCTNativeUnimoduleProxy.h
//  rn554
//
//  Created by JZoom on 2019/12/16.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
NS_ASSUME_NONNULL_BEGIN

@interface RCTNativeUnimoduleProxy : RCTEventEmitter <RCTBridgeModule>
+ (void)emitEventWithName:(NSString *)name andPayload:(NSDictionary *)payload;
@end

NS_ASSUME_NONNULL_END
