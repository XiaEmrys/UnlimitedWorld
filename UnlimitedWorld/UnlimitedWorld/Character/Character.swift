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
    private var isRunning_up = false
    
    private let run_downAtlas = SKTextureAtlas(named: "run_down")
    private var run_downTextureArr = [SKTexture]()
    private var isRunning_down = false
    
    private let run_leftAtlas = SKTextureAtlas(named: "run_left")
    private var run_leftTextureArr = [SKTexture]()
    private var isRunning_left = false
    
    private let run_rightAtlas = SKTextureAtlas(named: "run_right")
    private var run_rightTextureArr = [SKTexture]()
    private var isRunning_right = false
    
    
    init() {
        //
        let texture = SKTexture(imageNamed: "run_up_1")
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        for i in 0..<run_upAtlas.textureNames.count {
            run_upTextureArr.append(SKTexture(imageNamed: run_upAtlas.textureNames[i]))
        }
        for i in 0..<run_downAtlas.textureNames.count {
            run_downTextureArr.append(SKTexture(imageNamed: run_downAtlas.textureNames[i]))
        }
        for i in 0..<run_leftAtlas.textureNames.count {
            run_leftTextureArr.append(SKTexture(imageNamed: run_leftAtlas.textureNames[i]))
        }
        for i in 0..<run_rightAtlas.textureNames.count {
            run_rightTextureArr.append(SKTexture(imageNamed: run_rightAtlas.textureNames[i]))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func run_up() {
        
        if !isRunning_up {
            isRunning_up = true
            isRunning_down = false
            isRunning_left = false
            isRunning_right = false
            removeAllActions()
            run(SKAction.repeatForever(SKAction.animate(with: run_upTextureArr, timePerFrame: 0.08)))
        }
    }
    func run_down() {
        
        if !isRunning_down {
            isRunning_up = false
            isRunning_down = true
            isRunning_left = false
            isRunning_right = false
            removeAllActions()
            run(SKAction.repeatForever(SKAction.animate(with: run_downTextureArr, timePerFrame: 0.08)))
        }
    }
    func run_left() {
        
        if !isRunning_left {
            isRunning_up = false
            isRunning_down = false
            isRunning_left = true
            isRunning_right = false
            removeAllActions()
            run(SKAction.repeatForever(SKAction.animate(with: run_leftTextureArr, timePerFrame: 0.08)))
        }
    }
    func run_right() {
        
        if !isRunning_right {
            isRunning_up = false
            isRunning_down = false
            isRunning_left = false
            isRunning_right = true
            removeAllActions()
            run(SKAction.repeatForever(SKAction.animate(with: run_rightTextureArr, timePerFrame: 0.08)))
        }
    }
}
