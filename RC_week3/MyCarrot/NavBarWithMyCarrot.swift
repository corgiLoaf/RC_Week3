//
//  NavBarWithMyCarro.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

extension MyCarrotVC {

    
    @objc func PrintSetting(){
        print("Setting Button")
    }

    
    func rightBarButtons(){
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = MyCarrot.space
        
        let settingBtn = self.navigationItem.makeSFSymbolButton(self, action: #selector(PrintSetting), symbolName: "gearshape")
        
        self.navigationItem.rightBarButtonItem = settingBtn
    }
    
}
