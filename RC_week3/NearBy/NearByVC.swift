//
//  NearByVC.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

class NearByVC: UIViewController {
    
    enum NearBy {
        static let town: String = "대화동"
        static let space : CGFloat = 15
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navBarWithTownSetUp(title: NearBy.town)
        rightBarButtons()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
