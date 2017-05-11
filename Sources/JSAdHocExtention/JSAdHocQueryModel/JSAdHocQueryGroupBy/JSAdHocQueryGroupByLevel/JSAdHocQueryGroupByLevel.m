/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryGroupByLevel.h"

@implementation JSAdHocQueryGroupByLevel
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    EKObjectMapping *mapping = [super objectMappingForServerProfile:serverProfile];
    [mapping mapPropertiesFromDictionary:@{
                                           @"dimension"   : @"dimension",
                                           }];
    return mapping;
}

@end
