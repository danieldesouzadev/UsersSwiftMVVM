//
//  WebService.swift
//  UsersSwiftMVVM
//
//  Created by Daniel Reis on 03/06/20.
//  Copyright © 2020 Daniel Reis. All rights reserved.
//

import Foundation

class WebService {
    
    func getUsers(url: URL, completion: @escaping ([User]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                if let responseData = try? JSONDecoder().decode([User].self, from: data) {
                    completion(responseData)
                }else{  
                    completion(nil)
                }
            }
        }.resume()
    }
}
