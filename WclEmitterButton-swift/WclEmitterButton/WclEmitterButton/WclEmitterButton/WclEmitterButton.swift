//
//  WclEmitterButton.swift
//  WclEmitterButton
//
//  Created by 王崇磊 on 16/4/26.
//  Copyright © 2016年 王崇磊. All rights reserved.
//

import UIKit

class WclEmitterButton: UIButton {
    //两种不同的CAEmitterLayer
    var chargeLayer:CAEmitterLayer
    var explosionLayer:CAEmitterLayer
    override var selected: Bool {
        didSet {
            animation()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        explosionLayer = CAEmitterLayer()
        chargeLayer    = CAEmitterLayer()
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        explosionLayer = CAEmitterLayer()
        chargeLayer    = CAEmitterLayer()
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        //参数详情请见博客详解：http://blog.csdn.net/wang631106979/article/details/51258020
        let explosionCell           = CAEmitterCell()
        explosionCell.name          = "explosion"
        explosionCell.alphaRange    = 0.10
        explosionCell.alphaSpeed    = -1.0
        explosionCell.lifetime      = 0.7
        explosionCell.lifetimeRange = 0.3
        explosionCell.birthRate     = 2500
        explosionCell.velocity      = 40.00
        explosionCell.velocityRange = 10.00
        explosionCell.scale         = 0.03
        explosionCell.scaleRange    = 0.02
        explosionCell.contents      = UIImage(named: "Sparkle")?.CGImage
        
        explosionLayer.name          = "emitterLayer"
        explosionLayer.emitterShape  = kCAEmitterLayerCircle;
        explosionLayer.emitterMode   = kCAEmitterLayerOutline;
        explosionLayer.emitterSize   = CGSizeMake(10, 0);
        explosionLayer.emitterCells  = [explosionCell]
        explosionLayer.renderMode    = kCAEmitterLayerOldestFirst;
        explosionLayer.masksToBounds = false
        explosionLayer.birthRate     = 0.0
        explosionLayer.position      = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
        explosionLayer.zPosition     = -1;
        layer.addSublayer(explosionLayer)
        
        let chargeCell = CAEmitterCell()
        chargeCell.name           = "charge"
        chargeCell.alphaRange     = 0.10
        chargeCell.alphaSpeed     = -1.0
        chargeCell.lifetime       = 0.3
        chargeCell.lifetimeRange  = 0.1
        chargeCell.birthRate      = 80
        chargeCell.velocity       = -40.0
        chargeCell.velocityRange  = 0.00
        chargeCell.scale          = 0.03
        chargeCell.scaleRange     = 0.02
        chargeCell.contents       = UIImage(named: "Sparkle")?.CGImage
        
        chargeLayer.name          = "emitterLayer"
        chargeLayer.emitterShape  = kCAEmitterLayerCircle
        chargeLayer.emitterMode   = kCAEmitterLayerOutline
        chargeLayer.emitterSize   = CGSizeMake(20, 0)
        chargeLayer.emitterCells  = [chargeCell]
        chargeLayer.renderMode    = kCAEmitterLayerOldestFirst
        chargeLayer.masksToBounds = false
        chargeLayer.birthRate     = 0.0
        chargeLayer.position      = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0)
        chargeLayer.zPosition     = -1
        layer.addSublayer(chargeLayer)
    }
    
    /**
     *  开始动画
     */
    func animation() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        if (self.selected) {
            animation.values = [1.5 ,0.8, 1.0,1.2,1.0]
            animation.duration = 0.5;
            startAnimate()
        }else {
            animation.values = [0.8, 1.0]
            animation.duration = 0.4
        }
        animation.calculationMode = kCAAnimationCubic;
        layer.addAnimation(animation, forKey: "transform.scale")

    }
    /**
     *  开始喷射
     */
    func startAnimate() {
        //chareLayer开始时间
        chargeLayer.beginTime = CACurrentMediaTime()
        //chareLayer喷射系数为1
        chargeLayer.birthRate = 1.0
        //进入下一个动作
        performSelector(#selector(WclEmitterButton.explode), withObject: nil, afterDelay: 0.2)
    }
    
    /**
     *  大量喷射
     */
    func explode() {
        //让chareLayer喷射系数为0
        chargeLayer.birthRate = 0
        //explosionLayer开始时间
        explosionLayer.beginTime = CACurrentMediaTime()
        //explosionLayer喷射系数为1
        explosionLayer.birthRate = 1.0
        //停止喷射
        performSelector(#selector(WclEmitterButton.stop), withObject: nil, afterDelay: 0.1)
    }

    
    /**
     *  停止喷射
     */
    func stop() {
        //让chareLayer喷射系数为0
        chargeLayer.birthRate = 0
        //explosionLayer喷射系数为0
        explosionLayer.birthRate = 0
    }
}
