/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereOperandOperation.h"

@implementation JSAdHocQueryWhereOperandOperation
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    EKObjectMapping *mapping = [super objectMappingForServerProfile:serverProfile];
    [mapping mapPropertiesFromArray:@[@"paren"]];
    return mapping;
}

+ (NSSet *)supportedOperations {
    return [NSSet setWithObjects:@"and", @"or", @"not", nil];
}
@end
