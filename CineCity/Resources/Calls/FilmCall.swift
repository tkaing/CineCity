//
//  FilmCall.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

protocol FilmCall {
    
    func all(completion: @escaping ([Film]) -> Void)
    func one(_ id: Int, completion: @escaping (Film?) -> Void)
    func save(object: Film, completion: @escaping (Film?) -> Void)
    func update(_ id: Int, object: Film, completion: @escaping (Film?) -> Void)
    func delete(_ id: Int, completion: @escaping (Bool) -> Void)
}
