//
//  WCLShineClickLayer.swift
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
//  Github  :https://github.com/631106979
//  HomePage:https://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// @class WCLShineClickLayer
// @abstract 点击效果的layer
// @discussion 点击效果的layer
//

import UIKit

class WCLShineClickLayer: CALayer {
    
    var color: UIColor = UIColor.lightGray
    
    var fillColor: UIColor = UIColor(rgb: (255, 102, 102))
    
    var image: WCLShineImage = .heart {
        didSet {
            maskLayer.contents = image.getImage()
        }
    }
    
    var animDuration: Double = 0.5
    
    var clicked: Bool = false {
        didSet {
            if clicked {
                backgroundColor = fillColor.cgColor
            }else {
                backgroundColor = color.cgColor
            }
        }
    }
    
    let maskLayer = CALayer()
    
    //MARK: Public Methods
    public func startAnim() {
        let anim = CAKeyframeAnimation(keyPath: "transform.scale")
        anim.duration  = animDuration
        anim.values = [0.4, 1, 0.9, 1]
        anim.calculationMode = kCAAnimationCubic
        maskLayer.add(anim, forKey: "scale")
    }
    
    //MARK: Override
    override func layoutSublayers() {
        maskLayer.frame = bounds
        if clicked {
            backgroundColor = fillColor.cgColor
        }else {
            backgroundColor = color.cgColor
        }
        maskLayer.contents = image.getImage()?.cgImage
    }
    
    
    //MARK: Initial Methods
    override init() {
        super.init()
        mask = maskLayer
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        mask = maskLayer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
