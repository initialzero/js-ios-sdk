/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhere.h"
#import "JSAdHocQueryWhereParameter.h"
#import "JSAdHocQueryWhereParameterString.h"

#import "EKMapper.h"
#import "EKSerializer.h"

@implementation JSAdHocQueryWhere
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"filterExpression"]];
        
        [mapping mapKeyPath:@"filterExpression.object" toProperty:@"mainOperand" withValueBlock:^id(NSString *key, id value) {
            NSString *typeKey = [value allKeys].lastObject;
            EKObjectMapping *mapping = [JSAdHocQueryWhereOperand objectMappingForServerProfile:serverProfile operandType:typeKey];
            JSAdHocQueryWhereOperand *mainOperand = [EKMapper objectFromExternalRepresentation:value[typeKey] withMapping:mapping];
            mainOperand.type = typeKey;
            return mainOperand;
        } reverseBlock:^id(id value) {
            JSAdHocQueryWhereOperand *mainOperand = (JSAdHocQueryWhereOperand *)value;
            NSString *typeKey = mainOperand.type;
            EKObjectMapping *mapping = [JSAdHocQueryWhereOperand objectMappingForServerProfile:serverProfile operandType:typeKey];
            return @{typeKey : [EKSerializer serializeObject:mainOperand withMapping:mapping]};
        }];
            
        [mapping mapKeyPath:@"parameters" toProperty:@"parameters" withValueBlock:^id(NSString *key, id value) {
            NSArray *paramsSourceArray = value;
            NSMutableArray *parametersArray = [NSMutableArray array];
            for (NSDictionary *parameterDictionary in paramsSourceArray) {
                EKObjectMapping *mapping;
                NSDictionary *expression = parameterDictionary[@"expression"];
                NSString *expressionTypeKey = [expression allKeys].lastObject;
                if ([expressionTypeKey isEqualToString:@"object"]) {
                    NSString *valueTypeKey = [expression[expressionTypeKey] allKeys].lastObject;
                    mapping = [JSAdHocQueryWhereParameter objectMappingForServerProfile:serverProfile type:valueTypeKey];
                } else {
                    mapping = [JSAdHocQueryWhereParameterString objectMappingForServerProfile:serverProfile];
                }
                id parameter = [EKMapper objectFromExternalRepresentation:parameterDictionary withMapping:mapping];
                [parametersArray addObject:parameter];

            }
            return parametersArray;
        } reverseBlock:^id(id value) {
            NSArray *paramsArray = value;
            NSMutableArray *parameterRepresentationsArray = [NSMutableArray array];
            for (id parameter in paramsArray) {
                EKObjectMapping *mapping;
                if ([parameter isKindOfClass:[JSAdHocQueryWhereParameterString class]]) {
                    mapping = [JSAdHocQueryWhereParameterString objectMappingForServerProfile:serverProfile];
                } else {
                    NSString *valueTypeKey = [parameter parameterValue].type;
                    mapping = [JSAdHocQueryWhereParameter objectMappingForServerProfile:serverProfile type:valueTypeKey];
                }
                NSDictionary *parameterRepresentation = [EKSerializer serializeObject:parameter withMapping:mapping];
                [parameterRepresentationsArray addObject:parameterRepresentation];
            }
            return parameterRepresentationsArray;
        }];
    }];
}

@end
