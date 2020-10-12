//
//  LostPW2ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class LostPW2ViewController: UIViewController {

    @IBOutlet var btnComp: UIButton!
    @IBOutlet var tfPW: UITextField!
    @IBOutlet var tfPWComp: UITextField!
    var memID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnComp.layer.cornerRadius = 10
              
    }

    @objc func updateMemPW() {
        let memPW = tfPW.text
        let memPWComp = tfPWComp.text
        
        if memPW!.count == 0 {
            print("비밀번호를 입력해주세요.")
            return
        } else if memPW!.count < 6 {
            print("비밀번호는 6자 이상 입력해주세요.")
            return
        } else if memPW != memPWComp {
            print("비밀번호를 확인해주세요.")
            return
        }
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Member/updateMemPW.do", method: .post, parameters: ["MemID": memID, "Password": memPW])
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    if let result = json["result"] as? String {
                        if result == "success" {
                            print("비밀번호가 변경되었습니다.")
                            self.performSegue(withIdentifier: "segueLogin", sender: nil)
                        }
                    }
                
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
}
