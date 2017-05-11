/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryModel.h"

@implementation JSAdHocQueryModel
#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping hasOne:[JSAdHocQuerySelect class] forKeyPath:@"select" forProperty:@"select" withObjectMapping:[JSAdHocQuerySelect objectMappingForServerProfile:serverProfile]];
        [mapping hasOne:[JSAdHocQueryFrom class] forKeyPath:@"from" forProperty:@"from" withObjectMapping:[JSAdHocQueryFrom objectMappingForServerProfile:serverProfile]];
        [mapping hasOne:[JSAdHocQueryWhere class] forKeyPath:@"where" forProperty:@"where" withObjectMapping:[JSAdHocQueryWhere objectMappingForServerProfile:serverProfile]];
    }];
}

@end
