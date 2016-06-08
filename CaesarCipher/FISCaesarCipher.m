//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher

- (NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key {
    NSString *newString = @"";

    if (key > 26) {
        key = key % 26;
    }
    
    for (NSUInteger i = 0; i < message.length; i++) {
        unichar asciicode = [message characterAtIndex:i];
        NSString *newChar;
        NSInteger newPosition;
        if ( asciicode < 123 && asciicode > 96) {
            if (asciicode + key > 122) {
                NSInteger delta = key - (122 - asciicode);
                newPosition = 96 + delta;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            } else {
                newPosition = asciicode + key;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            }
        } else if ( asciicode < 91 && asciicode > 64) {
            if (asciicode + key > 90) {
                NSInteger delta = key - (90 - asciicode);
                newPosition = 64 + delta;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            } else {
                newPosition = asciicode + key;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            }
        } else if (asciicode == 32      // space
                   || asciicode == 39   // '
                   || asciicode == 42   // *
                   || asciicode == 38   // &
                   || asciicode == 94   // ^
                   || asciicode == 46) {// .
            newChar = [NSString stringWithFormat:@"%C", (unichar)asciicode];
            newString = [newString stringByAppendingString:newChar];
        } else {
            return @"there is a char not a letter!";
        }
    }
    return newString;
}

- (NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key {
    NSString *newString = @"";
    
    if (key > 26) {
        key = key % 26;
    }
    
    for (NSUInteger i = 0; i < encodedMessage.length; i++) {
        unichar asciicode = [encodedMessage characterAtIndex:i];
        NSString *newChar;
        NSInteger newPosition;
        if ( asciicode < 123 && asciicode > 96) {
            if ((asciicode - key) < 97) {
                NSInteger delta = key - (asciicode - 96);
                newPosition = 122 - delta;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            } else {
                newPosition = asciicode - key;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            }
        } else if ( asciicode < 91 && asciicode > 64) { 
            if ((asciicode - key) < 65) {
                NSInteger delta = key - (asciicode - 64);
                newPosition = 90 - delta;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            } else {
                newPosition = asciicode - key;
                newChar = [NSString stringWithFormat:@"%C", (unichar)newPosition];
                newString = [newString stringByAppendingString:newChar];
            }
        } else if (asciicode == 32      // space
                   || asciicode == 39   // '
                   || asciicode == 42   // *
                   || asciicode == 38   // &
                   || asciicode == 94   // ^
                   || asciicode == 46) {// .
            newChar = [NSString stringWithFormat:@"%C", (unichar)asciicode];
            newString = [newString stringByAppendingString:newChar];
        } else {
            return @"there is a char not a letter!";
        }
    }
    return newString;
}

@end
