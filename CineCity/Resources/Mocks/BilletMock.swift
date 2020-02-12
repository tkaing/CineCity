//
//  BilletsMockService.swift
//  CineCity
//
//  Created by Viviana Montiel on 24/01/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit
import Foundation

class BilletMock: BilletCall {
    
    var ticket1 = Billet(id: 1, time: "18:30", date: Date(), film: Film(id: 1, title: "Star Wars: The Force Awakens", releaseDate: Date(), image: #imageLiteral(resourceName: "logo")), user: User(id: 1, email: "", password: ""))
    
    var ticket2 = Billet(id: 2, time: "20:00", date: Date(), film: Film(id: 1, title: "2001: A Space Odessey", releaseDate: Date(), image: #imageLiteral(resourceName: "logo")), user: User(id: 1, email: "", password: ""))
    
    func all(completion: @escaping ([Billet]) -> Void) {
        completion([ticket1, ticket2])
    }
    
    func one(_ id: Int, completion: @escaping (Billet?) -> Void) {
        completion(ticket1)
    }
    
    func save(object: Billet, completion: @escaping (Billet?) -> Void) {
        completion(ticket1)
    }
    
    func update(_ id: Int, object: Billet, completion: @escaping (Billet?) -> Void) {
       completion(ticket1)
    }
    
    func delete(_ id: Int, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}
