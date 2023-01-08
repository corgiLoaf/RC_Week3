//
//  navBarWithNearBySetUp.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

extension NearByVC {

    
    @objc func PrintSearch(){
        print("Search Button")
    }
    @objc func PrintQR(){
        print("QR Button")
    }
    @objc func PrintNofity(){
        print("Notifyy Button")
    }
    
    
    func rightBarButtons(){
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = NearBy.space
        
        let searchBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintSearch), symbolName: "magnifyingglass")
        let qrBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintQR), symbolName: "viewfinder")
        let nofityBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintNofity), symbolName: "bell")
        
        self.navigationItem.rightBarButtonItems = [nofityBtn, qrBtn, searchBtn]
    }
    
}
