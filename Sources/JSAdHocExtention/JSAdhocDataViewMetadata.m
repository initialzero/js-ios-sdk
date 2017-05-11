/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdhocDataViewMetadata.h"
#import "JSAdHocMultiAxesQueryModel.h"
#import "JSAdHocMultiLevelQueryModel.h"

#import "EKMapper.h"
#import "EKSerializer.h"

@implementation JSAdhocDataViewMetadata
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    EKObjectMapping *mapping = [super objectMappingForServerProfile:serverProfile];
    [mapping mapKeyPath:@"dataSource.dataSourceReference.uri" toProperty:@"dataSourceReference"];
    
    [mapping mapKeyPath:@"query" toProperty:@"query" withValueBlock:^id(NSString *key, id value) {
        NSString *queryTypeKey = [value allKeys].lastObject;
        JSAdHocQueryModel *query;
        if ([queryTypeKey isEqualToString:@"multiLevel"]) {
            query = [EKMapper objectFromExternalRepresentation:value[queryTypeKey] withMapping:[JSAdHocMultiLevelQueryModel objectMappingForServerProfile:serverProfile]];
            query.queryType = JSAdHocQueryType_MultiLevel;
        } else if ([queryTypeKey isEqualToString:@"multiAxes"]) {
            query = [EKMapper objectFromExternalRepresentation:value[queryTypeKey] withMapping:[JSAdHocMultiAxesQueryModel objectMappingForServerProfile:serverProfile]];
            query.queryType = JSAdHocQueryType_MultiAxes;
        }
        return query;
    } reverseBlock:^id(id value) {
        JSAdHocQueryModel *queryModel = (JSAdHocQueryModel *)value;
        if (queryModel.queryType == JSAdHocQueryType_MultiLevel) {
            return @{ @"multiLevel" : [EKSerializer serializeObject:value withMapping:[JSAdHocMultiLevelQueryModel objectMappingForServerProfile:serverProfile]]};
        } else if (queryModel.queryType == JSAdHocQueryType_MultiAxes) {
            return @{ @"multiAxes" : [EKSerializer serializeObject:value withMapping:[JSAdHocMultiAxesQueryModel objectMappingForServerProfile:serverProfile]]};
        }
        return nil;
    }];
    
    return mapping;
}
@end
