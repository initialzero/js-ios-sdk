/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryGroupByExpansionLevel.h"

@implementation JSAdHocQueryGroupByExpansionLevel
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromDictionary:@{
                                               @"expanded"    : @"expanded",
                                               @"fieldRef"    : @"fieldRef",
                                               @"aggregation" : @"aggregation"
                                               }];
    }];
}
@end
