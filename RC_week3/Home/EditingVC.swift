//
//  EditingVC.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/07.
//

import UIKit

class EditingVC: UIViewController {

    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editPrice: UITextField!
    @IBOutlet weak var editPost: UITextField!
        
    var selectedItem: Item?
    
//    override func viewWillLayoutSubviews() {
//        if #available(iOS 11, *)  {
//            navigationBarConfig(yPos: 44)
//        }
//        else{
//            navigationBarConfig(yPos: 0)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "중고거래 수정하기"
        loadOriginalVal()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func editTapped(_ sender: Any) {
        if let title = editTitle.text, let price = editPrice.text, let post = editPost.text{
            selectedItem?.title = title
            selectedItem?.post = post
            selectedItem?.price = price
            DBManager.share.saveContext()
        }
    }
    
    private func customNav() {
        // left
        let close = UIImage(systemName: "multiply")?.withRenderingMode(.alwaysTemplate)
        let closeBtn = UIBarButtonItem(image: close, style: .done, target: self, action: #selector(goBack))
        closeBtn.tintColor = UIColor.label
        navigationItem.leftBarButtonItem = closeBtn

    }
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func loadOriginalVal(){
        editTitle.placeholder = selectedItem?.title
        editPost.placeholder = selectedItem?.post
        editPrice.placeholder = selectedItem?.price
    }
    
//    func navigationBarConfig(yPos : Int){
//
//        let width = self.view.frame.width
//        let navBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: CGFloat(yPos), width: width, height: 44))
//        self.view.addSubview(navBar)
//        let navItem = UINavigationItem(title: "중고거래 글 수정하기")
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(editDone))
//        navItem.setRightBarButton(doneBtn, animated: true)
//
//        navBar.setItems([navItem], animated: true)
//    }
    
    @objc func editDone(){
        if let title = editTitle.text, let price = editPrice.text, let post = editPost.text{
            selectedItem?.title = title
            selectedItem?.post = post
            selectedItem?.price = price
            DBManager.share.saveContext()
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
