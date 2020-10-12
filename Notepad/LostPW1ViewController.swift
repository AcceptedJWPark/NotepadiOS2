//
//  LostPW1ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class LostPW1ViewController: UIViewController {
    
    @IBOutlet var btnCheckNum: UIButton!
    @IBOutlet var btnCheck: UIButton!
    
    @IBOutlet var btnNext: UIButton!
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfCertNum: UITextField!
    var certNum: String!
    var memID: String!
    var isCheckPhone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCheckNum.layer.cornerRadius = 10
        btnCheck.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
        
        btnCheckNum.addTarget(self, action: #selector(sendSMS), for: .touchUpInside)
        btnCheck.addTarget(self, action: #selector(checkNum), for: .touchUpInside)
        btnNext.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "pageToLostPW2":
            let lostPW2VC = segue.destination as! LostPW2ViewController
            lostPW2VC.memID = self.memID
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
            self.getMemID()
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
                    
                    self.certNum = json["certNum"] as! String
                    self.isCheckPhone = false
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
    
    @objc func getMemID() {
        let phoneNum = tfPhone.text
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Member/getMemID.do", method: .post, parameters: ["Phone": phoneNum])
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    if let memID = json["MemID"] as? String {
                        if !memID.isEmpty {
                            self.memID = memID
                            self.performSegue(withIdentifier: "pageToLostPW2", sender: nil)
                        } else {
                            print("해당 정보가 일치하지 않습니다.")
                        }
                    } else {
                        print("해당 정보가 일치하지 않습니다.")
                    }
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
}
