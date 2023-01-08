//
//  ChatVC.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

class ChatVC: UIViewController {

    enum NearBy {
        static let title: String = "채팅"
        static let space : CGFloat = 15
    }
    @IBOutlet weak var chatTableView: UITableView!
    
    
    // MARK : Data
    lazy var chatArray:[chat] = chatMockUpData
    
    // MARK : View
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarWithTownSetUp(title: NearBy.title)
        rightBarButtons()
        registerXib()
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    private func registerXib(){
        let nibName = UINib(nibName: "ChatTVC", bundle: nil)
        chatTableView.register(nibName, forCellReuseIdentifier: "chatCell")
    }


}

extension ChatVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as? ChatTVC else {return UITableViewCell()}
        
        cell.profile.image = UIImage(named:chatArray[indexPath.row].profile)
        cell.profile.layer.cornerRadius = 20
//        cell.profile.layer.cornerRadius = cell.profile.frame.width / 2
//        cell.profile.clipsToBounds = true
        
        cell.itemIMG.image = UIImage(named:chatArray[indexPath.row].itemImage)
        cell.itemIMG.layer.cornerRadius = 5
        
        cell.nickname.text = chatArray[indexPath.row].nickname
        cell.chatLoc.text = chatArray[indexPath.row].location
        cell.chatDate.text = chatArray[indexPath.row].date
        cell.message.text = chatArray[indexPath.row].message
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //swipe actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "X") { (action, view, success) in
            self.chatArray.remove(at: indexPath.row)
        }
        
        //let notifyAction = UIContextualAction(style: .normal, title: <#T##String?#>, handler: <#T##UIContextualAction.Handler##UIContextualAction.Handler##(UIContextualAction, UIView, @escaping (Bool) -> Void) -> Void#>)
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    
}
