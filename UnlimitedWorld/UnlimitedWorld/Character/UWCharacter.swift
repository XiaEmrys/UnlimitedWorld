//
//  UWCharacter.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/3.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit

enum CharacterDirection {
    case right
    case rightUp
    case up
    case leftUp
    case left
    case leftDown
    case down
    case rightDown
}

class UWCharacter: SKSpriteNode {

    var direction: CharacterDirection {
        didSet {
            if direction != oldValue {
                startRun(direction: direction)
            }
        }
    }
    
    private lazy var run_rightTextureArr = initialRunTextureSource("run_right")
    private lazy var run_rightUpTextureArr = initialRunTextureSource("run_right_up")
    private lazy var run_upTextureArr = initialRunTextureSource("run_up")
    private lazy var run_leftUpTextureArr = initialRunTextureSource("run_left_up")
    private lazy var run_leftTextureArr = initialRunTextureSource("run_left")
    private lazy var run_leftDownTextureArr = initialRunTextureSource("run_left_down")
    private lazy var run_downTextureArr = initialRunTextureSource("run_down")
    private lazy var run_rightDownTextureArr = initialRunTextureSource("run_right_down")
    
    init() {
        //
        let texture = SKTexture(imageNamed: "run_up_1")
        
        direction = .up
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func startRun(direction: CharacterDirection) {
        //
        var runTextureArr: [SKTexture]?
        
        switch direction {
        case .right:
            runTextureArr = run_rightTextureArr
        case .rightUp:
            runTextureArr = run_rightUpTextureArr
        case .up:
            runTextureArr = run_upTextureArr
        case .leftUp:
            runTextureArr = run_leftUpTextureArr
        case .left:
            runTextureArr = run_leftTextureArr
        case .leftDown:
            runTextureArr = run_leftDownTextureArr
        case .down:
            runTextureArr = run_downTextureArr
        case .rightDown:
            runTextureArr = run_rightDownTextureArr
        }
        
        if let t = runTextureArr {
            removeAllActions()
            run(SKAction.repeatForever(SKAction.animate(with: t, timePerFrame: 0.08)))
        }
    }
    
    private func initialRunTextureSource(_ atlasFileNamed: String) -> [SKTexture] {
        let runAtlas = SKTextureAtlas(named: atlasFileNamed)
        var runTextureArr = [SKTexture]()
        for i in 0..<runAtlas.textureNames.count {
            runTextureArr.append(SKTexture(imageNamed: runAtlas.textureNames[i]))
        }
        return runTextureArr
    }
    
}
