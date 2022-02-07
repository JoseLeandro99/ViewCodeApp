//
//  SportViewUITableCell.swift
//  LoginViewCode
//
//  Created by Dev on 07/02/22.
//

import UIKit

class SportViewUITableCell : UITableViewCell {
    
    static let indentifier: String = "SportViewUITableCell"
    
    var sportTableViewCell: SportTableCellScreen = SportTableCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configSuperView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSuperView() {
        self.contentView.addSubview(sportTableViewCell)
    }
    
    // SnapKit
    func configConstraints() {
        self.sportTableViewCell.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
