//
//  UserCallAPI.swift
//  CineCity
//
//  Created by Thierry Kg on 11/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Alamofire

class UserCallAPI: UserCall {
    
    private let url: String = "http://tchooz.fr/user"
    
    func all(completion: @escaping ([User]) -> Void) {
        Alamofire.request(self.url + "/all", method: .get).responseJSON { (request) in
            guard
                let items = request.value as? [[String:Any]]
            else {
                completion([])
                return
            }
            completion(items.compactMap(UserUtils.map(item:)))
        }
    }
    
    func one(_ id: Int, completion: @escaping (User?) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .get).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(UserUtils.map(item: item))
        }
    }
    
    func save(object: User, completion: @escaping (User?) -> Void) {
        Alamofire.request(self.url, method: .post, parameters: object.dictionnary(), encoding: JSONEncoding.default).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(UserUtils.map(item: item))
        }
    }
    
    func update(_ id: Int, object: User, completion: @escaping (User?) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .patch, parameters: object.dictionnary(), encoding: JSONEncoding.default).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(UserUtils.map(item: item))
        }
    }
    
    func delete(_ id: Int, completion: @escaping (Bool) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .delete).responseJSON { (request) in
            completion(request.response?.statusCode == 200)
        }
    }
}
