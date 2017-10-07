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
//  Github  :https://github.com/imwcl
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
            if image.isDefaultAndSelect() {
                mask     = nil
                contents = image.getImages().first?.cgImage
            }else {
                maskLayer.contents = image.getImages().first?.cgImage
                mask = maskLayer
            }
        }
    }
    
    var animDuration: Double = 0.5
    
    var clicked: Bool = false {
        didSet {
            if image.isDefaultAndSelect() {
                backgroundColor = UIColor.clear.cgColor
                if clicked {
                    contents = image.getImages().last?.cgImage
                }else {
                    contents = image.getImages().first?.cgImage
                }
            }else {
                if clicked {
                    backgroundColor = fillColor.cgColor
                }else {
                    backgroundColor = color.cgColor
                }
            }
        }
    }
    
    let maskLayer = CALayer()
    
    //MARK: Public Methods
    func startAnim() {
        let anim = CAKeyframeAnimation(keyPath: "transform.scale")
        anim.duration  = animDuration
        anim.values = [0.4, 1, 0.9, 1]
        anim.calculationMode = kCAAnimationCubic
        if image.isDefaultAndSelect() {
            add(anim, forKey: "scale")
        }else {
            maskLayer.add(anim, forKey: "scale")
        }
    }
    
    //MARK: Override
    override func layoutSublayers() {
        if image.isDefaultAndSelect() {
            backgroundColor = UIColor.clear.cgColor
        }else {
            maskLayer.frame = bounds
            maskLayer.contents = image.getImages().first?.cgImage
            mask = maskLayer
            if clicked {
                backgroundColor = fillColor.cgColor
            }else {
                backgroundColor = color.cgColor
            }
        }
    }
}
