//
//  ViewController.swift
//  Demo
//
//  Created by 王崇磊 on 2017/2/16.
//  Copyright © 2017年 王崇磊. All rights reserved.
//

import UIKit
import WCLShineButton

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: WCLShineButton!
    @IBOutlet weak var btn2: WCLShineButton!
    @IBOutlet weak var btn3: WCLShineButton!
    @IBOutlet weak var btn4: WCLShineButton!
    @IBOutlet weak var btn5: WCLShineButton!
    
    private var allButtons: [WCLShineButton] {
        return [btn1, btn2, btn3, btn4, btn5]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var param1 = WCLShineParams()
        param1.bigShineColor = UIColor(rgb: (153,152,38))
        param1.smallShineColor = UIColor(rgb: (102,102,102))
        param1.animDuration = 1
        btn1.params = param1
        btn1.isSelected = true
        
        var param2 = WCLShineParams()
        param2.bigShineColor = UIColor(rgb: (255,95,89))
        param2.smallShineColor = UIColor(rgb: (216,152,148))
        param2.shineCount = 15
        param2.animDuration = 2
        param2.smallShineOffsetAngle = -5
        btn2.params = param2
        btn2.image = .like
        
        var param3 = WCLShineParams()
        param3.allowRandomColor = true
        param3.animDuration = 1
        btn3.isSelected = true
        btn3.params = param3
        btn3.image = .smile
        
        var param4 = WCLShineParams()
        param4.enableFlashing = true
        param4.animDuration = 2
        btn4.params = param4
        btn4.image = .star
        
        var param5 = WCLShineParams()
        param5.bigShineColor = UIColor(rgb: (255, 195, 55))
        btn5.image = .defaultAndSelect(#imageLiteral(resourceName: "collect"), #imageLiteral(resourceName: "collect#"))
        btn5.params = param5
    }
    
    
    @IBAction func clickAll(_ sender: Any) {
        var delay = 0.0
        for btn in allButtons {
            DispatchQueue.main.asyncAfter(deadline: .now()+delay, execute: {
                btn.setClicked(!btn.isSelected, animated: true)
            })
            delay += 0.25
        }
    }

    @IBAction func action(_ sender: WCLShineButton) {
        print("Clicked \(sender.isSelected)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

