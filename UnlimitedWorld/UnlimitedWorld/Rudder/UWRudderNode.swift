//
//  UWRudderNode.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/2.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit

enum  RudderOperatingState {
    case operating
    case standby
}

class UWRudderNode: SKShapeNode {
    
    var operatingState: RudderOperatingState {
        if isRudderInOperation {
            return .operating
        } else {
            return .standby
        }
    }
    
    var rudderAngle: CGFloat {
        
        var res:CGFloat = 0;
        
        if 0 == rudderContentNode.position.x {
            if rudderContentNode.position.y >= 0 {
//                return .pi/2
                res = .pi/2
            } else {
//                return (.pi*3)/2
                res = (.pi*3)/2
            }
        } else {
            
            var tempAngle:CGFloat = 0;
            if rudderContentNode.position.x < 0 {
                
                tempAngle = CGFloat.pi
            } else if rudderContentNode.position.y < 0 {
                tempAngle = CGFloat.pi * 2
            }
//            return atan(rudderContentNode.position.y/rudderContentNode.position.x) + tempAngle
            res = atan(rudderContentNode.position.y/rudderContentNode.position.x) + tempAngle
        }
        
        if res.isNaN {
            print("error")
        }
        return res
    }

    private let rudderContentRadius:CGFloat = 25
    
    private var rudderContentSize: CGFloat{
        return rudderContentRadius*2
    }
    
    private var cornerRadius: CGFloat {
        return frame.size.width/2
    }
    
    private let rudderContentNode = SKSpriteNode(imageNamed: "img_rudder_content_img")
    
    private var isRudderInOperation = false
    
    override init() {
        
        super.init()
        
                
        rudderContentNode.position = CGPoint(x: 0, y: 0)
        rudderContentNode.size = CGSize(width: rudderContentSize, height: rudderContentSize)
        
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
//            if abs(xl) <= 15 && abs(yl) <= 15 {
//                return
//            }
//            if abs(xl) >= 35 && abs(yl) >= 35 {
//                self.isRudderInOperation = false
//                return
//            }
            var ys:CGFloat
            var xs:CGFloat
            if xl * xl + yl * yl > cornerRadius * cornerRadius {
//            if xl * xl + yl * yl > 2500 {
                let z = xl / yl   //计算比例
//                let temp =  2500 / (1 + z * z)  //xl = z * yl  xs = z * ys 又 xs^2 + ys^2 = 2500 temp = ys^2
                let temp = cornerRadius * cornerRadius / (1 + z * z)  //xl = z * yl  xs = z * ys 又 xs^2 + ys^2 = 2500 temp = ys^2
                ys = sqrt(temp)
                xs = abs(ys * z)
                if yl < 0 {   //判断ys正负
                    ys = ys * -1
                }
                if xl < 0 {  //判断xs正负
                    xs = -xs
                }
                let newPoi = CGPoint(x: xs , y: ys)
                rudderContentNode.position = newPoi
            }else{
                let newPoi = CGPoint(x: xl , y: yl)
                rudderContentNode.position = newPoi
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
                if xl * xl + yl * yl > cornerRadius * cornerRadius {
//                if xl * xl + yl * yl > 2500 {
                    // 余切
                    let z = xl / yl
                    
                    //
                    let temp =  cornerRadius * cornerRadius / (1 + z * z)
//                    let temp =  2500 / (1 + z * z)
                    ys = sqrt(temp)
                    xs = abs(ys * z)
                    if yl.isZero {
                        ys = 0
                        xs = cornerRadius
                    }
                    if yl < 0 {
                        ys = ys * -1
                    }
                    if xl < 0 {
                        xs = -xs
                    }
                    if xs.isNaN || ys.isNaN {
                        print("error")
                    }
                    let newPoi = CGPoint(x: xs , y: ys)
                    rudderContentNode.position = newPoi
                }else{
                    
                    if xl.isNaN || yl.isNaN {
                        print("error")
                    }

                    let newPoi = CGPoint(x: xl , y: yl)
                    rudderContentNode.position = newPoi
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isRudderInOperation = false
        rudderContentNode.position = CGPoint(x: 0, y: 0)
    }
}
