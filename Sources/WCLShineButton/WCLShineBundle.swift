//
//  WCLShineBundle.swift
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
// @class WCLShineBundle
// @abstract WCLShineBundle
// @discussion WCLShineBundle
//

import UIKit

struct WCLShineBundle {
    
    // 当前的bundle
    static var bundle: Bundle {
        let bundle = Bundle(for: WCLShineButton.self)
        return bundle
    }
    
    // 存放资源的bundle
    static var wclBundle: Bundle {
        let bundle = Bundle(path: self.bundle.path(forResource: "WCLShineButton", ofType: "bundle")!)
        return bundle!
    }
    
    static func imageFromBundle(_ imageName: String) -> UIImage {
        let bundle = Bundle(path: wclBundle.bundlePath + "/resource")
        if let path = bundle?.path(forResource: imageName, ofType: "png") {
            if let image = UIImage(contentsOfFile: path) {
                return image
            }
        }
        return UIImage()
    }
}

extension UIColor {
    public convenience init(rgb: (r: CGFloat, g: CGFloat, b: CGFloat)) {
        self.init(red: rgb.r/255, green: rgb.g/255, blue: rgb.b/255, alpha: 1.0)
    }
}
