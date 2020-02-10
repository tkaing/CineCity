//
//  BilletUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class BilletUtils {
    
    var filmUtils: FilmUtils {
        return FilmUtils()
    }
    
    static func map(item: [String:Any]) -> Billet? {
        guard
            let id = item["id"] as? Int,
            let time = item["time"] as? String,
            let date = item["date"] as? String,
            let film = item["film"] as? [String:Any],
            let filmObject = FilmUtils.map(item: film)
        else {
            return nil
        }
        return Billet(id: id, film: filmObject, date: Date(), time: time)
    }
}
