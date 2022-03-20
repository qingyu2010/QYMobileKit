//
//  QYMathUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///生成某个区间范围的随机数，返回的是无符号整数
/// -parameter: [from,to]
/// egg:[100,200] 生产从100到200的随机数，包含100和200
FOUNDATION_EXPORT uint32_t QYRandomNumber(int from,int to);


NS_ASSUME_NONNULL_END
