//
//  UWMapNode.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/4.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit

class UWMapNode: SKNode {

//    let mapContent = SKSpriteNode(color: .blue, size: CGSize(width: UIScreen.main.bounds.size.width * 3, height: UIScreen.main.bounds.size.height * 3))
    let mapContent = SKSpriteNode(imageNamed: "Amazing_Landscape_148")
//        SKSpriteNode(color: .blue, size: CGSize(width: UIScreen.main.bounds.size.width * 3, height: UIScreen.main.bounds.size.height * 3))
    
    
//    class func creat() -> UWMapNode {
//        let mapNode = super.init() as! UWMapNode
//        
//        mapNode.position = CGPoint(x: 0, y: 0)
//        
//        return mapNode
//    }
    
    override init() {
        super.init()
        
        position = CGPoint(x: 0, y: 0)
        
        mapContent.position = CGPoint(x: 0, y: 0)
        
        mapContent.color = .blue
        
        mapContent.size = CGSize(width: UIScreen.main.bounds.size.width * 4.5, height: UIScreen.main.bounds.size.height * 4.5)
        
        addChild(mapContent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func transfer(_ angle: CGFloat) {
        var targetX = mapContent.position.x - 10 * cos(angle)
        var targetY = mapContent.position.y - 10 * sin(angle)
        
        if targetX.isNaN || targetY.isNaN {
            //
            print("error")
        }
        
        if targetX > UIScreen.main.bounds.size.width {
            targetX -= UIScreen.main.bounds.size.width
        }
        if targetX < -UIScreen.main.bounds.size.width {
            targetX += UIScreen.main.bounds.size.width
        }
        if targetY > UIScreen.main.bounds.size.height {
            targetY -= UIScreen.main.bounds.size.height
        }
        if targetY < -UIScreen.main.bounds.size.height {
            targetY += UIScreen.main.bounds.size.height
        }
        
        mapContent.position = CGPoint(x: targetX, y: targetY)
    }
}
