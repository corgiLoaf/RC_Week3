//
//  VC+Ext.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import Foundation
import UIKit

extension UIViewController{
    func navBarWithTownSetUp(title: String){
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        
    }
}
