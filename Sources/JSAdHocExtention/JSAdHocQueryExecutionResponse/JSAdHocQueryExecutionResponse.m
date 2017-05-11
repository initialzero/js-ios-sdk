/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryExecutionResponse.h"
#import "EKMapper.h"

@implementation JSAdHocQueryExecutionResponse

#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"totalCounts", @"truncated"]];
        [mapping hasOne:[JSAdHocQueryExecutionParameters class] forKeyPath:@"params" forProperty:@"params" withObjectMapping:[JSAdHocQueryExecutionParameters objectMappingForServerProfile:serverProfile]];

        [mapping mapKeyPath:@"dataset" toProperty:@"dataSet" withValueBlock:^id(NSString *key, id value) {
            EKObjectMapping *mapping = [JSDataSet objectMappingForServerProfile:serverProfile fields:[value allKeys]];
            JSDataSet *dataSet = [EKMapper objectFromExternalRepresentation:value withMapping:mapping];
            return dataSet;
        }];
    }];
}

@end
