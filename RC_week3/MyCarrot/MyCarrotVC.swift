//
//  MyCarrotVC.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

class MyCarrotVC: UIViewController {
    
    @IBOutlet weak var menuTable: UITableView!
    
    let menuArray = [
        [menu1, menu2, menu3, menu4],
        [menu5],
        [menu6, menu7]
    ]
    
    let titles = ["나의 거래", "나의 동네생활", "나의 비지니스"]
    
    enum MyCarrot {
            static let title: String = "나의 당근"
            static let space : CGFloat = 15
        }
    
    
    // MARK : View
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarWithTownSetUp(title: MyCarrot.title)
        rightBarButtons()
        menuTable.delegate = self
        menuTable.dataSource = self
    }

}

extension MyCarrotVC : UITableViewDelegate, UITableViewDataSource {
    
    
    // section header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        //view.backgroundColor = .orange

        let label = UILabel(frame: view.bounds)
        label.text = titles[section]
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        return view
    }
    


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 40
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return titles[section]
    //    }
    
    // section footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
        view.backgroundColor = .gray
        view.alpha = 0.5
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell", for: indexPath)
        cell.textLabel?.text = menuArray[indexPath.section][indexPath.row].title
        cell.imageView?.image = UIImage(systemName: menuArray[indexPath.section][indexPath.row].icon)
        cell.imageView?.tintColor = .label
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
