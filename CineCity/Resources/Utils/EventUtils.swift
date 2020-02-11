//
//  EventUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class EventUtils {
    
    static func map(item: [String:Any]) -> Event? {
        guard
            let id = item["id"] as? Int,
            let title = item["title"] as? String,
            let category = item["category"] as? String,
            let description = item["description"] as? String
        else {
            return nil
        }
        return Event(id: id, title: title, category: category, description: description)
    }
}
