//
//  JoinViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet var btnCheckNo: UIButton!
    @IBOutlet var btnCheck: UIButton!
    @IBOutlet var btnJoin: UIButton!
    
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfCheckNum: UITextField!
    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnCheckNo.layer.cornerRadius = 10
              btnCheck.layer.cornerRadius = 10
              btnJoin.layer.cornerRadius = 10
             
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
             self.view.endEditing(true)
       }
    
    
  

    
    

}
