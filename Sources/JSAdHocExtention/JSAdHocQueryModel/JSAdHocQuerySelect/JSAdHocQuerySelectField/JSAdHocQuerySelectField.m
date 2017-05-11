/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQuerySelectField.h"

@implementation JSAdHocQuerySelectField
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromDictionary:@{
                                               @"type" : @"type",
                                               @"id" : @"fieldID",
                                               @"field" : @"fieldName",
                                               @"format" : @"format",
                                               }];
    }];
}
@end
