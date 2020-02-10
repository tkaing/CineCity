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
    var film: Film
    var date: Date
    var time: String
    
    func dictionnary() -> [String : Any] {
        return [
            "id": self.id,
            "film": self.film.dictionnary(),
            "date": self.date,
            "time": self.time
        ]
    }
}
