//
//  APPconnect.h
//  appconnect
//
// version 1.5

#import <Foundation/Foundation.h>

@interface APPconnect : NSObject {
    NSString *apikey;
    NSString *sharedSecret;
    NSString *apiurlString;
}

- (id)initWithUrl:(NSString *)urlString api:(NSString *)key andSharedsecret:(NSString *)shared;

-(NSDictionary *)registerDevice:(NSString *)deviceToken withCustomInfo:(NSString *)custom error:(NSError **)error;

@end
