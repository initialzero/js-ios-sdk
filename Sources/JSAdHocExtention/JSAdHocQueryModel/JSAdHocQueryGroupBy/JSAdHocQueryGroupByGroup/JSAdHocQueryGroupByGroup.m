/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryGroupByGroup.h"

@implementation JSAdHocQueryGroupByGroup
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    EKObjectMapping *mapping = [super objectMappingForServerProfile:serverProfile];
    [mapping mapPropertiesFromDictionary:@{
                                           @"id"          : @"groupID",
                                           @"categorizer" : @"categorizer",
                                           @"includeAll"  : @"includeAll",
                                           @"rollup"      : @"rollup",
                                           @"field"       : @"field",
                                           }];
    return mapping;
}

@end
