/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereParameter.h"
#import "JSAdHocQueryWhereParameterValue.h"

#import "EKSerializer.h"
#import "EKMapper.h"

@implementation JSAdHocQueryWhereParameter

+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile type:(NSString *)type{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"name"]];
        
        EKObjectMapping *parameterValueMapping = [JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:type];
        
        NSString *valueKeyPath = [NSString stringWithFormat:@"expression.object.%@", type];
        [mapping mapKeyPath:valueKeyPath toProperty:@"parameterValue" withValueBlock:^id(NSString *key, id value) {
            JSAdHocQueryWhereParameterValue *parameterValue = [EKMapper objectFromExternalRepresentation:value withMapping:parameterValueMapping];
            parameterValue.type = type;
            return parameterValue;
        } reverseBlock:^id(id value) {
            return [EKSerializer serializeObject:value withMapping:parameterValueMapping];
        }];
    }];
}

@end
