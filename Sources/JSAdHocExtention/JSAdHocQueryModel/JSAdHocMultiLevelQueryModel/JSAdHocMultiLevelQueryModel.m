/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocMultiLevelQueryModel.h"
#import "JSAdHocMultiLevelQueryGroupBy.h"
#import "JSAdHocQueryGroupByGroup.h"
#import "JSAdHocQueryGroupByAllGroup.h"
#import "JSAdHocQueryGroupByRollup.h"

#import "JSAdHocQueryOrderBy.h"
#import "JSAdHocQueryOrderByLevel.h"

#import "EKMapper.h"
#import "EKSerializer.h"

@implementation JSAdHocMultiLevelQueryModel
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    EKObjectMapping *mapping = [super objectMappingForServerProfile:serverProfile];
    
    [mapping mapKeyPath:@"groupBy" toProperty:@"groupBy" withValueBlock:^id(NSString *key, id value) {
        NSArray *groupsSourceArray = value;
        NSMutableArray *groupsArray = [NSMutableArray array];
        for (NSDictionary *group in groupsSourceArray) {
            EKObjectMapping *mapping = nil;
            NSString *rootKey = [[group allKeys] lastObject];
            if ([rootKey isEqualToString:@"group"]) {
                mapping = [JSAdHocQueryGroupByGroup objectMappingForServerProfile:serverProfile];
            } else if ([rootKey isEqualToString:@"allGroup"]){
                mapping = [JSAdHocQueryGroupByAllGroup objectMappingForServerProfile:serverProfile];
            }  else if ([rootKey isEqualToString:@"rollup"]){
                mapping = [JSAdHocQueryGroupByRollup objectMappingForServerProfile:serverProfile];
            }
            
            if (mapping) {
                [groupsArray addObject:[EKMapper objectFromExternalRepresentation:[group objectForKey:rootKey] withMapping:mapping]];
            }
        }
        JSAdHocMultiLevelQueryGroupBy *groupBy = [JSAdHocMultiLevelQueryGroupBy new];
        groupBy.groupsConditions = groupsArray;
        return groupBy;
    } reverseBlock:^id(id value) {
        NSArray *itemsArray = [(JSAdHocMultiLevelQueryGroupBy *)value groupsConditions];
        NSMutableArray *itemsSerializedArray = [NSMutableArray array];
        for (id item in itemsArray) {
            EKObjectMapping *mapping = nil;
            NSString *rootKey = nil;
            if ([item isMemberOfClass:[JSAdHocQueryGroupByGroup class]]) {
                rootKey = @"group";
                mapping = [JSAdHocQueryGroupByGroup objectMappingForServerProfile:serverProfile];
            } else if ([item isMemberOfClass:[JSAdHocQueryGroupByAllGroup class]]){
                rootKey = @"allGroup";
                mapping = [JSAdHocQueryGroupByAllGroup objectMappingForServerProfile:serverProfile];
            } else if ([item isMemberOfClass:[JSAdHocQueryGroupByRollup class]]){
                rootKey = @"rollup";
                mapping = [JSAdHocQueryGroupByRollup objectMappingForServerProfile:serverProfile];
            }
            
            if (mapping) {
                [itemsSerializedArray addObject: @{ rootKey : [EKSerializer serializeObject:item withMapping:mapping]}];
            }
        }
        return itemsSerializedArray;
    }];
    
    [mapping mapKeyPath:@"orderBy" toProperty:@"orderBy" withValueBlock:^id(NSString *key, id value) {
        EKObjectMapping *mapping = [JSAdHocQueryOrderByLevel objectMappingForServerProfile:serverProfile];
        JSAdHocQueryOrderBy *orderBy = [JSAdHocQueryOrderBy new];
        orderBy.orderByConditions = [EKMapper arrayOfObjectsFromExternalRepresentation:value withMapping:mapping];
        return orderBy;
    } reverseBlock:^id(id value) {
        NSArray *itemsArray = [(JSAdHocQueryOrderBy *)value orderByConditions];
        EKObjectMapping *mapping = [JSAdHocQueryOrderByLevel objectMappingForServerProfile:serverProfile];
        return [EKSerializer serializeCollection:itemsArray withMapping:mapping];
    }];
    
    return mapping;
}

@end
