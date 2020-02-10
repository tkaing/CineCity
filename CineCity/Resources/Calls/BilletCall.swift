//
//  FilmCall.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

protocol BilletCall {
    
    func all(completion: @escaping ([Billet]) -> Void)
    func one(_ id: Int, completion: @escaping (Billet?) -> Void)
    func save(object: Billet, completion: @escaping (Billet?) -> Void)
    func update(_ id: Int, object: Billet, completion: @escaping (Billet?) -> Void)
    func delete(_ id: Int, completion: @escaping (Bool) -> Void)
}
