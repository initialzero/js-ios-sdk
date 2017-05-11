/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryWhereOperand.h"
#import "JSAdHocQueryWhereParameterValue.h"
#import "JSAdHocQueryWhereOperandFunction.h"
#import "JSAdHocQueryWhereOperandOperation.h"

#import "EKMapper.h"
#import "EKSerializer.h"

@implementation JSAdHocQueryWhereOperand
+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapKeyPath:@"operands" toProperty:@"operands" withValueBlock:^id(NSString *key, id value) {
            NSArray *operandsSourceArray = value;
            NSMutableArray *operandsArray = [NSMutableArray array];
            for (NSDictionary *operandDictionary in operandsSourceArray) {
                NSString *typeKey = [operandDictionary allKeys].lastObject;
                EKObjectMapping *mapping = [self objectMappingForServerProfile:serverProfile operandType:typeKey];
                id operand = [EKMapper objectFromExternalRepresentation:operandDictionary[typeKey] withMapping:mapping];
                [operand setType:typeKey];
                [operandsArray addObject:operand];
            }
            return operandsArray;
        } reverseBlock:^id(id value) {
            NSArray *operandsArray = value;
            NSMutableArray *operandsRepresentationsArray = [NSMutableArray array];
            for (JSAdHocQueryWhereOperand *operand in operandsArray) {
                NSString *typeKey = operand.type;
                EKObjectMapping *mapping = [self objectMappingForServerProfile:serverProfile operandType:typeKey];
                NSDictionary *operandRepresentation = [EKSerializer serializeObject:operand withMapping:mapping];
                [operandsRepresentationsArray addObject:@{typeKey : operandRepresentation}];
            }
            return operandsRepresentationsArray;
        }];
    }];
}

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile operandType:(NSString *)operandType
{
    EKObjectMapping *mapping = [JSAdHocQueryWhereParameterValue objectMappingForServerProfile:serverProfile type:operandType];
    if (!mapping) {
        if ([operandType isEqualToString:@"function"]) {
            mapping = [JSAdHocQueryWhereOperandFunction objectMappingForServerProfile:serverProfile];
        } else if ([[JSAdHocQueryWhereOperandOperation supportedOperations] containsObject:[operandType lowercaseString]]) {
            mapping = [JSAdHocQueryWhereOperandOperation objectMappingForServerProfile:serverProfile];
        } else {
            mapping = [JSAdHocQueryWhereOperand objectMappingForServerProfile:serverProfile];
        }
    }
    return mapping;
}

@end
