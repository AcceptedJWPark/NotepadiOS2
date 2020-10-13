//
//  MemoListViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/20.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class MemoListTableviewCell: UITableViewCell{
    
    @IBOutlet var memoTitle: UILabel!
    @IBOutlet var memoSummary: UILabel!
    @IBOutlet var memoDate: UILabel!
    @IBOutlet var memoDelete: UIImageView!
    
    @IBOutlet var memoContainer: UIView!
}

class MemoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var ivMenu: UIImageView!
    
    @IBOutlet var headerContainer: UIView!
    @IBOutlet var searchViewContainer: UIView!
    
    @IBOutlet var trashView: UIView!
    @IBOutlet var memoTable: UITableView!
    
    var slideMenuWidth:CGFloat = 100
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var dimView: UIView!
    @IBOutlet var totalConainer: UIView!
    var userID: String!
    var datas: [MemoData] = []
    var selectedData: MemoData!
    var selectedIsReal: Bool!
    
    lazy var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.separatorColor = UIColor.white
        return tableView
    }()
    
    var menuLeftConstraints: NSLayoutConstraint?
    var menuSlideWitdthConstraints: NSLayoutConstraint?
    
    var menuTitle = ["LOG OUT","잠금번호 변경/찾기","글쓰기 방식 변경", "배경 설정", "사용자매뉴얼"]
    var menuImage = ["icon_login.png","icon_pw.png","icon_click.png","icon_bgr.png","icon_manual.png"]
    
    let statusBarRect = UIApplication.shared.statusBarFrame
    var height: CGFloat!
    
    lazy var menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let tapgesture = UITapGestureRecognizer(target:self,action : #selector(menuBtnTapped))
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapgesture)
        
        
        return view
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.menuTableView)
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        self.menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.menuTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        height = statusBarRect.height
        userID = UserDefaults.standard.string(forKey: "userID")!
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        let tapgesture2 = UITapGestureRecognizer(target:self,action : #selector(menuBtnTapped))
        
        ivMenu.isUserInteractionEnabled = true
        ivMenu.addGestureRecognizer(tapgesture2)
        
        
        
        headerContainer.layer.shadowColor = UIColor.gray.cgColor
        headerContainer.layer.shadowOpacity = 0.5
        headerContainer.layer.shadowRadius = 3
        headerContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        searchViewContainer.layer.cornerRadius = 10
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(keyboardHide(tapGestureRecognizer:)))
        
        trashView.isHidden = true
        trashView.isUserInteractionEnabled = true
        trashView.addGestureRecognizer(tapGestureRecognizer3)
        
        setupMenuView()
        getBasicMemoList()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "seguePaper":
            let paperVC = segue.destination as! PaperViewController
            paperVC.memoCode = self.selectedData.memoCode
            paperVC.isNew = false
            paperVC.isReal = selectedIsReal
            paperVC.rTitle = self.selectedData.rTitle
            paperVC.rContent = self.selectedData.rContent
            paperVC.fTitle = self.selectedData.fTitle
            paperVC.fContent = self.selectedData.fContent
            paperVC.clickType = Int(self.selectedData.clickType)
            paperVC.secureType = Int(self.selectedData.secureType)
            return
        default:
            return
        }
    }
    
    func setupMenuView(){
        self.view.addSubview(menuView)
        menuSlideWitdthConstraints =  menuView.widthAnchor.constraint(equalToConstant: slideMenuWidth) // ---- 5
        menuSlideWitdthConstraints!.isActive = true
        menuView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: height).isActive = true
        menuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        menuLeftConstraints = menuView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -view.frame.width) // ---- 6
        menuLeftConstraints!.isActive = true
        
        self.view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: height).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.menuView.leftAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
    }
    
    
    @objc func menuBtnTapped() {
        
        if menuLeftConstraints?.constant == 0 {
            //메뉴바 클로즈
            dimView.isHidden = true
            print("menu close")
            menuLeftConstraints?.constant = -view.frame.width
            
            
        }else {
            //메뉴바 오픈
            dimView.isHidden = false
            menuLeftConstraints?.constant = 0
            print("menu open")
        }
        
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        trashView.isHidden = false
    }
    
    
    @objc func keyboardWillDisappear() {
        trashView.isHidden = true
    }
    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(tableView == memoTable)
        {
            return self.datas.count
        }else{
            return menuTitle.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView == memoTable)
        {
            let int = 123
            let cgfloat = CGFloat(int)
            return cgfloat
        }else{
            let int = 60
            let cgfloat = CGFloat(int)
            return cgfloat
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == memoTable)
        {
            
        }else
        {
            if(indexPath.row == 3)
            {
                performSegue(withIdentifier: "pageToBgrSetting", sender: nil)

            
            }
        }
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == memoTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "memolistCell", for: indexPath) as! MemoListTableviewCell
            let data = self.datas[indexPath.row]
            cell.memoContainer.layer.shadowColor = UIColor.gray.cgColor
            cell.memoContainer.layer.shadowOpacity = 0.5
            cell.memoContainer.layer.shadowRadius = 3
            cell.memoContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
            
            if data.secureType == "3" {
                cell.memoTitle.text = data.fTitle
                cell.memoSummary.text = data.fContent
            } else {
                cell.memoTitle.text = data.rTitle
                cell.memoSummary.text = data.rContent
            }
            
            cell.memoDate.text = data.date
            let singleTapGesture = SecureTapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
            let doubleTapGesture = SecureTapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
            doubleTapGesture.numberOfTapsRequired = 2
            let longPressGesture = SecureLongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
            if data.clickType == "3" {
                longPressGesture.minimumPressDuration = 1
            } else if data.clickType == "4" {
                longPressGesture.minimumPressDuration = 3
            } else {
                longPressGesture.minimumPressDuration = 0.5
            }
            
            
            singleTapGesture.require(toFail: doubleTapGesture)
            
            singleTapGesture.data = data
            doubleTapGesture.data = data
            longPressGesture.data = data
            
            cell.isUserInteractionEnabled = true
            cell.addGestureRecognizer(singleTapGesture)
            cell.addGestureRecognizer(doubleTapGesture)
            cell.addGestureRecognizer(longPressGesture)
            
            
            return cell
        }else{
            let cell = UITableViewCell()
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: menuImage[indexPath.row])
            imageView.contentMode = .scaleAspectFill
            cell.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 120)
                .isActive = true // ---- 1
            imageView.centerYAnchor.constraint(equalTo:cell.centerYAnchor)
                .isActive = true // ---- 2
            imageView.heightAnchor.constraint(equalToConstant: 15)
                .isActive = true // ---- 3
            imageView.widthAnchor.constraint(equalToConstant: 15)
                .isActive = true // ---- 4
            
            let label = UILabel()
            label.text = menuTitle[indexPath.row]
            cell.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20)
                .isActive = true // ---- 1
            label.centerYAnchor.constraint(equalTo:cell.centerYAnchor)
                .isActive = true // ---- 2
            label.heightAnchor.constraint(equalToConstant: 40)
                .isActive = true // ---- 3
            label.widthAnchor.constraint(equalToConstant: 200)
                .isActive = true // ---- 4
            label.font = UIFont.systemFont(ofSize: CGFloat(15))
            
            cell.selectionStyle = .none
            
            return cell
            
        }
        
        
    }
    
    func getBasicMemoList() {
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Memo/getBasicMemoList.do", method: .post, parameters: ["MemID": userID!, "SearchText": ""])
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let jsonArray = value as! [[String:Any]]
                    self.datas = []
                    
                    for json in jsonArray {
                        let memoCode = json["MemoCode"] as! Int
                        let rTitle = json["RTitle"] as! String
                        let rContent = json["RContent"] as! String
                        let fTitle = json["FTitle"] as! String
                        let fContent = json["FContent"] as! String
                        let secureType = json["SecureType"] as! String
                        let clickType = json["ClickType"] as! String
                        
                        let pdate1 = json["RegDate"] as! Double
                        let routineDateFormatter = DateFormatter()
                        routineDateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
                        let pdate2 = Date(timeIntervalSince1970: pdate1/1000.0)
                        let date = routineDateFormatter.string(from: pdate2)
                        
                        let data = MemoData(memoCode: memoCode, rTitle: rTitle, rContent: rContent, fTitle: fTitle, fContent: fContent, date: date, secureType: secureType, clickType: clickType)
                        
                        self.datas.append(data)
                    }
                    
                    self.memoTable.reloadData()
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func keyboardHide(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
        
    }
    
    @objc func singleTap(_ sender: SecureTapGestureRecognizer) {
        print("single tap")
        // 보안 설정인 경우
        if sender.data.secureType == "3" {
            // 클릭 타입이 단일 선택인 경우
            if sender.data.clickType == "1" {
                // 실제글 표시
                showPaper(data: sender.data, isReal: true)
            } else {
                // 페이크글 표시
                showPaper(data: sender.data, isReal: false)
            }
        } else {
            // 실제글 표시 (일반글)
            showPaper(data: sender.data, isReal: true)
        }
    }
    
    @objc func doubleTap(_ sender: SecureTapGestureRecognizer) {
        print("double tap")
        // 보안 설정인 경우
        if sender.data.secureType == "3" {
            // 클릭 타입이 더블클릭인 경우
            if sender.data.clickType == "2" {
                // 실제글 표시
                showPaper(data: sender.data, isReal: true)
            } else {
                // 페이크글 표시
                showPaper(data: sender.data, isReal: false)
            }
        } else {
            // 실제글 표시 (일반글)
            showPaper(data: sender.data, isReal: true)
        }
    }
    
    @objc func longPress(_ sender: SecureLongPressGestureRecognizer) {
        if sender.state == .ended {
            print("long press")
            // 보안 설정인 경우
            if sender.data.secureType == "3" {
                // 클릭 타입이 롱클릭인 경우
                if sender.data.clickType == "3" || sender.data.clickType == "4" {
                    // 실제글 표시
                    showPaper(data: sender.data, isReal: true)
                } else {
                    // 페이크글 표시
                    showPaper(data: sender.data, isReal: false)
                }
            } else {
                // 실제글 표시 (일반글)
                showPaper(data: sender.data, isReal: true)
            }
        }
    }
    
    func showPaper(data: MemoData, isReal: Bool) {
        self.selectedData = data
        self.selectedIsReal = isReal
        
        self.performSegue(withIdentifier: "seguePaper", sender: nil)
    }
}

class SecureTapGestureRecognizer: UITapGestureRecognizer {
    var data: MemoData!
}

class SecureLongPressGestureRecognizer: UILongPressGestureRecognizer {
    var data: MemoData!
}


class MemoData {
    var memoCode: Int
    var rTitle: String
    var rContent: String
    var fTitle: String
    var fContent: String
    var date: String
    var secureType: String
    var clickType: String
    
    init(memoCode: Int, rTitle: String, rContent: String, fTitle: String, fContent: String, date: String, secureType: String, clickType: String) {
        self.memoCode = memoCode
        self.rTitle = rTitle
        self.rContent = rContent
        self.fTitle = fTitle
        self.fContent = fContent
        self.date = date
        self.secureType = secureType
        self.clickType = clickType
    }
}
