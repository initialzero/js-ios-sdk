/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSFlatDataSet.h"
#import "JSFlatDataSetField.h"
#import "JSFlatDataSetRow.h"

@implementation JSFlatDataSet
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    EKObjectMapping *mapping = [super objectMappingForServerProfile:serverProfile];
    
    [mapping hasMany:[JSFlatDataSetField class] forKeyPath:@"fields" forProperty:@"fields" withObjectMapping:[JSFlatDataSetField objectMappingForServerProfile:serverProfile]];
    
    [mapping mapKeyPath:@"rows" toProperty:@"rows" withValueBlock:^id(NSString *key, id value) {
        NSArray *sourceRowsArray = (NSArray *)value;
        NSMutableArray *rowsArray = [NSMutableArray array];
        for (NSArray *currentRowValues in sourceRowsArray) {
            JSFlatDataSetRow *currentRow = [JSFlatDataSetRow new];
            currentRow.values = currentRowValues;
            [rowsArray addObject:currentRow];
        }
        return rowsArray;
    }];
    
    return mapping;
}
@end
