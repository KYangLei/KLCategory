//
//  NSString+Encrypt.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSString+Encrypt.h"
#import "NSData+Encrypt.h"
#import "NSData+Base64.h"

@implementation NSString (Encrypt)
-(NSString*)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted base64EncodedString];
    
    return encryptedString;
}

- (NSString*)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData dataWithBase64EncodedString:self] decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted base64EncodedString];
    
    return encryptedString;
}

- (NSString*)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData dataWithBase64EncodedString:self] decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)encryptedWithDESUsingKey
{
    NSString *key = @"12345678";
    NSString *initVec = @"12345678";
    NSData *iv = [initVec dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] encryptedWithDESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted base64EncodedString];
    
    return encryptedString;
    
}
- (id)decryptedWithDESUsingKey
{
    NSString *key = @"12345678";
    NSString *initVec = @"12345678";
    NSData *iv = [initVec dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *decrypted = [[NSData dataWithBase64EncodedString:self] decryptedWithDESUsingKey:key andIV:iv];
    // 解析数据
    id decryptedString = [NSJSONSerialization JSONObjectWithData:decrypted options:NSJSONReadingMutableContainers error:nil];
    // 判断是否有字典或者数组
    if (decryptedString) {
        return decryptedString;
    }else{
        // 字符串
        NSString *decryptedStr = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
        return decryptedStr;
    }

    return decryptedString;
}


@end
