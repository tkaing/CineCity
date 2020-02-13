//
//  UserUtils.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class UserUtils {
    
    static var user: User = UserUtils.getModeNotLogged()
    
    static func map(item: [String:Any]) -> User? {
        guard
            let id = item["id"] as? Int,
            let email = item["email"] as? String,
            let password = item["password"] as? String
        else {
            return nil
        }
        return User(id: id, email: email, password: password)
    }
    
    static func getModeNotLogged() -> User {
        User(id: -1, email: "", password: "")
    }
    
    static func getModeAdministrator() -> User {
        User(id: -1, email: "admin@live.fr", password: "test")
    }
    
    static func isLogged() -> Bool {
        return UserUtils.user.email != "" || UserUtils.isAdministrator()
    }
    
    static func isAdministrator() -> Bool {
        return UserUtils.user.email == UserUtils.getModeAdministrator().email
    }
}
