//
//  Level.swift
//  CookieCrunch2
//
//  Created by Thang Nguyen on 5/15/16.
//  Copyright © 2016 Thang Nguyen. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
  private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
  private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)

  init(filename: String){
    if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
      if let tilesArray: AnyObject = dictionary["tiles"]{
        let tilesArray1 = tilesArray as! [[Int]]
        for (row, rowArray) in tilesArray1.enumerate() {
          let tileRow = NumRows - row - 1
          for (column, value) in rowArray.enumerate() {
            if value == 1 {
              tiles[column, tileRow] = Tile()
            }
          }
        }
      }
    }
  }
  func tileAtColumn(column: Int, row: Int) -> Tile? {
    assert(column >= 0 && column < NumColumns)
    assert(row >= 0 && row < NumRows)
    return tiles[column, row]
  }
  func cookieAtColumn(column: Int, row: Int) -> Cookie? {
    assert(column > 0 && column < NumColumns)
    assert(row > 0 && row < NumRows)
    return cookies[column, row]
  }

  func shuffle() -> Set<Cookie> {
    return createInitialCookies()
  }

  private func createInitialCookies() -> Set<Cookie> {
    var cookiesSet = Set<Cookie>()
    
    for row in 0..<NumRows {
      for column in 0..<NumColumns {
        if tiles[column, row] != nil {
          let cookieType = CookieType.random()
          let cookie = Cookie(column: column, row: row, cookieType: cookieType)
          cookies[column, row] = cookie
          cookiesSet.insert(cookie)
        }
      }
    }    
    return cookiesSet
  }
}
