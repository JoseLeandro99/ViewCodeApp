//
//  UserDetailView.swift
//  LoginViewCode
//
//  Created by Dev on 06/02/22.
//

import UIKit

class UserDetailView: UIView {
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubView()
        self.configUserImageViewConstraints()
        self.configUsernameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSubView() {
        self.addSubview(userImageView)
        self.addSubview(usernameLabel)
    }
    
    // Maneira nativa de setar constraints
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.heightAnchor.constraint(equalToConstant: 80),
            self.userImageView.widthAnchor.constraint(equalToConstant: 80),
            
            self.usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    // Snapkit constraints
    private func configUserImageViewConstraints() {
        self.userImageView.snp.makeConstraints { (make) in
            make.centerY.leading.equalToSuperview()
            make.height.width.equalTo(80)
        }
    }
    
    private func configUsernameLabelConstraints() {
        self.usernameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.userImageView.snp.trailing).offset(20)
        }
    }
}
