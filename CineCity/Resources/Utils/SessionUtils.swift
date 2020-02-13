//
//  SessionUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 13/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class SessionUtils {
    
    static func map(item: [String:Any]) -> Session? {
        guard
            let id = item["id"] as? Int,
            let time = item["time"] as? String,
            let film = item["film"] as? [String:Any],
            let filmObject = FilmUtils.map(item: film)
        else {
            return nil
        }
        return Session(id: id, time: time, film: filmObject)
    }
    
    static func filterByFilm(sessions: [Session], film: Film) -> [Session] {
        return sessions.filter {
            $0.film.id == film.id
        }
    }
}
