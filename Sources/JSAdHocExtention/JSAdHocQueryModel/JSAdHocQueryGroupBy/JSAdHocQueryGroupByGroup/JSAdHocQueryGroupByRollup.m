/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryGroupByRollup.h"

@implementation JSAdHocQueryGroupByRollup
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping hasMany:[JSAdHocQueryGroupByGroup class] forKeyPath:@"groups" forProperty:@"groups" withObjectMapping:[JSAdHocQueryGroupByGroup objectMappingForServerProfile:serverProfile]];
    }];
}

@end
