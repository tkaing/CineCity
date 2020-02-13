//
//  SessionCall.swift
//  CineCity
//
//  Created by Thierry Kg on 13/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

protocol SessionCall {
    
    func all(completion: @escaping ([Session]) -> Void)
    func one(_ id: Int, completion: @escaping (Session?) -> Void)
    func save(object: Session, completion: @escaping (Session?) -> Void)
    func update(_ id: Int, object: Session, completion: @escaping (Session?) -> Void)
    func delete(_ id: Int, completion: @escaping (Bool) -> Void)
}
