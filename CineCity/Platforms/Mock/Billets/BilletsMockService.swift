//
//  BilletsMockService.swift
//  CineCity
//
//  Created by Viviana Montiel on 24/01/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

class BilletsMockService: BilletService {
    
    private let billets: [Billet] = [
        Billet(id:"1" ,film: "Star Wars: The Force Awakens", time: "18:30" , date: "24/01/2020"),
        Billet(id:"2" , film: "2001: A Space Odessey", time: "20:00", date: "25/01/2020" )
    ]
    
    
    func getAll(completion: @escaping ([Billet]) -> Void) {
        completion(self.billets)
    }
    
    func getById(_ id: String, completion: @escaping (Billet?) -> Void) {
        completion(self.billets.first(where: { (r) -> Bool in
            return r.id == id
        }))
    }
    
    func create(film: String, time: String, date: String, completion: @escaping (Bool) -> Void) {
        completion(false)
    }
}
