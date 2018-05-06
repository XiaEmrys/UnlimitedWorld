//
//  UWMapNode.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/4.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit

class UWMapNode: SKNode {


//    private let mapContent = SKSpriteNode(imageNamed: "Amazing_Landscape_148")
    
    lazy var mapContent: SKNode = {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let mapContent = SKNode()
        
        for t in 0 ..< 9 {
            let rowIndex = t/3
            let columnIndex = t%3
            
            let mapUnity = SKSpriteNode(imageNamed: "Amazing_Landscape_148")
            mapUnity.size = CGSize(width:width, height: height)
            
            mapUnity.position = CGPoint(x: (CGFloat(rowIndex) - 1) * width, y: (CGFloat(columnIndex) - 1) * height)
            
            mapContent.addChild(mapUnity)
        }
        
        return mapContent
    }()
    
    override init() {
        super.init()
        
        position = CGPoint(x: 0, y: 0)
        
        mapContent.position = CGPoint(x: 0, y: 0)
        
//        mapContent.color = .blue
        
//        let width = CGFloat(Int(UIScreen.main.bounds.size.width/100))*3
//        let height = CGFloat(Int(UIScreen.main.bounds.size.width/100))*3
//
//        mapContent.size = CGSize(width:width, height: height)
        
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
