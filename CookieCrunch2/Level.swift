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
        let cookieType = CookieType.random()
        let cookie = Cookie(column: column, row: row, cookieType: cookieType)
        cookies[column, row] = cookie
        cookiesSet.insert(cookie)
      }
    }    
    return cookiesSet
  }
}
