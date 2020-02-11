//
//  Film.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

struct Film {
    
    var id: Int
    var title: String
    var releaseDate: Date
    
    func dictionnary() -> [String : Any] {
        return [
            "id": self.id,
            "title": self.title,
            "releaseDate": DateUtils.toString(date: self.releaseDate)
        ]
    }
}
