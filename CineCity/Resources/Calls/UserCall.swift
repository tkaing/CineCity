//
//  UserCall.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Foundation

protocol UserCall {
    
    func all(completion: @escaping ([User]) -> Void)
    func one(_ id: Int, completion: @escaping (User?) -> Void)
    func save(object: User, completion: @escaping (User?) -> Void)
    func update(_ id: Int, object: User, completion: @escaping (User?) -> Void)
    func delete(_ id: Int, completion: @escaping (Bool) -> Void)
}
