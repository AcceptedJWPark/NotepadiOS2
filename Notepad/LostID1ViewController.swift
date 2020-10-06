//
//  LostID1ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class LostID1ViewController: UIViewController {
    
    @IBOutlet var btnCheckNum: UIButton!
    @IBOutlet var btnCheck: UIButton!
    @IBOutlet var btnNext: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCheckNum.layer.cornerRadius = 10
        btnCheck.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
    }
    
    @IBAction func btnLostID2(_ sender: Any) {
        performSegue(withIdentifier:"pageToLostID2", sender: nil)
    }
    
    
    
}
