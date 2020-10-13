//
//  PaperViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/10/12.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class PaperViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var headerContainer: UIView!
    @IBOutlet var headerTitle: UILabel!
    @IBOutlet var headerBack: UIImageView!
    
    
    @IBOutlet var btnSecurity: UIButton!
    
    @IBOutlet var paperContents: UITextView!
    @IBOutlet var paperTitle: UITextField!
    
    @IBOutlet var saveBtn: UIButton!
    
    @IBOutlet var totalContainer: UIView!
    @IBOutlet var paperContainer: UIView!
    
    var placeholderLabel : UILabel!
    
    var isNew: Bool!
    var isReal: Bool!
    var clickType: Int!
    var secureType: Int!
    var rTitle: String!
    var rContent: String!
    var fTitle: String!
    var fContent: String!
    var memoCode: Int!
    
    @IBOutlet var ivKeyboardHide: UIImageView!
    @IBOutlet var keyboardHide: NSLayoutConstraint!
    
    @IBOutlet var tvHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        saveBtn.layer.cornerRadius = 10
        headerContainer.layer.shadowColor = UIColor.gray.cgColor
        headerContainer.layer.shadowOpacity = 0.5
        headerContainer.layer.shadowRadius = 3
        headerContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        totalContainer.backgroundColor = UIColor(hexFromString: "#ffffff")
        paperContainer.backgroundColor = UIColor(hexFromString: "#f5f5f5")
        paperContents.backgroundColor = UIColor(hexFromString: "#f5f5f5")
        paperTitle.backgroundColor = UIColor(hexFromString: "#f5f5f5")
        headerContainer.backgroundColor = UIColor(hexFromString: "#ffffff")
        headerBack.tintColor = UIColor(hexFromString: "#544f4f")
        saveBtn.backgroundColor = UIColor(hexFromString: "#f37a00")
        btnSecurity.setTitleColor(UIColor(hexFromString: "#f37a00"), for: .normal)
        
        paperTitle.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexFromString: "#544f4f")])
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped1(tapGestureRecognizer:)))
        ivKeyboardHide.isUserInteractionEnabled = true
        ivKeyboardHide.addGestureRecognizer(tapGestureRecognizer1)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // 새로운 글인지
        if isNew {
            // 실제글인지
            if secureType == 3 {
                headerTitle.text = "비밀글"
            } else {
                headerTitle.text = "일반글"
            }
            paperTitle.text = ""
            paperContents.text = ""
        } else {
            // 실제글인지
            if isReal {
                if secureType == 3 {
                    headerTitle.text = "비밀글"
                    paperTitle.text = rTitle
                    paperContents.text = rContent
                    
                } else {
                    headerTitle.text = "일반글"
                    paperTitle.text = rTitle
                    paperContents.text = rContent
                }
            } else {
                headerTitle.text = "일반글"
                paperTitle.text = fTitle
                paperContents.text = fContent
            }
        }
        
        if paperContents.text.isEmpty {
            paperContents.delegate = self
            placeholderLabel = UILabel()
            placeholderLabel.text = "내용을 입력해주세요"
            placeholderLabel.font = UIFont.systemFont(ofSize: paperContents.font!.pointSize)
            placeholderLabel.sizeToFit()
            paperContents.addSubview(placeholderLabel)
            placeholderLabel.frame.origin = CGPoint(x: 5, y: (paperContents.font?.pointSize)! / 2)
            placeholderLabel.textColor = UIColor(hexFromString: "#544f4f")
            paperContents.isHidden = !paperContents.text.isEmpty
        }
        
    }
    
    @objc func imageTapped1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            print("keyboardHeight = \(keyboardHeight)")
            
            ivKeyboardHide.isHidden = false
            keyboardHide.constant = CGFloat(keyboardHeight + 20)
            tvHeight.constant = CGFloat(keyboardHeight + 20)
        }
        
    }
    
    
    @objc func keyboardWillDisappear() {
        ivKeyboardHide.isHidden = true
        tvHeight.constant = CGFloat(10)
    }
    
    func insertMemo() {
        let title = paperTitle.text!
        let content = paperContents.text!
        if title.count == 0 {
            print("제목을 입력해주세요.")
        }
        
        if content.count == 0 {
            print("내용을 입력해주세요.")
        }
        
        var params: [String: Any] = [:]
        params["MemID"] = UserDefaults.standard.string(forKey: "userID")!
        params["SecureType"] = secureType
        params["ClickType"] = clickType
        params["RTitle"] = title
        params["RContent"] = content
        params["FTitle"] = fTitle
        params["FContent"] = fContent
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Memo/insertMemo.do", method: .post, parameters: params)
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    if let result = json["result"] as? String {
                        if result == "success" {
                            self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
                        }
                    }
                
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
    func updateMemo() {
        let title = paperTitle.text!
        let content = paperContents.text!
        if title.count == 0 {
            print("제목을 입력해주세요.")
        }
        
        if content.count == 0 {
            print("내용을 입력해주세요.")
        }
        
        var params: [String: Any] = [:]
        params["MemID"] = UserDefaults.standard.string(forKey: "userID")!
        params["SecureType"] = secureType
        params["ClickType"] = clickType
        
        if isReal {
            params["RTitle"] = title
            params["RContent"] = content
            params["FTitle"] = fTitle
            params["FContent"] = fContent
        } else {
            params["RTitle"] = rTitle
            params["RContent"] = rContent
            params["FTitle"] = title
            params["FContent"] = content
        }
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Memo/updateMemo.do", method: .post, parameters: params)
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    if let result = json["result"] as? String {
                        if result == "success" {
                            self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
                        }
                    }
                
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
}
