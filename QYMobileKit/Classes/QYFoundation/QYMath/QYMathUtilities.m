//
//  QYMathUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/20.
//

#import "QYMathUtilities.h"
///生成某个区间范围的随机数，返回的是无符号整数
/// -parameter: [from,to]
/// egg:[100,200] 生产从100到200的随机数，包含100和200
uint32_t QYRandomNumber(int from,int to) {
    if (to - from <= 0) {
        return 0;
    }
    return (int)(from + (arc4random() % (to - from + 1)));
}
