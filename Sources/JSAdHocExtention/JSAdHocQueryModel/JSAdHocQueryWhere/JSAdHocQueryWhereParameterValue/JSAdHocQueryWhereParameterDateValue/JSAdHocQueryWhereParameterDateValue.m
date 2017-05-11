/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereParameterDateValue.h"
#import "JSDateFormatterFactory.h"

@implementation JSAdHocQueryWhereParameterDateValue
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        NSDateFormatter *dateFormatter = [[JSDateFormatterFactory sharedFactory] formatterWithPattern:kJSAdHocQueryWhereParameterDateValueFormat];
        [mapping mapKeyPath:@"value" toProperty:@"value" withDateFormatter:dateFormatter];
    }];
}

@end
