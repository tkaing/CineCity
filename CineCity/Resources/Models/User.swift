//
//  User.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

struct User {
    
    var id: Int
    var email: String
    var password: String
    
    func dictionnary() -> [String : Any] {
        return [
            "id": self.id,
            "email": self.email,
            "password": self.password
        ]
    }
}
