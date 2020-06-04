//
//  UserViewModel.swift
//  UsersSwiftMVVM
//
//  Created by Daniel Reis on 03/06/20.
//  Copyright © 2020 Daniel Reis. All rights reserved.
//

import Foundation

struct UserListViewModel  {
    
    let users: [User]
    
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.users.count
    }
    
    func userAtIndes(_ index: Int) -> UserViewModel {
        
        let user = self.users[index]

        return UserViewModel.init(user)
    }
}

struct UserViewModel {
    
    private let user: User
    
    init(_ user: User){
        self.user = user
    }
 
    var name: String {
        return self.user.name
    }
    
    var email: String {
        return self.user.email
    }
    
    var userName: String {
        return self.user.username
    }
}
