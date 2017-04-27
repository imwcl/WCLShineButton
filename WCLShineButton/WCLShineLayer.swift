//
//  WCLShineLayer.swift
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
// @class WCLShineLayer
// @abstract 展示Shine的layer
// @discussion 展示Shine的layer
//

import UIKit

class WCLShineLayer: CALayer, CAAnimationDelegate {
    
    let shapeLayer =  CAShapeLayer()
    
    var fillColor: UIColor = UIColor(rgb: (255, 102, 102)) {
        willSet {
            shapeLayer.strokeColor = newValue.cgColor
        }
    }
    
    var params: WCLShineParams = WCLShineParams()
    
    var displaylink: CADisplayLink?
    
    var endAnim: (()->Void)?
    
    //MARK: Public Methods
    public func startAnim() {
        let anim = CAKeyframeAnimation(keyPath: "path")
        anim.duration = params.animDuration * 0.1
        let size = frame.size
        let fromPath = UIBezierPath(arcCenter: CGPoint.init(x: size.width/2, y: size.height/2), radius: 1, startAngle: 0, endAngle: CGFloat(Double.pi) * 2.0, clockwise: false).cgPath
        let toPath = UIBezierPath(arcCenter: CGPoint.init(x: size.width/2, y: size.height/2), radius: size.width/2 * CGFloat(params.shineDistanceMultiple), startAngle: 0, endAngle: CGFloat(Double.pi) * 2.0, clockwise: false).cgPath
        anim.delegate = self
        anim.values = [fromPath, toPath]
        anim.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        shapeLayer.add(anim, forKey: "path")
        if params.enableFlashing {
            startFlash()
        }
    }
    
    
    //MARK: Initial Methods
    override init() {
        super.init()
        initLayers()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        initLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Privater Methods
    private func initLayers() {
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = fillColor.cgColor
        shapeLayer.lineWidth = 1.5
        addSublayer(shapeLayer)
    }
    
    private func startFlash() {
        displaylink = CADisplayLink(target: self, selector: #selector(flashAction))
        if #available(iOS 10.0, *) {
            displaylink?.preferredFramesPerSecond = 6
        }else {
            displaylink?.frameInterval = 10
        }
        displaylink?.add(to: .current, forMode: .commonModes)
    }
    
    @objc private func flashAction() {
        shapeLayer.strokeColor = params.colorRandom[Int(arc4random())%params.colorRandom.count].cgColor
    }
    
    //MARK: CAAnimationDelegate
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            displaylink?.invalidate()
            displaylink = nil
            shapeLayer.removeAllAnimations()
            let angleLayer = WCLShineAngleLayer(frame: bounds, params: params)
            addSublayer(angleLayer)
            angleLayer.startAnim()
            endAnim?()
        }
    }
}
