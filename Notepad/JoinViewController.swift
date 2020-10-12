//
//  JoinViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class JoinViewController: UIViewController {
    
    @IBOutlet var btnCheckNo: UIButton!
    @IBOutlet var btnCheck: UIButton!
    @IBOutlet var btnJoin: UIButton!
    
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfCheckNum: UITextField!
    @IBOutlet var containerView: UIView!
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    @IBOutlet var tfPWComp: UITextField!
    var certNum: String?
    var isCheckPhone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCheckNo.layer.cornerRadius = 10
        btnCheck.layer.cornerRadius = 10
        btnJoin.layer.cornerRadius = 10
        
        btnCheck.addTarget(self, action: #selector(certificate), for: .touchUpInside)
        btnCheckNo.addTarget(self, action: #selector(sendSMS), for: .touchUpInside)
        btnJoin.addTarget(self, action: #selector(join), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func certificate() {
        if certNum == nil {
            print("인증번호를 발급받으세요.")
        } else {
            if let checkNum = tfCheckNum.text {
                if checkNum == certNum {
                    print("인증 완료")
                    isCheckPhone = true
                } else {
                    print("인증 번호를 확인해주세요.")
                }
            }
        }
    }
    
    @objc func sendSMS() {
        let phoneNum = tfPhone.text
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Member/sendJoinSMS.do", method: .post, parameters: ["sRecieveNum": phoneNum])
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    self.certNum = String(json["certNum"] as! Int)
                    self.isCheckPhone = false
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
    @objc func join() {
        
        let id = tfID.text
        let pw = tfPW.text
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Member/insertNewMember.do", method: .post, parameters: ["MemID": id, "Password": pw])
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    if let result = json["result"] as? String {
                        if result == "success" {
                            print("가입완료")
                            self.goLogin()
                        }
                    }
                
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
    func goLogin() {
        
        let id = tfID.text
        let pw = tfPW.text
        
        if id == nil || id?.count == 0 {
            print("아이디를 입력해주세요.")
            return
        }
        
        if pw == nil || pw?.count == 0 {
            print("비밀번호를 입력해주세요.")
            return
        }
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Member/memberLogin.do", method: .post, parameters: ["MemID": id, "Password": pw])
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    if let result = json["result"] as? String {
                        if result == "success" {
                            let bg1 = json["BackColor1"] as! String
                            let bg2 = json["BackColor2"] as! String
                            let txtColor = json["TextColor"] as! String
                            let iconColor = json["IconColor"] as! String
                            
                            let menubarFlag = json["MenubarFlag"] as! String
                            let regDateFlag = json["RegDateFlag"] as! String
                            let summaryFlag = json["SummaryFlag"] as! String
                            let searchFlag = json["SearchFlag"] as! String
                            
                            let appName = json["AppName"] as! String
                            
                            let securityCode = json["SecurityCode"] as! String
                            let backgroundCode = json["BackgroundCode"] as! String
                            
                            UserDefaults.standard.set(bg1, forKey: "BackColor1")
                            UserDefaults.standard.set(bg2, forKey: "BackColor2")
                            UserDefaults.standard.set(txtColor, forKey: "TextColor")
                            UserDefaults.standard.set(iconColor, forKey: "IconColor")
                            
                            UserDefaults.standard.set(menubarFlag, forKey: "MenubarFlag")
                            UserDefaults.standard.set(regDateFlag, forKey: "RegDateFlag")
                            UserDefaults.standard.set(summaryFlag, forKey: "SummaryFlag")
                            UserDefaults.standard.set(searchFlag, forKey: "SearchFlag")
                            
                            UserDefaults.standard.set(appName, forKey: "AppName")
                            
                            UserDefaults.standard.set(securityCode, forKey: "SecurityCode")
                            UserDefaults.standard.set(backgroundCode, forKey: "BackgroundCode")
                            UserDefaults.standard.set(id, forKey: "userID")
                            
                            self.performSegue(withIdentifier:"pageToTutorial", sender: nil)
                        }
                    }
                
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
}
