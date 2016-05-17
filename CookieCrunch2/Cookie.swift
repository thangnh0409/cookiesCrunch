//
//  Cookie.swift
//  CookieCrunch2
//
//  Created by Thang Nguyen on 5/15/16.
//  Copyright © 2016 Thang Nguyen. All rights reserved.
//

import SpriteKit

enum CookieType: Int {
    case Unknown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie

    static func random() -> CookieType {
      return CookieType(rawValue: Int(arc4random_uniform(6) + 1))!
    }
    var spriteName: String {
      let spriteNames = [
        "Croissant",
        "Cupcake",
        "Danish",
        "Donut",
        "Macaroon",
        "SugarCookie"]
        
      return spriteNames[rawValue - 1]
    }
    var highlightedSpriteName: String {
      return spriteName + "-Highlighted"
    }
}

class Cookie: Hashable{
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?

    init(column: Int, row: Int, cookieType: CookieType){
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }

    var hashValue: Int {
      return row*10 + column
    }
}

func ==(lhs: Cookie, rhs: Cookie) -> Bool {
  return lhs.row == rhs.row && lhs.column == rhs.column
}
