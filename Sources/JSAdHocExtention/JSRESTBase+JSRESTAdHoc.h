/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */


#import "JSRESTBase.h"
@class JSAdhocDataViewMetadata;
@class JSAdHocQueryExecutionRequest;

@interface JSRESTBase(JSRESTAdHoc)
- (void)adHocDataViewMetadataWithURI:(NSString *)resourceURI
                          completion:(void(^)(JSAdhocDataViewMetadata *adHoc, NSError *error))completion;

- (void)runQueryExecution:(JSAdHocQueryExecutionRequest *)queryRequest
               completion:(JSRequestCompletionBlock)completion;

@end
