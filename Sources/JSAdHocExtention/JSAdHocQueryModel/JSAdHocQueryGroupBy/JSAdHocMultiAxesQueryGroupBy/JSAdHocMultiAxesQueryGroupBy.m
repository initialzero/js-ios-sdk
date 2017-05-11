/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocMultiAxesQueryGroupBy.h"

@implementation JSAdHocMultiAxesQueryGroupBy
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping hasOne:[JSAdHocQueryGroupByConditions class] forKeyPath:@"rows" forProperty:@"rowsConditions" withObjectMapping:[JSAdHocQueryGroupByConditions objectMappingForServerProfile:serverProfile]];
        
        [mapping hasOne:[JSAdHocQueryGroupByConditions class] forKeyPath:@"columns" forProperty:@"columnsConditions" withObjectMapping:[JSAdHocQueryGroupByConditions objectMappingForServerProfile:serverProfile]];
    }];
}

@end
