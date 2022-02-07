//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by Dev on 06/02/22.
//

import UIKit

class HomeViewController : UIViewController {
    
    var homeScreen: HomeScreen?
    
    var dataUsers: [DataUser] = [
        DataUser(name: "Usuário #1", nameImage: "avatar1"),
        DataUser(name: "Usuário #2", nameImage: "avatar2"),
        DataUser(name: "Usuário #3", nameImage: "avatar3")
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailCell.identifier, for: indexPath) as? UserDetailCell
        
        cell?.configCellData(data: self.dataUsers[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
