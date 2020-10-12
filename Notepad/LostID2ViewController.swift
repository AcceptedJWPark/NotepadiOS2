//
//  LostID2ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class LostID2ViewController: UIViewController {

    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnJoin: UIButton!
    @IBOutlet var lbPre: UIButton!
    @IBOutlet var lbID: UIButton!
    @IBOutlet var lbNext: UIButton!
    var phoneNum: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnLogin.layer.cornerRadius = 10
        btnJoin.layer.cornerRadius = 10
        getMemID()
    }
    
    @objc func getMemID() {
        
        AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Member/getMemID.do", method: .post, parameters: ["Phone": phoneNum])
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    let json = value as! [String:Any]
                    
                    if let memID = json["MemID"] as? String {
                        if !memID.isEmpty {
                            self.lbID.titleLabel!.text = memID
                            
                            let pdate1 = json["RegDate"] as! Double
                            let routineDateFormatter = DateFormatter()
                            routineDateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
                            let pdate2 = Date(timeIntervalSince1970: pdate1/1000.0)
                            let date = routineDateFormatter.string(from: pdate2)
                            
                            self.lbNext.titleLabel!.text = "회원가입: \(date)"
                        } else {
                            self.lbPre.isHidden = true
                            self.lbNext.isHidden = true
                            self.lbID.titleLabel!.text = "아이디가 존재하지 않습니다."
                        }
                    } else {
                        self.lbPre.isHidden = true
                        self.lbNext.isHidden = true
                        self.lbID.titleLabel!.text = "아이디가 존재하지 않습니다."
                    }
                case .failure(let error):
                    print("Error in network \(error)")
                }
        }
    }
}
