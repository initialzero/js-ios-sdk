/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQuerySelect.h"

@implementation JSAdHocQuerySelect
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        
        [mapping hasMany:[JSAdHocQuerySelectField class] forKeyPath:@"fields" forProperty:@"fields" withObjectMapping:[JSAdHocQuerySelectField objectMappingForServerProfile:serverProfile]];
        [mapping hasMany:[JSAdHocQueryAggregation class] forKeyPath:@"aggregations" forProperty:@"aggregations" withObjectMapping:[JSAdHocQueryAggregation objectMappingForServerProfile:serverProfile]];
    }];
}

@end
