//
//  GameScene.swift
//  CookieCrunch2
//
//  Created by Thang Nguyen on 5/15/16.
//  Copyright (c) 2016 Thang Nguyen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  var level: Level!
  let TileWidth: CGFloat = 32.0
  let TileHeight: CGFloat = 36.0

  let gameLayer = SKNode()
  let cookiesLayer = SKNode()
  let tilesLayer = SKNode()

  required init?(coder aDecoder: NSCoder){
    fatalError("init coder is not used in this app")
  }
  override init(size: CGSize) {
      super.init(size: size)
      anchorPoint = CGPoint(x: 0.5, y: 0.5)
      let background = SKSpriteNode(imageNamed: "Background")
      //addChild(background)

      let layerPosition = CGPoint(
        x: -TileWidth * CGFloat(NumColumns) / 2,
        y: -TileHeight * CGFloat(NumRows) / 2
      )
      cookiesLayer.position = layerPosition
      tilesLayer.position = layerPosition
      gameLayer.addChild(tilesLayer)
      gameLayer.addChild(cookiesLayer)
    
      addChild(gameLayer)
    
  }
  func addSpritesForCookies(cookies: Set<Cookie>) {
    for cookie in cookies {
      let sprite = SKSpriteNode(imageNamed: cookie.cookieType.spriteName)
      sprite.position = pointForColumn(cookie.column, row: cookie.row)
      cookiesLayer.addChild(sprite)
      cookie.sprite = sprite
    }
  }

  func addTiles() {
    for row in 0..<NumRows {
      for column in 0..<NumColumns {
        if (level.tileAtColumn(column, row: row) != nil) {
          let tileNode = SKSpriteNode(imageNamed: "Tile")
          tileNode.position = pointForColumn(column, row: row)
          tilesLayer.addChild(tileNode)
        }
      }
    }
  }
  func pointForColumn(column: Int, row: Int) -> CGPoint {
    return CGPoint(
      x: CGFloat(column)*TileWidth + TileWidth/2,
      y: CGFloat(row)*TileHeight + TileHeight/2
    )
  }
  override func didMoveToView(view: SKView) {
      /* Setup your scene here */

  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
     /* Called when a touch begins */
      

  }
  
  override func update(currentTime: CFTimeInterval) {
      /* Called before each frame is rendered */
  }
}
