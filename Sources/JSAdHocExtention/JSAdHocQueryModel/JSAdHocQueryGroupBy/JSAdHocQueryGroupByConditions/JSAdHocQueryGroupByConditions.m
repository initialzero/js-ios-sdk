/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryGroupByConditions.h"
#import "JSAdHocQueryGroupByLevel.h"
#import "JSAdHocQueryGroupByAllLevel.h"
#import "JSAdHocQueryGroupByExpansionLevel.h"
#import "JSAdHocQueryGroupByExpansionMember.h"
#import "JSAdHocQueryAggregation.h"
#import "EKMapper.h"
#import "EKSerializer.h"

NSString * const kJSAdHocQueryGroupByItemsLevelKey = @"level";
NSString * const kJSAdHocQueryGroupByItemsAllLevelKey = @"allLevel";
NSString * const kJSAdHocQueryGroupByItemsAggregationsKey = @"aggregations";
NSString * const kJSAdHocQueryGroupByItemsMemberKey = @"member";

@implementation JSAdHocQueryGroupByConditions
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        
        [mapping mapKeyPath:@"items" toProperty:@"items" withValueBlock:^id(NSString *key, id value) {
            NSArray *itemsSourceArray = value;
            NSMutableArray *itemsArray = [NSMutableArray array];
            for (NSDictionary *item in itemsSourceArray) {
                EKObjectMapping *mapping = nil;
                NSString *rootKey = [[item allKeys] lastObject];
                if ([rootKey isEqualToString:kJSAdHocQueryGroupByItemsLevelKey]) {
                    mapping = [JSAdHocQueryGroupByLevel objectMappingForServerProfile:serverProfile];
                } else if ([rootKey isEqualToString:kJSAdHocQueryGroupByItemsAllLevelKey]){
                    mapping = [JSAdHocQueryGroupByAllLevel objectMappingForServerProfile:serverProfile];
                } else if ([rootKey isEqualToString:kJSAdHocQueryGroupByItemsAggregationsKey]){
                    mapping = [JSAdHocQueryAggregation objectMappingForServerProfile:serverProfile];
                }
                if (mapping) {
                    [itemsArray addObject:[EKMapper objectFromExternalRepresentation:[item objectForKey:rootKey] withMapping:mapping]];
                }
            }
            return itemsArray;
        } reverseBlock:^id(id value) {
            NSArray *itemsArray = value;
            NSMutableArray *itemsSerializedArray = [NSMutableArray array];
            for (id item in itemsArray) {
                EKObjectMapping *mapping = nil;
                NSString *rootKey = nil;
                if ([item isKindOfClass:[JSAdHocQueryGroupByLevel class]]) {
                    rootKey = kJSAdHocQueryGroupByItemsLevelKey;
                    mapping = [JSAdHocQueryGroupByLevel objectMappingForServerProfile:serverProfile];
                } else if ([item isKindOfClass:[JSAdHocQueryGroupByAllLevel class]]){
                    rootKey = kJSAdHocQueryGroupByItemsAllLevelKey;
                    mapping = [JSAdHocQueryGroupByAllLevel objectMappingForServerProfile:serverProfile];
                } else if ([item isKindOfClass:[JSAdHocQueryAggregation class]]){
                    rootKey = kJSAdHocQueryGroupByItemsAggregationsKey;
                    mapping = [JSAdHocQueryAggregation objectMappingForServerProfile:serverProfile];
                }
                if (mapping) {
                    [itemsSerializedArray addObject: @{ rootKey : [EKSerializer serializeObject:item withMapping:mapping]}];
                }
            }
            return itemsSerializedArray;
        }];
        
        [mapping mapKeyPath:@"expansions" toProperty:@"expansions" withValueBlock:^id(NSString *key, id value) {
            NSArray *itemsSourceArray = value;
            NSMutableArray *itemsArray = [NSMutableArray array];
            for (NSDictionary *item in itemsSourceArray) {
                EKObjectMapping *mapping = nil;
                NSString *rootKey = [[item allKeys] lastObject];
                if ([rootKey isEqualToString:kJSAdHocQueryGroupByItemsLevelKey]) {
                    mapping = [JSAdHocQueryGroupByExpansionLevel objectMappingForServerProfile:serverProfile];
                } else if ([rootKey isEqualToString:kJSAdHocQueryGroupByItemsMemberKey]){
                    mapping = [JSAdHocQueryGroupByExpansionMember objectMappingForServerProfile:serverProfile];
                }
                if (mapping) {
                    [itemsArray addObject:[EKMapper objectFromExternalRepresentation:[item objectForKey:rootKey] withMapping:mapping]];
                }
            }
            return itemsArray;
        } reverseBlock:^id(id value) {
            NSArray *itemsArray = value;
            NSMutableArray *itemsSerializedArray = [NSMutableArray array];
            for (id item in itemsArray) {
                EKObjectMapping *mapping = nil;
                NSString *rootKey = nil;
                if ([item isKindOfClass:[JSAdHocQueryGroupByExpansionLevel class]]) {
                    rootKey = kJSAdHocQueryGroupByItemsLevelKey;
                    mapping = [JSAdHocQueryGroupByExpansionLevel objectMappingForServerProfile:serverProfile];
                } else if ([item isKindOfClass:[JSAdHocQueryGroupByExpansionMember class]]){
                    rootKey = kJSAdHocQueryGroupByItemsMemberKey;
                    mapping = [JSAdHocQueryGroupByExpansionMember objectMappingForServerProfile:serverProfile];
                }
                if (mapping) {
                    [itemsSerializedArray addObject: @{ rootKey : [EKSerializer serializeObject:item withMapping:mapping]}];
                }
            }
            return itemsSerializedArray;
        }];
    }];
}

@end
