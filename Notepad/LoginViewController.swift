//
//  LoginViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet var tfId: UITextField!
    @IBOutlet var tfPw: UITextField!
    @IBOutlet var btnJoin: UIButton!
    @IBOutlet var btnLogin: UIButton!
    
    var isFirstLogin:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFirstLogin = true
        
        btnLogin.layer.cornerRadius = 10
        btnJoin.layer.cornerRadius = 10
        tfId.layer.cornerRadius = 10
        tfPw.layer.cornerRadius = 10
        btnJoin.layer.borderWidth = 1
        btnJoin.layer.borderColor = UIColor.init(displayP3Red: 239/255, green: 239/255, blue: 239/255, alpha: 1).cgColor
        
        
        btnJoin.layer.shadowColor = UIColor.gray.cgColor
        btnJoin.layer.shadowOpacity = 0.5
        btnJoin.layer.shadowRadius = 3
        btnJoin.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        
    }
    
    @IBAction func lostId(_ sender: Any) {
        performSegue(withIdentifier:"pageToLostID", sender: nil)
    }
    
    @IBAction func lostPw(_ sender: Any) {
        performSegue(withIdentifier:"pageToLostPW", sender: nil)
        
    }
    
    
    @IBAction func joinBtn(_ sender: Any) {
        performSegue(withIdentifier:"pageToJoin", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        goLogin()
    }
    
    func goLogin() {
        
        let id = tfId.text!
        let pw = tfPw.text!
        
        if id == nil || id.count == 0 {
            print("아이디를 입력해주세요.")
            return
        }
        
        if pw == nil || pw.count == 0 {
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
                            
                            //                            let appName = json["AppName"] as! String
                            
                            let securityCode = json["SecurityCode"] as! String
                            let backgroundCode = json["BackgroundCode"] as! Int
                            
                            UserDefaults.standard.set(bg1, forKey: "BackColor1")
                            UserDefaults.standard.set(bg2, forKey: "BackColor2")
                            UserDefaults.standard.set(txtColor, forKey: "TextColor")
                            UserDefaults.standard.set(iconColor, forKey: "IconColor")
                            
                            UserDefaults.standard.set(menubarFlag, forKey: "MenubarFlag")
                            UserDefaults.standard.set(regDateFlag, forKey: "RegDateFlag")
                            UserDefaults.standard.set(summaryFlag, forKey: "SummaryFlag")
                            UserDefaults.standard.set(searchFlag, forKey: "SearchFlag")
                            
                            //                            UserDefaults.standard.set(appName, forKey: "AppName")
                            
                            UserDefaults.standard.set(securityCode, forKey: "SecurityCode")
                            UserDefaults.standard.set(backgroundCode, forKey: "BackgroundCode")
                            UserDefaults.standard.set(id, forKey: "userID")
                            
                            self.performSegue(withIdentifier:"segueHome", sender: nil)
                        }
                    }
                    
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
}
