/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereParameterRangeValue.h"
#import "EKMapper.h"
#import "EKSerializer.h"

@implementation JSAdHocQueryWhereParameterRangeValue

#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        
        [mapping mapKeyPath:@"start" toProperty:@"startValue" withValueBlock:^id(NSString *key, id value) {
            NSString *startObjectKey = [value[@"boundary"] allKeys].lastObject;
            NSString *startObjectKeyPath = [NSString stringWithFormat:@"boundary.%@",startObjectKey];
            id representation = [value valueForKeyPath:startObjectKeyPath];
            
            EKObjectMapping *startObjectMapping = [JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:startObjectKey];
            JSAdHocQueryWhereParameterValue *startValue = [EKMapper objectFromExternalRepresentation:representation withMapping:startObjectMapping];
            [startValue setType:startObjectKey];
            return startValue;
        } reverseBlock:^id(id value) {
            JSAdHocQueryWhereParameterValue *parameterValue = (JSAdHocQueryWhereParameterValue *)value;
            NSString *startObjectKey = parameterValue.type;
            EKObjectMapping *startObjectMapping = [JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:startObjectKey];
            return @{@"boundary" : @{startObjectKey : [EKSerializer serializeObject:parameterValue withMapping:startObjectMapping]}};
        }];
        
        [mapping mapKeyPath:@"end" toProperty:@"endValue" withValueBlock:^id(NSString *key, id value) {
            NSString *endObjectKey = [value[@"boundary"] allKeys].lastObject;
            NSString *endObjectKeyPath = [NSString stringWithFormat:@"boundary.%@",endObjectKey];
            id representation = [value valueForKeyPath:endObjectKeyPath];
            
            EKObjectMapping *startObjectMapping = [JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:endObjectKey];
            JSAdHocQueryWhereParameterValue *startValue = [EKMapper objectFromExternalRepresentation:representation withMapping:startObjectMapping];
            [startValue setType:endObjectKey];
            return startValue;
        } reverseBlock:^id(id value) {
            JSAdHocQueryWhereParameterValue *parameterValue = (JSAdHocQueryWhereParameterValue *)value;
            NSString *endObjectKey = parameterValue.type;
            EKObjectMapping *endObjectMapping = [JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:endObjectKey];
            return @{@"boundary" : @{endObjectKey : [EKSerializer serializeObject:parameterValue withMapping:endObjectMapping]}};
        }];
    }];
}

@end
