//
//  WCLShineParams.swift
//  WCLShineButton
//
// **************************************************
// *                                  _____         *
// *         __  _  __     ___        \   /         *
// *         \ \/ \/ /    / __\       /  /          *
// *          \  _  /    | (__       /  /           *
// *           \/ \/      \___/     /  /__          *
// *                               /_____/          *
// *                                                *
// **************************************************
//  Github  :https://github.com/imwcl
//  HomePage:https://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// @class WCLShineParams
// @abstract WCLShineButton配置
// @discussion WCLShineButton配置
//

import UIKit

public struct WCLShineParams {
    /// shine是否随机颜色
    public var allowRandomColor: Bool       = false
    /// shine动画时间，秒
    public var animDuration: Double         = 1
    /// 大Shine的颜色
    public var bigShineColor: UIColor       = UIColor(rgb: (255, 102, 102))
    /// 是否需要Flash效果
    public var enableFlashing: Bool         = false
    /// shine的个数
    public var shineCount: Int              = 7
    /// shine的扩散的旋转角度
    public var shineTurnAngle: Float        = 20
    /// shine的扩散的范围的倍数
    public var shineDistanceMultiple: Float = 1.5
    /// 小shine与大shine之前的角度差异
    public var smallShineOffsetAngle: Float = 20
    /// 小shine的颜色
    public var smallShineColor: UIColor     = UIColor.lightGray
    /// shine的大小
    public var shineSize: CGFloat = 0
    /// 随机的颜色列表
    public var colorRandom: [UIColor]       = [UIColor(rgb: (255, 255, 153)),
                                               UIColor(rgb: (255, 204, 204)),
                                               UIColor(rgb: (153, 102, 153)),
                                               UIColor(rgb: (255, 102, 102)),
                                               UIColor(rgb: (255, 255, 102)),
                                               UIColor(rgb: (244, 67, 54)),
                                               UIColor(rgb: (102, 102, 102)),
                                               UIColor(rgb: (204, 204, 0)),
                                               UIColor(rgb: (102, 102, 102)),
                                               UIColor(rgb: (153, 153, 51))]
    public init() {}
}

public enum WCLShineImage {
    case heart
    case like
    case smile
    case star
    case custom(UIImage)
    func getImage() -> UIImage? {
        switch self {
        case .heart:
            return WCLShineBundle.imageFromBundle("heart")
        case .like:
            return WCLShineBundle.imageFromBundle("like")
        case .smile:
            return WCLShineBundle.imageFromBundle("smile")
        case .star:
            return WCLShineBundle.imageFromBundle("star")
        case .custom(let image):
            return image
            
        }
    }
}

var isIOS10: Bool {
    if #available(iOS 10.0, *) {
        return true
    }else {
        return false
    }
}
