/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryAggregation.h"

@implementation JSAdHocQueryAggregation
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromDictionary:@{
                                               @"type" : @"type",
                                               @"id" : @"aggregationID",
                                               @"functionName" : @"functionName",
                                               @"measure" : @"measure",
                                               @"expression" : @"expression",
                                               @"aggregateExpressionObject" : @"aggregateExpressionObject",
                                               @"fieldRef" : @"fieldRef",
                                               }];
    }];
}

@end
