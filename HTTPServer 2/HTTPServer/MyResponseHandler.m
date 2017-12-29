//
//  MyResponseHandler.m
//  HTTPServer
//
//  Created by macbook pro on 2017/10/17.
//  Copyright © 2017年 macbook pro. All rights reserved.
//

#import "MyResponseHandler.h"

@implementation MyResponseHandler
+ (void)load{
    //通过向父类注册,HTTPResponseHandler 可以准确的知道自己的子类
    [HTTPResponseHandler registerHandler:self];
}
+ (BOOL)canHandleRequest:(CFHTTPMessageRef)aRequest
                  method:(NSString *)requestMethod
                     url:(NSURL *)requestURL
            headerFields:(NSDictionary *)requestHeaderFields
{
    return YES;
}
-(void)startResponse{


    NSString * sfilename = url.lastPathComponent;
    NSString * path = [[NSBundle mainBundle] pathForResource:sfilename ofType:nil];
//     NSString * path  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"textfile"];
    NSLog(@"文件路径%@",sfilename);
    BOOL  exists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (!exists) {
        return;
    }
    NSData * fileData = [NSData dataWithContentsOfFile:path];
    CFHTTPMessageRef response = CFHTTPMessageCreateResponse(kCFAllocatorDefault, 200, NULL, kCFHTTPVersion1_1);
    //application/x-apple-aspen-config  text/plain text/xml   application/octet-stream   image/png

    if ([sfilename.pathExtension isEqualToString:@"ipa"]) {
  CFHTTPMessageSetHeaderFieldValue(response, (CFStringRef)@"Content-Type", (CFStringRef)@"application/octet-stream");
    }else if ([sfilename.pathExtension isEqualToString:@"png"]){
   CFHTTPMessageSetHeaderFieldValue(response, (CFStringRef)@"Content-Type", (CFStringRef)@"image/png");
    }else if ([sfilename.pathExtension isEqualToString:@"plist"]){
    CFHTTPMessageSetHeaderFieldValue(response, (CFStringRef)@"Content-Type", (CFStringRef)@"text/xml");
    }
    CFDataRef headerData = CFHTTPMessageCopySerializedMessage(response);

    @try{
        [fileHandle writeData:(NSData *)headerData];
        [fileHandle writeData:fileData];
    }
    @catch (NSException * exception){

    }
    @finally{
        CFRelease(headerData);
        [server closeHandler:self];
    }
}


@end
