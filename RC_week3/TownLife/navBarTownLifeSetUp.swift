//
//  navBarTownLifeSetUp.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

extension TownLifeVC {
//    func navBarWithTownSetUp(title: String){
//        let titleLabel = UILabel()
//        titleLabel.textColor = .black
//        titleLabel.text = title
//        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
//        
//    }
    
    @objc func PrintSearch(){
        print("Search Button")
    }
    @objc func PrintProfile(){
        print("Menu Button")
    }
    @objc func PrintNofity(){
        print("Notifyy Button")
    }
    
    
    func rightBarButtons(){
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = TownLife.space
        
        let searchBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintSearch), symbolName: "magnifyingglass")
        let profileBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintProfile), symbolName: "person.crop.circle")
        let nofityBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintNofity), symbolName: "bell")
        
        self.navigationItem.rightBarButtonItems = [nofityBtn, profileBtn, searchBtn]
    }
    
}
