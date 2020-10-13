//
//  PaperViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/10/12.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class PaperViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var headerContainer: UIView!
    @IBOutlet var headerTitle: UILabel!
    @IBOutlet var headerBack: UIImageView!
    
    
    @IBOutlet var btnSecurity: UIButton!
    
    @IBOutlet var paperContents: UITextView!
    @IBOutlet var paperTitle: UITextField!
    
    @IBOutlet var saveBtn: UIButton!
    
    @IBOutlet var totalContainer: UIView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBtn.layer.cornerRadius = 10
        headerContainer.layer.shadowColor = UIColor.gray.cgColor
        headerContainer.layer.shadowOpacity = 0.5
        headerContainer.layer.shadowRadius = 3
        headerContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        totalContainer.backgroundColor = UIColor(hexFromString: "#f5f5f5")
        headerContainer.backgroundColor = UIColor(hexFromString: "#ffffff")
        headerBack.tintColor = UIColor(hexFromString: "#544f4f")
        saveBtn.backgroundColor = UIColor(hexFromString: "#f37a00")
        btnSecurity.setTitleColor(UIColor(hexFromString: "#f37a00"), for: .normal)
        
        paperTitle.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexFromString: "#544f4f")])
        
        
        paperContents.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "내용을 입력해주세요"
        paperContents.font = UIFont.systemFont(ofSize: paperContents.font!.pointSize)
        placeholderLabel.sizeToFit()
        paperContents.addSubview(placeholderLabel)
        paperContents.frame.origin = CGPoint(x: 5, y: (paperContents.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor(hexFromString: "#544f4f")
        paperContents.isHidden = !paperContents.text.isEmpty
        
        // 새로운 글인지
        if isNew {
            // 실제글인지
            if isReal {
                
            } else {
                
            }
        } else {
            // 실제글인지
            if isReal {
                
            } else {
                
            }
        }
        
    }
    
    
    
}
