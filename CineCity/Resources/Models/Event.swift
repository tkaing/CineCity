//
//  Event.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

struct Event {
    
    var id: Int
    var title: String
    var category: String
    var description: String
    
    func dictionnary() -> [String : Any] {
        return [
            "id": self.id,
            "title": self.title,
            "category": self.category,
            "description": self.description
        ]
    }
}

