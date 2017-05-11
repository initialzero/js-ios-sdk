/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereParameterListValue.h"
#import "EKMapper.h"
#import "EKSerializer.h"

@implementation JSAdHocQueryWhereParameterListValue
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapKeyPath:@"items" toProperty:@"value" withValueBlock:^id(NSString *key, id value) {
            NSArray *itemsSourceArray = value;
            NSMutableArray *itemsArray = [NSMutableArray array];
            for (NSDictionary *itemDictionary in itemsSourceArray) {
                NSString *typeKey = [itemDictionary allKeys].lastObject;
                EKObjectMapping *parameterValueMapping = [JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:typeKey];
                JSAdHocQueryWhereParameterValue *parameterValue = [EKMapper objectFromExternalRepresentation:itemDictionary[typeKey] withMapping:parameterValueMapping];
                parameterValue.type = typeKey;
                [itemsArray addObject:parameterValue];
            }
            return itemsArray;
        } reverseBlock:^id(id value) {
            NSArray *itemsArray = value;
            NSMutableArray *parameterValueRepresentationsArray = [NSMutableArray array];
            for (JSAdHocQueryWhereParameterValue *parameterValue in itemsArray) {
                NSDictionary *parameterRepresentation = [EKSerializer serializeObject:parameterValue withMapping:[JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:parameterValue.type]];
                [parameterValueRepresentationsArray addObject:@{parameterValue.type : parameterRepresentation}];
            }
            return parameterValueRepresentationsArray;
        }];
    }];
}
@end
