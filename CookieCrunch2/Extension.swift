//
//  Extension.swift
//  CookieCrunch2
//
//  Created by Thang Nguyen on 5/19/16.
//  Copyright © 2016 Thang Nguyen. All rights reserved.
//

import Foundation

extension Dictionary {
  static func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
    if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json") {
      let data = NSData(contentsOfFile: path)
      if let data = data {
        do {
          let dictionary: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data,
                                                        options: []) as! [String:AnyObject]
          if let dictionary = dictionary as? Dictionary<String, AnyObject> {
            return dictionary
          } else {
            print("Level file '\(filename)' is not valid")
            return nil
          }

        } catch let error {
          print("JSON serialization failed. Error: \(error)")
        }
      }
    }
    return nil
  }
}
