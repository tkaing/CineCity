//
//  FilmCallAPI.swift
//  CineCity
//
//  Created by Thierry Kg on 10/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import Alamofire

class FilmCallAPI: FilmCall {
    
    private let url: String = "http://tchooz.fr/film"
    
    func all(completion: @escaping ([Film]) -> Void) {
        Alamofire.request(self.url, method: .get).responseJSON { (request) in
            guard
                let items = request.value as? [[String:Any]]
            else {
                completion([])
                return
            }
            completion(items.compactMap(FilmUtils.map(item:)))
        }
    }
    
    func one(_ id: Int, completion: @escaping (Film?) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .get).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(FilmUtils.map(item: item))
        }
    }
    
    func save(object: Film, completion: @escaping (Film?) -> Void) {
        Alamofire.request(self.url, method: .post, parameters: object.dictionnary(), encoding: JSONEncoding.default).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(FilmUtils.map(item: item))
        }
    }
    
    func update(_ id: Int, object: Film, completion: @escaping (Film?) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .patch, parameters: object.dictionnary(), encoding: JSONEncoding.default).responseJSON { (request) in
            guard
                let item = request.value as? [String:Any]
            else {
                completion(nil)
                return
            }
            completion(FilmUtils.map(item: item))
        }
    }
    
    func delete(_ id: Int, completion: @escaping (Bool) -> Void) {
        Alamofire.request(self.url + "/\(String(id))", method: .delete).responseJSON { (request) in
            completion(request.response?.statusCode == 200)
        }
    }
}
