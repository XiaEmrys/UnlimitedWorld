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
    
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?

    private let rudder = UWRudderNode(circleOfRadius: 50)
    
    private let character = UWCharacter()
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        
        // Create shape node to use during mouse interaction
        
        size = UIScreen.main.bounds.size
        
//        for row in 0 ..< (Int)(UIScreen.main.bounds.size.width/30) + 1 {
//            for column in 0 ..< (Int)(UIScreen.main.bounds.size.width/30) + 1 {
//                let colorNode = SKSpriteNode(color: UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1), size: CGSize(width: 30, height: 30))
//
//                colorNode.position = CGPoint(x: CGFloat(row)*30+15, y: CGFloat(column)*30+15)
//
//                addChild(colorNode)
//            }
//        }
        
        backgroundColor = .brown
        
        rudder.position = CGPoint(x: 70, y: 70)
        addChild(rudder)
        
        
        character.position = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        addChild(character)
        
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
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {

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
        
        switch rudder.rudderAngle {
        case 0 ..< CGFloat.pi/8:
            character.direction = .right
        case CGFloat.pi/8 ..< CGFloat.pi*3/8:
            character.direction = .rightUp
        case CGFloat.pi*3/8 ..< CGFloat.pi*5/8:
            character.direction = .up
        case CGFloat.pi*5/8 ..< CGFloat.pi*7/8:
            character.direction = .leftUp
        case CGFloat.pi*7/8 ..< CGFloat.pi*9/8:
            character.direction = .left
        case CGFloat.pi*9/8 ..< CGFloat.pi*11/8:
            character.direction = .leftDown
        case CGFloat.pi*11/8 ..< CGFloat.pi*13/8:
            character.direction = .down
        case CGFloat.pi*13/8 ..< CGFloat.pi*15/8:
            character.direction = .rightDown
        default:
            character.direction = .right
        }
        // Called before each frame is rendered
    }
}
