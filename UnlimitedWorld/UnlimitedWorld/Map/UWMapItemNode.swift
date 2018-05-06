//
//  UWMapItemNode.swift
//  UnlimitedWorld
//
//  Created by Emrys on 2018/5/5.
//  Copyright © 2018年 Emrys. All rights reserved.
//

import SpriteKit

protocol UWMapItemDataSource: class {
    func itemPosition(_ item: UWMapItemNode) -> CGPoint
}

class UWMapItemNode: SKSpriteNode {

    weak var dataSource: UWMapItemDataSource?
    
    
    override var position: CGPoint {
        set {
            if let t = dataSource {
                self.position = t.itemPosition(self)
            } else {
                self.position = CGPoint(x: 0, y: 0)
            }
        }
        get {
            return self.position
        }
    }
}
