//
//  SecurityTypeViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/10/03.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class SecurityTypeViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var totalContainer: UIView!
    @IBOutlet var ivBack: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    
    @IBOutlet var v_security: UIView!
    @IBOutlet var lb_security: UILabel!
    @IBOutlet var v_click: UIView!
    @IBOutlet var lb_click: UILabel!
    @IBOutlet var v_fake: UIView!
    @IBOutlet var lb_fake: UILabel!
    
    @IBOutlet var iv_low: UIImageView!
    @IBOutlet var lb_low: UILabel!
    
    @IBOutlet var iv_high: UIImageView!
    @IBOutlet var lb_high: UILabel!
    
    
    @IBOutlet var lb_click1: UILabel!
    @IBOutlet var lb_click2: UILabel!
    @IBOutlet var lb_click3: UILabel!
    
    
    @IBOutlet var tf_fakeTItle: UITextField!
    @IBOutlet var v_fakeContents: UIView!
    @IBOutlet var tv_fakeContents: UITextView!
    
    @IBOutlet var stv_fakeClick: UIStackView!
    @IBOutlet var btn_Save: UIButton!
    
    //키보드 업 일때 높이 0 만들기
    @IBOutlet var vSecurityHeight: NSLayoutConstraint!
    @IBOutlet var ivLowHeight: NSLayoutConstraint!
    @IBOutlet var lbLowHeight: NSLayoutConstraint!
    @IBOutlet var vClickHeight: NSLayoutConstraint!
    @IBOutlet var lbClickHeight: NSLayoutConstraint!
    @IBOutlet var vFakeTop: NSLayoutConstraint!
    @IBOutlet var saveBtnBottom: NSLayoutConstraint!
    
    @IBOutlet var lbNormal: UILabel!
    
    var clickType = 1
    var securityType = 1
    
    
    var fakeList = [UILabel]()
    
    
    var placeholderLabel : UILabel!
    var fakeCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secutiryType()
        
        for i in 0..<self.fakeCount
        {
            let fakeClick = UILabel()
            fakeList.append(fakeClick)
            if(i==0)
            {
                fakeList[i].text = "직접입력"
                fakeList[i].layer.borderColor = UIColor(hexFromString: "#f37a00").cgColor
                fakeList[i].textColor = UIColor(hexFromString: "#f37a00")
                fakeList[i].font = UIFont.systemFont(ofSize: 15, weight: .semibold)
                
            }else{
                fakeList[i].text = "Fake " + String(i)
                fakeList[i].layer.borderColor = UIColor(hexFromString: "#949494").cgColor
                fakeList[i].textColor = UIColor(hexFromString: "#949494")
                fakeList[i].font = UIFont.systemFont(ofSize: 15, weight: .regular)
            }
            
            fakeList[i].layer.cornerRadius = 10
            fakeList[i].layer.borderWidth = 1
            
            fakeList[i].widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            fakeList[i].heightAnchor.constraint(equalToConstant: 30.0).isActive = true
            
            fakeList[i].textAlignment = .center
            
            stv_fakeClick.addArrangedSubview(fakeList[i])
            
            stv_fakeClick.isUserInteractionEnabled = true
            fakeList[i].isUserInteractionEnabled = true
            let fakeClickGesture = MyTapGestureRecognizer(target: self, action: #selector(fakelistClick(mytapGesture:)))
            fakeClickGesture.clickNo = i
            fakeList[i].addGestureRecognizer(fakeClickGesture)
            
        }
        
        
        
        ivBack.tintColor = UIColor(hexFromString: "#544f4f")
        lbTitle.textColor = UIColor(hexFromString: "#544f4f")
        
        lb_click1.layer.cornerRadius = 10
        lb_click1.layer.borderWidth = 1
        lb_click1.layer.borderColor = UIColor(hexFromString: "#f37a00").cgColor
        lb_click1.textColor = UIColor(hexFromString: "#f37a00")
        lb_click1.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        lb_click2.layer.cornerRadius = 10
        lb_click2.layer.borderWidth = 1
        lb_click2.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click2.textColor = UIColor(hexFromString: "#949494")
        lb_click2.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        lb_click3.layer.cornerRadius = 10
        lb_click3.layer.borderWidth = 1
        lb_click3.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click3.textColor = UIColor(hexFromString: "#949494")
        lb_click3.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        
        let securityGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(clickSecurityType1(tapGestureRecognizer:)))
              
              let securityGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(clickSecurityType2(tapGestureRecognizer:)))
        
        iv_low.isUserInteractionEnabled = true
        iv_low.addGestureRecognizer(securityGestureRecognizer1)
        
        iv_high.isUserInteractionEnabled = true
        iv_high.addGestureRecognizer(securityGestureRecognizer2)
        
        
        
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(clickTypeTapped1(tapGestureRecognizer:)))
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(clickTypeTapped2(tapGestureRecognizer:)))
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(clickTypeTapped3(tapGestureRecognizer:)))
        
        
        
        lb_click1.isUserInteractionEnabled = true
        lb_click1.addGestureRecognizer(tapGestureRecognizer1)
        
        lb_click2.isUserInteractionEnabled = true
        lb_click2.addGestureRecognizer(tapGestureRecognizer2)
        
        lb_click3.isUserInteractionEnabled = true
        lb_click3.addGestureRecognizer(tapGestureRecognizer3)
        
        
        
        
        btn_Save.layer.cornerRadius = 10
        btn_Save.backgroundColor = UIColor(hexFromString: "#f37a00")
        btn_Save.setTitleColor(UIColor(hexFromString: "#ffffff"), for: .normal)
        
        
        tf_fakeTItle.addLeftPadding()
        
        tf_fakeTItle.backgroundColor = UIColor(hexFromString: "#f5f5f5")
        v_fakeContents.backgroundColor = UIColor(hexFromString: "#f5f5f5")
        
        tf_fakeTItle.layer.shadowColor = UIColor.gray.cgColor
        tf_fakeTItle.layer.shadowOpacity = 0.5
        tf_fakeTItle.layer.shadowRadius = 3
        tf_fakeTItle.layer.shadowOffset = CGSize(width: 1, height: 1)
        tf_fakeTItle.attributedPlaceholder = NSAttributedString(string: "Fake 제목을 입력해주세요",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexFromString: "#544f4f")])
        
        v_fakeContents.clipsToBounds = false
        v_fakeContents.layer.shadowColor = UIColor.gray.cgColor
        v_fakeContents.layer.shadowOpacity = 0.5
        v_fakeContents.layer.shadowRadius = 3
        v_fakeContents.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        
        tv_fakeContents.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "Fake 내용을 입력해주세요"
        placeholderLabel.font = UIFont.systemFont(ofSize: tv_fakeContents.font!.pointSize)
        placeholderLabel.sizeToFit()
        tv_fakeContents.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (tv_fakeContents.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor(hexFromString: "#544f4f")
        placeholderLabel.isHidden = !tv_fakeContents.text.isEmpty
    }
    
    @objc func fakelistClick(mytapGesture: MyTapGestureRecognizer) {
        for i in 0..<fakeCount
        {
            if(mytapGesture.clickNo==i)
            {
                
                fakeList[i].layer.borderColor = UIColor(hexFromString: "#f37a00").cgColor
                fakeList[i].textColor = UIColor(hexFromString: "#f37a00")
                fakeList[i].font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            }else{
                fakeList[i].layer.borderColor = UIColor(hexFromString: "#949494").cgColor
                fakeList[i].textColor = UIColor(hexFromString: "#949494")
                fakeList[i].font = UIFont.systemFont(ofSize: 15, weight: .regular)
            }
        }
        
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func secutiryType()
    {
        if(securityType == 1)
                      {
                          lbNormal.isHidden = false
                          lbNormal.text = "현재 보안방식에는 보안설정이 없습니다.\n\n비밀글이라면 보안수준을 올려주세요."
                          lb_click.text = "보안설정 없음"
                          v_fakeContents.isHidden = true
                       
                       iv_low.image = UIImage(named: "low2")
                              lb_low.textColor = UIColor(hexFromString: "#039c17")
                              lb_low.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                              
                              iv_high.image = UIImage(named: "high1")
                              lb_high.textColor = UIColor(hexFromString: "#949494")
                              lb_high.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                       
                      }else{
                          lbNormal.isHidden = true
                          v_fakeContents.isHidden = false
                   iv_low.image = UIImage(named: "low1")
                          lb_low.textColor = UIColor(hexFromString: "#949494")
                          lb_low.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                          
                          iv_high.image = UIImage(named: "high2")
                          lb_high.textColor = UIColor(hexFromString: "#ff0911")
                          lb_high.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                   
                      }
    }
    
    @objc func clickSecurityType1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        securityType = 1
       secutiryType()
        
       
    }
    
    @objc func clickSecurityType2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        securityType = 2
       secutiryType()
       
    }
    
    @objc func clickTypeTapped1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        clickType = 1
        lb_click1.layer.borderColor = UIColor(hexFromString: "#f37a00").cgColor
        lb_click1.textColor = UIColor(hexFromString: "#f37a00")
        lb_click1.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lb_click2.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click2.textColor = UIColor(hexFromString: "#949494")
        lb_click2.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lb_click3.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click3.textColor = UIColor(hexFromString: "#949494")
        lb_click3.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
    }
    
    @objc func clickTypeTapped2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        clickType = 2
        lb_click2.layer.borderColor = UIColor(hexFromString: "#f37a00").cgColor
        lb_click2.textColor = UIColor(hexFromString: "#f37a00")
        lb_click2.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lb_click1.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click1.textColor = UIColor(hexFromString: "#949494")
        lb_click1.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lb_click3.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click3.textColor = UIColor(hexFromString: "#949494")
        lb_click3.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
    }
    
    @objc func clickTypeTapped3(tapGestureRecognizer: UITapGestureRecognizer)
    {
        clickType = 3
        lb_click3.layer.borderColor = UIColor(hexFromString: "#f37a00").cgColor
        lb_click3.textColor = UIColor(hexFromString: "#f37a00")
        lb_click3.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lb_click1.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click1.textColor = UIColor(hexFromString: "#949494")
        lb_click1.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lb_click2.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        lb_click2.textColor = UIColor(hexFromString: "#949494")
        lb_click2.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight : Int = Int(keyboardSize.height)
            
            saveBtnBottom.constant = CGFloat(keyboardHeight) + 40
        }
        
        vSecurityHeight.constant = 0
        ivLowHeight.constant = 0
        lbLowHeight.constant = 0
        vClickHeight.constant = 0
        lbClickHeight.constant = 0
        vFakeTop.constant = -40
        
    }
    
    
    @objc func keyboardWillDisappear() {
        
        vSecurityHeight.constant = 40
        ivLowHeight.constant = 70
        lbLowHeight.constant = 20
        vClickHeight.constant = 40
        lbClickHeight.constant = 30
        vFakeTop.constant = 10
        saveBtnBottom.constant = 20
        
    }
    
    
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var clickNo: Int?
}


