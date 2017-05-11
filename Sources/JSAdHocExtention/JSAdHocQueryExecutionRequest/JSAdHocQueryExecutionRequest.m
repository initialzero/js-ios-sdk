/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSAdHocQueryExecutionRequest.h"

#import "EKSerializer.h"

@interface JSAdHocQueryExecutionRequest ()
@property (nonatomic, strong, readwrite) JSAdHocQueryModel *query;

@property (nonatomic, strong, readwrite) NSString *contentType;
@property (nonatomic, strong, readwrite) NSString *acceptType;

@end

@implementation JSAdHocQueryExecutionRequest
- (instancetype)initWithQuery:(JSAdHocQueryModel *)query {
    self = [super init];
    if (self) {
        _query = query;
    }
    return self;
}

#pragma mark - JSObjectMappingsProtocol
+ (nonnull EKObjectMapping *)objectMappingForServerProfile:(nonnull JSProfile *)serverProfile {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"dataSourceUri"]];
        [mapping hasOne:[JSAdHocQueryExecutionParameters class] forKeyPath:@"params" forProperty:@"params" withObjectMapping:[JSAdHocQueryExecutionParameters objectMappingForServerProfile:serverProfile]];
        
        [mapping mapKeyPath:@"query" toProperty:@"query" withValueBlock:^id(NSString *key, id value) {
            @throw [NSException exceptionWithName:@"MappingException"
                                           reason:@"JSAdHocQueryExecutionRequest should map to JSON only!"
                                         userInfo:nil];
        } reverseBlock:^id(id value) {
            EKObjectMapping *mapping = [[value class] objectMappingForServerProfile:serverProfile];
            return [EKSerializer serializeObject:value withMapping:mapping];
        }];
    }];
}

- (NSString *)contentType {
    if (!_contentType) {
        switch (self.query.queryType) {
            case JSAdHocQueryType_MultiAxes:
                _contentType = @"application/execution.multiAxesQuery+json";
                break;
            case JSAdHocQueryType_MultiLevel:
                _contentType = @"application/execution.multiLevelQuery+json";
                break;
            case JSAdHocQueryType_Undefined:
                _contentType = @"application/execution.providedQuery+json";
                break;
        }
    }
    return _contentType;
}

- (NSString *)acceptType {
    if (!_acceptType) {
        switch (self.query.queryType) {
            case JSAdHocQueryType_MultiAxes:
                _acceptType = @"application/multiAxesData+json";
                break;
            case JSAdHocQueryType_MultiLevel:
                _acceptType = @"application/flatData+json";
                break;
            case JSAdHocQueryType_Undefined:
                _acceptType = @"application/flatData+json";
                break;
        }
    }
    return _acceptType;
}

@end
