//
//  LostID1ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class LostID1ViewController: UIViewController {
    
    @IBOutlet var btnCheckNum: UIButton!
    @IBOutlet var btnCheck: UIButton!
    @IBOutlet var btnNext: UIButton!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfCertNum: UITextField!
    var certNum: String!
    var isCheckPhone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCheckNum.layer.cornerRadius = 10
        btnCheck.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
        
        btnCheckNum.addTarget(self, action: #selector(checkNum), for: .touchUpInside)
        btnCheck.addTarget(self, action: #selector(sendSMS), for: .touchUpInside)
        btnNext.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "pageToLostID2":
            let lostID2VC = segue.destination as! LostID2ViewController
            lostID2VC.phoneNum = self.tfPhone.text
            break
        default:
            break
        }
    }
    
    @objc func checkNum() {
        let inputNum = tfCertNum.text!
        if inputNum.count < 6 {
            print("인증번호를 확인해주세요.")
        } else {
            if inputNum == certNum {
                isCheckPhone = true
                print("인증되었습니다.")
            } else {
                print("인증번호를 확인해주세요.")
            }
        }
    }
    
    @objc func goNext() {
        if isCheckPhone {
            self.performSegue(withIdentifier: "pageToLostID2", sender: nil)
        } else {
            print("핸드폰 인증을 진행해주세요.")
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
    
    
}
