//
//  UWRudderNode.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/2.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit

enum RudderDirection {
    case up
    case left
    case right
    case down
}

class UWRudderNode: SKShapeNode {

    var direction: RudderDirection {
        if (rudderContentNode.position.x > 0)&&(rudderContentNode.position.y > 0) {
            if rudderContentNode.position.x > rudderContentNode.position.y {
                return .right
            } else {
                return .up
            }
        } else if (rudderContentNode.position.x > 0)&&(rudderContentNode.position.y < 0) {
            if rudderContentNode.position.x > -rudderContentNode.position.y {
                return .right
            } else {
                return .down
            }
        } else if (rudderContentNode.position.x < 0)&&(rudderContentNode.position.y > 0) {
            if -rudderContentNode.position.x > -rudderContentNode.position.y {
                return .left
            } else {
                return .up
            }
        } else {
            if rudderContentNode.position.x < rudderContentNode.position.y {
                return .left
            } else {
                return .down
            }
        }
    }
    
    
    private let rudderContentNode = SKSpriteNode(imageNamed: "img_rudder_content_img")
    
    private var isRudderInOperation = false
    
    override init() {
        
        super.init()
        
        rudderContentNode.position = CGPoint(x: 0, y: 0)
        rudderContentNode.size = CGSize(width: 40, height: 40)
        
        addChild(rudderContentNode)
        
        isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            isRudderInOperation = true
            
            let position = t.location(in: self)
            let xl = position.x
            let yl = position.y
            if abs(xl) <= 15 && abs(yl) <= 15 {
                return
            }
            if abs(xl) >= 35 && abs(yl) >= 35 {
                self.isRudderInOperation = false
                return
            }
            var ys:CGFloat
            var xs:CGFloat
            if xl * xl + yl * yl > 2500 {
                let z = xl / yl   //计算比例
                let temp =  2500 / (1 + z * z)  //xl = z * yl  xs = z * ys 又 xs^2 + ys^2 = 2500 temp = ys^2
                ys = sqrt(temp)
                xs = abs(ys * z)
                if yl < 0 {   //判断ys正负
                    ys = ys * -1
                }
                if xl < 0 {  //判断xs正负
                    xs = -xs
                }
                let newPoi = CGPoint(x: xs , y: ys)
                self.rudderContentNode.position = newPoi
            }else{
                let newPoi = CGPoint(x: xl , y: yl)
                self.rudderContentNode.position = newPoi
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if isRudderInOperation {
                let position = t.location(in: self)
                let xl = position.x
                let yl = position.y
                var ys:CGFloat
                var xs:CGFloat
                if xl * xl + yl * yl > 2500 {
                    let z = xl / yl
                    let temp =  2500 / (1 + z * z)
                    ys = sqrt(temp)
                    xs = abs(ys * z)
                    if yl < 0 {
                        ys = ys * -1
                    }
                    if xl < 0 {
                        xs = -xs
                    }
                    let newPoi = CGPoint(x: xs , y: ys)
                    self.rudderContentNode.position = newPoi
                }else{
                    let newPoi = CGPoint(x: xl , y: yl)
                    self.rudderContentNode.position = newPoi
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.rudderContentNode.position = CGPoint(x: 0, y: 0)
    }
}