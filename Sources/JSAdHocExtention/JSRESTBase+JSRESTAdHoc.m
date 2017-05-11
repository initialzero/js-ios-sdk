/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */


#import "JSRESTBase+JSRESTAdHoc.h"
#import "JSResourceLookup.h"
#import "JSAdhocDataViewMetadata.h"
#import "JSRESTBase+JSRESTResource.h"
#import "JSAdHocQueryExecutionRequest.h"
#import "JSAdHocQueryExecutionResponse.h"

#import "JSFlatDataSet.h"
#import "JSFlatDataSetRow.h"
#import "JSFlatDataSetField.h"

@implementation JSRESTBase(JSRESTAdHoc)

- (void)adHocDataViewMetadataWithURI:(NSString *)resourceURI
                          completion:(void(^)(JSAdhocDataViewMetadata *adHoc, NSError *error))completion
{
    [self resourceLookupForURI:resourceURI
                  resourceType:kJS_WS_TYPE_ADHOC_DATA_VIEW
                    modelClass:[JSAdhocDataViewMetadata class]
               completionBlock:^(JSOperationResult *result) {
                   if (result.error) {
                       completion(nil, result.error);
                   } else {
                       JSAdhocDataViewMetadata *resource = result.objects.firstObject;
                       resource.resourceType = kJS_WS_TYPE_ADHOC_DATA_VIEW;
                       if (resource) {
                           completion(resource, nil);
                       } else {
                           NSError *error = [JSErrorBuilder errorWithCode:JSDataMappingErrorCode];
                           completion(nil, error);
                       }
                   }
               }];
}


- (void)runQueryExecution:(JSAdHocQueryExecutionRequest *)queryRequest
               completion:(JSRequestCompletionBlock)completion
{
    NSString *uri = kJS_QUERY_EXECUTION_URI;

    JSRequest *request = [[JSRequest alloc] initWithUri:uri];
    request.method = JSRequestHTTPMethodPOST;
    request.restVersion = JSRESTVersion_2;
    request.completionBlock = completion;

    request.body = queryRequest;
    
    request.objectMapping = [JSMapping mappingWithObjectMapping:[JSAdHocQueryExecutionResponse objectMappingForServerProfile:self.serverProfile] keyPath:nil];
    
    request.additionalHeaders = @{kJSRequestContentType : queryRequest.contentType,
                                  kJSRequestResponceType : queryRequest.acceptType};
    [self sendRequest:request];
}

@end
