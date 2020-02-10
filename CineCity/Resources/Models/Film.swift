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
    
    func dictionnary() -> [String : Any] {
        return [
            "id": self.id,
            "title": self.title
        ]
    }
}
