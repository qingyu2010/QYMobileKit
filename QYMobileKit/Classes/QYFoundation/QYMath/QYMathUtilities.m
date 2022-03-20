//
//  QYMathUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/20.
//

#import "QYMathUtilities.h"

uint32_t QYRandomNumber(int from,int to) {
    if (to - from <= 0) {
        return 0;
    }
    return (int)(from + (arc4random() % (to - from + 1)));
}
