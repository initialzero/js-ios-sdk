/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereParameterValue.h"

#import "JSAdHocQueryWhereParameterBooleanValue.h"
#import "JSAdHocQueryWhereParameterDateValue.h"
#import "JSAdHocQueryWhereParameterDecimalValue.h"
#import "JSAdHocQueryWhereParameterIntegerValue.h"
#import "JSAdHocQueryWhereParameterRangeValue.h"
#import "JSAdHocQueryWhereParameterRelativeDateRangeValue.h"
#import "JSAdHocQueryWhereParameterStringValue.h"
#import "JSAdHocQueryWhereParameterTimeValue.h"
#import "JSAdHocQueryWhereParameterTimestampValue.h"
#import "JSAdHocQueryWhereParameterListValue.h"
#import "JSAdHocQueryWhereParameterVariableValue.h"

@implementation JSAdHocQueryWhereParameterValue
+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile {
    @throw [NSException exceptionWithName:@"Method implementation is missing" reason:[NSString stringWithFormat:@"You need to implement \"%@\" method in \"%@\" class", NSStringFromSelector(_cmd), NSStringFromClass(self.class)] userInfo:nil];
}

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile type:(NSString *)type
{
    if ([type isEqualToString:@"boolean"]) {
        return [JSAdHocQueryWhereParameterBooleanValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"byte"] || [type isEqualToString:@"short"] || [type isEqualToString:@"integer"] || [type isEqualToString:@"long"]) {
        return [JSAdHocQueryWhereParameterIntegerValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"float"] || [type isEqualToString:@"double"]) {
        return [JSAdHocQueryWhereParameterDecimalValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"string"] || [type isEqualToString:@"bigInteger"] || [type isEqualToString:@"bigDecimal"]) {
        return [JSAdHocQueryWhereParameterStringValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"date"]) {
        return [JSAdHocQueryWhereParameterDateValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"timestamp"]) {
        return [JSAdHocQueryWhereParameterTimestampValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"time"]) {
        return [JSAdHocQueryWhereParameterTimeValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"range"]) {
        return [JSAdHocQueryWhereParameterRangeValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"relativeDateRange"]) {
        return [JSAdHocQueryWhereParameterRelativeDateRangeValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"list"]) {
        return [JSAdHocQueryWhereParameterListValue objectMappingForServerProfile:serverProfile];
    } else if ([type isEqualToString:@"variable"]) {
        return [JSAdHocQueryWhereParameterVariableValue objectMappingForServerProfile:serverProfile];
    }
    return nil;
}
@end
