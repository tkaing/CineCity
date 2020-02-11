//
//  BilletUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class BilletUtils {
    
    static func map(item: [String:Any]) -> Billet? {
        guard
            let id = item["id"] as? Int,
            let time = item["time"] as? String,
            let date = item["date"] as? String,
            let film = item["film"] as? [String:Any],
            let user = item["user"] as? [String:Any],
            let dateObject = DateUtils.map(date: date),
            let filmObject = FilmUtils.map(item: film),
            let userObject = UserUtils.map(item: user)
        else {
            return nil
        }
        return Billet(id: id, time: time, date: dateObject, film: filmObject, user: userObject)
    }
    
    static func filterByUser(tickets: [Billet]) -> [Billet] {
        return tickets.filter {
            $0.user.id == UserUtils.user.id
        }
    }
}
