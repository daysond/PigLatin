//
//  NSString+PigLatinization.m
//  PigLatin
//
//  Created by Dayson Dong on 2019-05-03.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "NSString+PigLatinization.h"

@interface NSString (PigLatinazation)

-(BOOL) hasConsonatPrefix:(NSString* ) string;

@end

@implementation NSString (PigLatinization)

-(BOOL) hasConsonatPrefix:(NSString* ) string {
    
    NSArray* vowels = [[NSArray alloc]initWithObjects:@"a",@"e",@"i",@"o",@"u", nil];
    string = [string lowercaseString];
    for (NSString* vowel in vowels) {
        if ([string hasPrefix:vowel] ){
            return NO;
        }
    }
    return YES;
}

-(NSString *)stringByPigLatinization{
    
    NSString* str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray* words = [str componentsSeparatedByString:@" "];
    NSMutableArray* pigLatinizedWords = [[NSMutableArray alloc]init];
    NSString* stringToBePL = @"";
    for (NSString* word in words) {
        
        stringToBePL = word;
        while ([self hasConsonatPrefix:stringToBePL]) {
            
            NSString* consonant = [stringToBePL substringWithRange:NSMakeRange(0, 1)];
            stringToBePL = [[[stringToBePL substringWithRange:NSMakeRange(1, stringToBePL.length - 1)] stringByAppendingString:consonant] capitalizedString];
        }
        [pigLatinizedWords addObject:[stringToBePL stringByAppendingString:@"ay"]];
        
    }
    
    
    return [pigLatinizedWords componentsJoinedByString:@" "];
    
}

@end
