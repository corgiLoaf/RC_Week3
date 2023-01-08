//
//  navBarWithChat.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

extension ChatVC {


    @objc func PrintQR(){
        print("QR Button")
    }
    @objc func PrintNofity(){
        print("Notify Button")
    }
    
    
    func rightBarButtons(){
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = NearBy.space
    
        let qrBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintQR), symbolName: "viewfinder")
        let nofityBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintNofity), symbolName: "bell")
        
        self.navigationItem.rightBarButtonItems = [nofityBtn, qrBtn]
    }
    
}
