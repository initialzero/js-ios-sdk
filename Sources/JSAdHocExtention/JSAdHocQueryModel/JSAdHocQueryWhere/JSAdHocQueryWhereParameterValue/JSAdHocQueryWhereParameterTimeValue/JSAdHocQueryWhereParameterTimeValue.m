/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereParameterTimeValue.h"
#import "JSDateFormatterFactory.h"

@implementation JSAdHocQueryWhereParameterTimeValue
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        NSDateFormatter *dateFormatter = [[JSDateFormatterFactory sharedFactory] formatterWithPattern:kJSAdHocQueryWhereParameterTimeValueFormat];
        [mapping mapKeyPath:@"value" toProperty:@"value" withDateFormatter:dateFormatter];
    }];
}

@end
