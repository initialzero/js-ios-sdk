/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSDataSet.h"
#import "JSFlatDataSet.h"
#import "JSMultiLevelDataSet.h"
#import "JSMultiAxesDataSet.h"

@implementation JSDataSet
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"counts"]];
    }];
}

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile fields:(NSArray <NSString *> *)fields {
    NSSet *fieldsSet = [NSSet setWithArray:fields];
    
    if ([fieldsSet containsObject:@"fields"]) {
        return [JSFlatDataSet objectMappingForServerProfile:serverProfile];
    } else if ([fieldsSet containsObject:@"levels"] && [fieldsSet containsObject:@"levelDataNodes"]) {
        return [JSMultiLevelDataSet objectMappingForServerProfile:serverProfile];
    } else if ([fieldsSet containsObject:@"data"] && [fieldsSet containsObject:@"axes"]) {
        return [JSMultiAxesDataSet objectMappingForServerProfile:serverProfile];
    }
    return nil;
}

@end
