//
//  GameScene.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/1.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    private var movePoint :SKShapeNode? = nil
//    private var ismoveTouch:Bool = true
    
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?

    private let rudder = UWRudderNode(circleOfRadius: 50)
    
    private let character = Character()
    
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        
        // Create shape node to use during mouse interaction
        
        size = UIScreen.main.bounds.size
        
//        let moveController = SKShapeNode.init(rectOf: CGSize.init(width: 106, height: 106), cornerRadius: 53)
//        moveController.position = CGPoint(x: 70, y: 70)
//        moveController.lineWidth = 2
//        moveController.name = "moveController"
//        addChild(moveController)
//        movePoint = SKShapeNode.init(circleOfRadius: 6)
//        movePoint!.fillColor = SKColor.white
//        movePoint!.position = CGPoint(x: 70, y: 70)
//        addChild(movePoint!)
        
        
        rudder.position = CGPoint(x: 70, y: 70)
        addChild(rudder)
        
        
        character.position = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        addChild(character)
        
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
            
//            self.ismoveTouch = true
//            let position = t.location(in: self)
//            let xl = position.x - 70
//            let yl = position.y - 70
//            if abs(xl) <= 15 && abs(yl) <= 15 {
//                return
//            }
//            if abs(xl) >= 35 && abs(yl) >= 35 {
//                self.ismoveTouch = false
//                return
//            }
//            var ys:CGFloat
//            var xs:CGFloat
//            if xl * xl + yl * yl > 2500 {
//                let z = xl / yl   //计算比例
//                let temp =  2500 / (1 + z * z)  //xl = z * yl  xs = z * ys 又 xs^2 + ys^2 = 2500 temp = ys^2
//                ys = sqrt(temp)
//                xs = abs(ys * z)
//                if yl < 0 {   //判断ys正负
//                    ys = ys * -1
//                }
//                if xl < 0 {  //判断xs正负
//                    xs = -xs
//                }
//                let newPoi = CGPoint(x: 70 + xs , y: 70 + ys)
//                self.movePoint?.position = newPoi
//            }else{
//                let newPoi = CGPoint(x: 70 + xl , y: 70 + yl)
//                self.movePoint?.position = newPoi
//            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
//            if self.ismoveTouch {
//                let position = t.location(in: self)
//                let xl = position.x - 70
//                let yl = position.y - 70
//                var ys:CGFloat
//                var xs:CGFloat
//                if xl * xl + yl * yl > 2500 {
//                    let z = xl / yl
//                    let temp =  2500 / (1 + z * z)
//                    ys = sqrt(temp)
//                    xs = abs(ys * z)
//                    if yl < 0 {
//                        ys = ys * -1
//                    }
//                    if xl < 0 {
//                        xs = -xs
//                    }
//                    let newPoi = CGPoint(x: 70 + xs , y: 70 + ys)
//                    self.movePoint?.position = newPoi
//                }else{
//                    let newPoi = CGPoint(x: 70 + xl , y: 70 + yl)
//                    self.movePoint?.position = newPoi
//                }
//            }
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.movePoint?.position = CGPoint(x: 70, y: 70)
        
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        switch rudder.direction {
        case .up:
            character.run_up()
        case .down:
            character.run_down()
        case .left:
            character.run_left()
        case .right:
            character.run_right()
        }
        
        print(rudder.direction)
        // Called before each frame is rendered
//        let poi = CGPoint(x: (self.movePoint?.position.x)! - 70, y: (self.movePoint?.position.y)! - 70)
//        
//        if poi.x > poi.y{
//            self.character.run_up()
//        }
    }
}
