//
//  Character.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/2.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit

class Character: SKSpriteNode {

    private let run_upAtlas = SKTextureAtlas(named: "run_up")
    private var run_upTextureArr = [SKTexture]()
    
    init() {
        //
        let texture = SKTexture(imageNamed: "run_up_1")
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        for i in 1..<run_upAtlas.textureNames.count {
            run_upTextureArr.append(SKTexture(imageNamed: run_upAtlas.textureNames[i]))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func run_up() {
        
        removeAllActions()
        
        run(SKAction.repeatForever(SKAction.animate(with: run_upTextureArr, timePerFrame: 0.08)))
    }
}
