//
//  UsersSwiftMVVMViewController.swift
//  UsersSwiftMVVM
//
//  Created by Daniel Reis on 03/06/20.
//  Copyright © 2020 Daniel Reis. All rights reserved.
//

import UIKit

class UsersSwiftMVVMViewController: UITableViewController {
    
    private var userListViewModel: UserListViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    private func configUI() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let url =  URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        WebService().getUsers(url: url) { (users) in
            
            if let objUsers = users {
                self.userListViewModel = UserListViewModel(users: objUsers)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.userListViewModel == nil ? 0 : self.userListViewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserTableViewCell else {
            fatalError()
        }
        
        let userVM = self.userListViewModel.userAtIndes(indexPath.row)
        
        cell.lblName.text = userVM.name
        cell.lblEmail.text = userVM.email
        cell.lblUserName.text = userVM.userName
        
        return cell
    }
}
