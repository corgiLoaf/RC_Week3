//
//  HomeNavCtrlViewController.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

extension HomeVC {
    
    @objc func PrintSearch(){
        print("Search Button")
    }
    @objc func PrintMenu(){
        print("Menu Button")
    }
    @objc func PrintNofity(){
        print("Notify Button")
    }
    
    
    func rightBarButtons(){
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = Home.space
        
        let searchBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintSearch), symbolName: "magnifyingglass")
        let menunBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintMenu), symbolName: "line.3.horizontal")
        let nofityBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintNofity), symbolName: "bell")
        
        self.navigationItem.rightBarButtonItems = [nofityBtn,menunBtn, searchBtn]
    }
    
}
