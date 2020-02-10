//
//  FilmUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class FilmUtils {
    
    static func map(item: [String:Any]) -> Film? {
        guard
            let id = item["id"] as? Int,
            let title = item["title"] as? String
        else {
            return nil
        }
        return Film(id: id, title: title)
    }
}
