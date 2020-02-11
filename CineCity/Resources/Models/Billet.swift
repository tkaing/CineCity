//
//  Billet.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

struct Billet {
    
    var id: Int
    var time: String
    var date: Date
    var film: Film
    var user: User
    
    func dictionnary() -> [String : Any] {
        return [
            "id": self.id,
            "time": self.time,
            "date": self.date,
            "film": self.film.dictionnary(),
            "user": self.user.dictionnary()
        ]
    }
}
