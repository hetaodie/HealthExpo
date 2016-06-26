//
//  HttpUtils.h
//  linphone
//
//  Created by aicall on 13-5-24.
//
//

#import <Foundation/Foundation.h>

@interface HttpUtils : NSObject

+(NSMutableURLRequest*)get:(NSString*)path key:(NSArray*)keys value :(NSArray*)values;

+(NSMutableURLRequest*)post:(NSString*)path key:(NSArray*)keys value :(NSArray*)values;

@end
