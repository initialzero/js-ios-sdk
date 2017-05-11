/*
 * Copyright © 2017. TIBCO Software Inc. All Rights Reserved. Confidential & Proprietary.
 */

/**
 @author Oleksii Gubariev ogubarie@tibco.com
 @since 2.7
 */

#import <Foundation/Foundation.h>
#import "JSObjectMappingsProtocol.h"
#import "JSAdHocQuerySelect.h"
#import "JSAdHocQueryFrom.h"
#import "JSAdHocQueryWhere.h"
#import "JSAdHocQueryGroupBy.h"
#import "JSAdHocQueryOrderBy.h"

typedef NS_ENUM(NSInteger, JSAdHocQueryType) {
    JSAdHocQueryType_Undefined = 0,
    JSAdHocQueryType_MultiLevel = 1,
    JSAdHocQueryType_MultiAxes = 2
};

@interface JSAdHocQueryModel : NSObject <JSObjectMappingsProtocol>
@property (nonatomic, assign) JSAdHocQueryType queryType;

@property (nonatomic, strong) JSAdHocQuerySelect *select;
@property (nonatomic, strong) JSAdHocQueryFrom *from;
@property (nonatomic, strong) JSAdHocQueryWhere *where;
@property (nonatomic, strong) JSAdHocQueryGroupBy *groupBy;
@property (nonatomic, strong) JSAdHocQueryOrderBy *orderBy;

+ (EKObjectMapping *)objectMappingForServerProfile:(JSProfile *)serverProfile NS_REQUIRES_SUPER;

@end
