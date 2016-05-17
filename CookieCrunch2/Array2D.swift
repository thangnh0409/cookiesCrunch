//
//  Array2D.swift
//  CookieCrunch2
//
//  Created by Thang Nguyen on 5/15/16.
//  Copyright © 2016 Thang Nguyen. All rights reserved.
//

import Foundation

struct Array2D<T> {
    let columns: Int
    let rows: Int
    private var array: Array<T?>

    init(columns: Int, rows: Int){
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows*columns, repeatedValue: nil)
    }
    subscript(column: Int, row: Int) -> T? {
      get {
        return array[row*columns + column]
      }
      set {
        array[row*columns + column] = newValue
      }
    }
}
