//
//  HomeVCViewController.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit
import CoreData

class HomeVC: UIViewController {
    
    // MARK : Variables
    
    enum Home {
        static let town: String = "대화동"
        static let space : CGFloat = 15
    }
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var upperBtns: UIView!
    @IBOutlet weak var sellMy: UIView!
    @IBOutlet weak var homeFAB: UIButton!
    @IBOutlet weak var homeBtnStack: UIStackView!
    
    
    // FAB dim View
    lazy var floatingDimView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.alpha = 0
        view.isHidden = true
        
        self.view.insertSubview(view, belowSubview: self.homeBtnStack)
        
        return view
    }()
    
    var isShowFloating: Bool = false
    
    lazy var buttonViews : [UIView] = [self.sellMy, self.upperBtns]
    
    // MARK : Data
    lazy var itemArray:[item] = fixedData
    var items = [Item]()
    
    var mockImages : [String] = ["image2", "Image3", "Image4", "Image5", "image1", "freitag"]
    
    // MARK : View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NotificationCenter.default.addObserver(self, selector: #selector(printMsg), name: Notification.Name(rawValue: "flag"), object: nil)
        navBarWithTownSetUp(title: Home.town)
        rightBarButtons()
        registerXib()
        homeFAB.layer.cornerRadius = 25
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = DBManager.share.fetchItems()
        homeTableView.reloadData()
    }
    
    @objc func printMsg(_ notification: Notification){
        let flag = notification.object as? Bool
        isShowFloating = flag ?? true
    }

    //var isShowFloating = flag
    
    private func registerXib(){
        let nibName = UINib(nibName: "HomeTableCell", bundle: nil)
        homeTableView.register(nibName, forCellReuseIdentifier: "homeCell")
    }
    
    @IBAction func floatingActionBtn(_ sender: UIButton) {
        if isShowFloating{ // turn off
            
            buttonViews.reversed().forEach {
                btn in UIView.animate(withDuration: 0.3){
                    btn.isHidden = true
                    //self.view.layoutIfNeeded()
                }
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            }){ (_) in
                self.floatingDimView.isHidden = true
            }
            
        } else { // turn on
            self.floatingDimView.isHidden = false
            
            UIView.animate(withDuration: 0.5){
                self.floatingDimView.alpha = 1
            }
            
            buttonViews.forEach { [weak self] btn in
                btn.isHidden = false
                btn.alpha = 0
                
                UIView.animate(withDuration: 0.1) {
                    btn.alpha = 1
                    self?.view.layoutIfNeeded()
                }
            }
        }
        
        isShowFloating = !isShowFloating
        
        let fabImage = isShowFloating ? UIImage(systemName: "multiply")?.withTintColor(.black, renderingMode: .alwaysOriginal) : UIImage(systemName: "plus")
        let fabColor = isShowFloating ?  UIColor.white : UIColor.orange
//        let fabColor = isShowFloating ? CGColor(red: 1, green: 0, blue: 0, alpha: 1) : CGColor(red: 0, green: 0, blue: 0, alpha: 1)
//        let fabImage = isShowFloating ? UIImage(named: "fabSelect") : UIImage(named: "fabDefault")

        UIView.animate(withDuration: 0.3){
            sender.setImage(fabImage, for: .normal)
            sender.backgroundColor = fabColor
            //sender.setBackgroundColor(fabColor, for: .normal)
        }
    }
    
    @IBAction func sellMyBtn(_ sender: Any) {
        buttonViews.reversed().forEach {
            btn in UIView.animate(withDuration: 0.3){
                btn.isHidden = true
                //self.view.layoutIfNeeded()
            }
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.floatingDimView.alpha = 0
        }){ (_) in
            self.floatingDimView.isHidden = true
        }
        
        self.homeFAB.setImage(UIImage(systemName: "plus"), for: .normal)
        self.homeFAB.backgroundColor = UIColor.orange
    }
    

}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return itemArray.count
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell dequeue, downcast
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as? HomeTableCell else { return UITableViewCell() }
        
        let newItem = items[indexPath.row]
        cell.homeCellTitle.text = newItem.title
        cell.homeCellLocation.text = "대화동"
        cell.homeCellPrice.text = newItem.price
        cell.homeCellTime?.text = "1분 전"
        
        
        let tmpImage = mockImages[indexPath.row]
        cell.HomeCellimageView.image = UIImage(named: tmpImage)
        cell.HomeCellimageView.layer.cornerRadius = 10
        //cell.HomeCellimageView.image = UIImage(data: newItem.image!)
//        cell.HomeCellimageView.image = UIImage(data: newItem.image ?? <#default value#>) ?? UIImage(named: "freitag")
        // MockUp data 코드
//        cell.HomeCellimageView.image = UIImage(named: itemArray[indexPath.row].itemImageName)
//        cell.HomeCellimageView.layer.cornerRadius = 5
//        cell.homeCellTitle.text = itemArray[indexPath.row].itemTitle
//        cell.homeCellLocation.text = itemArray[indexPath.row].itemLoc
//        cell.homeCellTime?.text = itemArray[indexPath.row].itemTime
//        cell.homeCellPrice.text = itemArray[indexPath.row].itemPrice
//        // cell 구성
//        cell.configWithItem(item: dataArray[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            do{
                try DBManager.share.context.delete(items[indexPath.row])
            }catch{print("Error in deleting")}
            
            DBManager.share.saveContext()
            items.remove(at: indexPath.row)
            homeTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.items[indexPath.row]

        // @@
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditingVC") as! EditingVC
        vc.selectedItem = selectedItem
        //vc.editTitle.text = selectedItem.title
        self.navigationController?.pushViewController(vc, animated: true)
        
//        // @@ ver 2
//        performSegue(withIdentifier: "toEditSegue", sender: self)
    
    }
    
}

