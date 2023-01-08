//
//  WritingVC.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/05.
//

import UIKit
import CoreData

class WritingVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputPrice: UITextField!
    @IBOutlet weak var inputPost: UITextField!
    
    
    @IBOutlet weak var addImageView: UIView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var newImage: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    var items = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "중고거래 글쓰기"
        customNav()
        configView()
        // Do any additional setup after loading the view.
    }
    
    func configView(){
        addImageView.layer.borderWidth = 0.5
        addImageView.layer.borderColor = UIColor.lightGray.cgColor
        addImageView.layer.cornerRadius = 10
    }
    
    @IBAction func addImagePressed(_ sender: Any) {
        self.openImagePicker()
    }
    
    
    @IBAction func onClickAdd(_ sender: Any) {
        if let title = inputTitle.text, let price = inputPrice.text, let post = inputPost.text{
            let newItemData = Item(context: DBManager.share.context)
            newItemData.title = title
            newItemData.price = price
            newItemData.post = post
            newItemData.image = self.newImage.image?.pngData()
            DBManager.share.saveContext()
            
            self.navigationController?.popViewController(animated: true)
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
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "flag"), object: false)
        self.navigationController?.popViewController(animated: true)
    }

}

extension WritingVC : UIImagePickerControllerDelegate{

    
    func openImagePicker(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            self.newImage.image = image
        }
    }
}
