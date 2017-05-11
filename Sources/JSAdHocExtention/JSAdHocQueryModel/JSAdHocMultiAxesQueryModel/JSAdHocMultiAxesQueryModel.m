/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocMultiAxesQueryModel.h"

#import "JSAdHocMultiAxesQueryGroupBy.h"
#import "JSAdHocQueryOrderBy.h"
#import "JSAdHocQueryOrderByLevel.h"
#import "JSAdHocQueryOrderByMember.h"
#import "JSAdHocQueryOrderByBottomN.h"
#import "JSAdHocQueryOrderByTopN.h"

#import "EKMapper.h"
#import "EKSerializer.h"

@implementation JSAdHocMultiAxesQueryModel
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    EKObjectMapping *mapping = [super objectMappingForServerProfile:serverProfile];

    [mapping hasOne:[JSAdHocMultiAxesQueryGroupBy class] forKeyPath:@"groupBy" forProperty:@"groupBy" withObjectMapping:[JSAdHocMultiAxesQueryGroupBy objectMappingForServerProfile:serverProfile]];

    [mapping mapKeyPath:@"orderBy" toProperty:@"orderBy" withValueBlock:^id(NSString *key, id value) {
        NSArray *groupsSourceArray = value;
        NSMutableArray *groupsArray = [NSMutableArray array];
        for (NSDictionary *group in groupsSourceArray) {
            EKObjectMapping *mapping = nil;
            NSString *rootKey = [[group allKeys] lastObject];
            if ([rootKey isEqualToString:@"level"]) {
                mapping = [JSAdHocQueryOrderByLevel objectMappingForServerProfile:serverProfile];
            } else if ([rootKey isEqualToString:@"member"]){
                mapping = [JSAdHocQueryOrderByMember objectMappingForServerProfile:serverProfile];
            } else if ([rootKey isEqualToString:@"topN"]){
                mapping = [JSAdHocQueryOrderByTopN objectMappingForServerProfile:serverProfile];
            } else if ([rootKey isEqualToString:@"bottomN"]){
                mapping = [JSAdHocQueryOrderByBottomN objectMappingForServerProfile:serverProfile];
            }
            
            if (mapping) {
                [groupsArray addObject:[EKMapper objectFromExternalRepresentation:[group objectForKey:rootKey] withMapping:mapping]];
            }
        }
        JSAdHocQueryOrderBy *orderBy = [JSAdHocQueryOrderBy new];
        orderBy.orderByConditions = groupsArray;
        return orderBy;
    } reverseBlock:^id(id value) {
        NSArray *itemsArray = [(JSAdHocQueryOrderBy *)value orderByConditions];
        NSMutableArray *itemsSerializedArray = [NSMutableArray array];
        for (id item in itemsArray) {
            EKObjectMapping *mapping = nil;
            NSString *rootKey = nil;
            if ([item isKindOfClass:[JSAdHocQueryOrderByLevel class]]) {
                rootKey = @"level";
                mapping = [JSAdHocQueryOrderByLevel objectMappingForServerProfile:serverProfile];
            } else if ([item isKindOfClass:[JSAdHocQueryOrderByMember class]]){
                rootKey = @"member";
                mapping = [JSAdHocQueryOrderByMember objectMappingForServerProfile:serverProfile];
            } else if ([item isKindOfClass:[JSAdHocQueryOrderByTopN class]]){
                rootKey = @"topN";
                mapping = [JSAdHocQueryOrderByTopN objectMappingForServerProfile:serverProfile];
            } else if ([item isKindOfClass:[JSAdHocQueryOrderByBottomN class]]){
                rootKey = @"bottomN";
                mapping = [JSAdHocQueryOrderByBottomN objectMappingForServerProfile:serverProfile];
            }
            
            if (mapping) {
                [itemsSerializedArray addObject: @{ rootKey : [EKSerializer serializeObject:item withMapping:mapping]}];
            }
        }
        return itemsSerializedArray;
    }];
    
    return mapping;
}

@end
