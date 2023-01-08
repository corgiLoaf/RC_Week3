//
//  UINavigationItem+Extensions.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit
extension UINavigationItem{
    func makeSFSymbolButton(_ target: Any?, action: Selector, symbolName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: symbolName), for: .normal)
        button.tintColor = .black
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        return barButtonItem
    }
}
