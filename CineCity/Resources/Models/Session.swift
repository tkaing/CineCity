//
//  Session.swift
//  CineCity
//
//  Created by Thierry Kg on 13/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

struct Session {
    
    var id: Int
    var time: String
    var film: Film
    
    func dictionnary() -> [String : Any] {
        return [
            "id": self.id,
            "time": self.time,
            "film": self.film.id
        ]
    }
}
