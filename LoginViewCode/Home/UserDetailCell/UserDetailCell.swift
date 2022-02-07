//
//  UserDetailCell.swift
//  LoginViewCode
//
//  Created by Dev on 06/02/22.
//

import UIKit

class UserDetailCell : UITableViewCell {
    
    static let identifier: String = "userDetailIdentifier"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configSubView()
        self.configDescriptionCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSubView() {
        self.contentView.addSubview(userDetailView)
    }
    
    func configCellData(data: DataUser) {
        self.userDetailView.userImageView.image = UIImage(named: data.nameImage)
        self.userDetailView.usernameLabel.text = data.name
    }
    
    func configDescriptionCellConstraints() {
        self.userDetailView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
