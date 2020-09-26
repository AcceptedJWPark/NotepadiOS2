//
//  LoginViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

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
        if(isFirstLogin)
        {

            performSegue(withIdentifier:"pageToTutorial", sender: nil)
        }
    }
    
    
}
