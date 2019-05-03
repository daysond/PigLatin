//
//  main.m
//  PigLatin
//
//  Created by Dayson Dong on 2019-05-03.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatinization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"Alek Chips";
        NSLog(@"After Pig Latin: %@",[str stringByPigLatinization]);
    }
    return 0;
}
