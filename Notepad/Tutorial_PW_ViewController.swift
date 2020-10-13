//
//  ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/08/21.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class Tutorial_PW_ViewController: UIViewController {
    
    @IBOutlet var lb1: UILabel!
    @IBOutlet var lb2: UILabel!
    @IBOutlet var lb3: UILabel!
    @IBOutlet var lb_pw: UILabel!
    
    @IBOutlet var pw1: UIView!
    @IBOutlet var pw2: UIView!
    @IBOutlet var pw3: UIView!
    @IBOutlet var pw4: UIView!
    @IBOutlet var pw5: UIView!
    @IBOutlet var pw6: UIView!
    
    var pwArray = Array<UIView>()
    
    var pwInput = ""
    var memoData: MemoData!
    var isTutorial: Bool! = true
    var isReal: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
        
        
        lb1.dynamicFont(fontSize: 28, weight: .semibold)
        lb2.dynamicFont(fontSize: 28, weight: .semibold)
        lb3.dynamicFont(fontSize: 18, weight: .regular)
        lb_pw.dynamicFont(fontSize: 18, weight: .semibold)
        lb_pw.layer.cornerRadius = 15
        
        pwArray = [pw1,pw2,pw3,pw4,pw5,pw6]
        
        
        for i in 0..<pwArray.count{
            pwArray[i].layer.cornerRadius = 5
            pwArray[i].backgroundColor = UIColor.init(red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
        }
        
        // 메모 리스트에서 들어온 경우
        if !isTutorial {
            lb_pw.text = "해당 메모는 보안되어 있습니다"
            lb1.text = "잠금번호 6자리를"
            lb2.text = "입력해주세요."
            lb3.text = ""
        }
        
    }
    
    override open var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "seguePaper":
            let paperVC = segue.destination as! PaperViewController
            paperVC.memoCode = self.memoData.memoCode
            paperVC.isNew = false
            paperVC.isReal = self.isReal
            paperVC.rTitle = self.memoData.rTitle
            paperVC.rContent = self.memoData.rContent
            paperVC.fTitle = self.memoData.fTitle
            paperVC.fContent = self.memoData.fContent
            paperVC.clickType = Int(self.memoData.clickType)
            paperVC.secureType = Int(self.memoData.secureType)
            return
        default:
            return
        }
    }
    
    @IBAction func pressBtn1(_ sender: Any) {
        pwInput = pwInput + "1"
        if(pwInput.count < 6)
        {
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtn2(_ sender: Any)
    {
        pwInput = pwInput + "2"
        if(pwInput.count < 6)
        {
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtn3(_ sender: Any)
    {pwInput = pwInput + "3"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtn4(_ sender: Any)
    {
        pwInput = pwInput + "4"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtn5(_ sender: Any)
    {
        pwInput = pwInput + "5"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtn6(_ sender: Any)
    {
        pwInput = pwInput + "6"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    @IBAction func pressBtn7(_ sender: Any)
    {
        pwInput = pwInput + "7"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtn8(_ sender: Any)
    {
        pwInput = pwInput + "8"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtn9(_ sender: Any)
    {
        pwInput = pwInput + "9"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{
            for i in 0..<pwArray.count
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    @IBAction func pressBtn0(_ sender: Any)
    {
        pwInput = pwInput + "0"
        if(pwInput.count < 6)
        {
            
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
        }else{  for i in 0..<pwArray.count
        {
            pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
            }
            executeLogic()
        }
    }
    
    @IBAction func pressBtnDelete(_ sender: Any) {
        if(pwInput.count>=1)
        {
            pwInput = String(pwInput.prefix(pwInput.count-1))
            for i in 0..<pwArray.count
            {
                if(i<=pwInput.count-1)
                {
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                    
                }else{
                    pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
                }
            }
            
        }else{
            return
        }
    }
    
    @IBAction func pressRefresh(_ sender: Any) {
        pwInput = ""
        for i in 0..<pwArray.count
        {
            if(i<=pwInput.count-1)
            {
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 1.0)
                
            }else{
                pwArray[i].backgroundColor = UIColor.init(displayP3Red: 243/255, green: 115/255, blue: 0, alpha: 0.2)
            }
        }
    }
    
    func executeLogic() {
        if !isTutorial {
            let securityCode = UserDefaults.standard.string(forKey: "SecurityCode")!
            
            // 패스워드 일치한 경우
            if pwInput == securityCode {
                self.isReal = true
                self.performSegue(withIdentifier: "seguePaper", sender: nil)
            } else {
                self.isReal = false
                self.performSegue(withIdentifier: "seguePaper", sender: nil)
            }
        } else {
            AF.request("\(UserDefaults.standard.string(forKey: "url")!)/Member/updateSecurityCode.do", method: .post, parameters: ["MemID": UserDefaults.standard.string(forKey: "userID")!, "SecurityCode": pwInput])
                        .validate()
                        .responseJSON {
                            response in
                            switch response.result {
                            case .success(let value):
                                let json = value as! [String:Any]
                                
                                if let result = json["result"] as? String {
                                    if result == "success" {
                                        self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
                                    }
                                }
                            
                            case .failure(let error):
                                print("Error in network \(error)")
                            }
                    }
        }
    }
    
}

extension UILabel {
    func dynamicFont(fontSize size: CGFloat, weight: UIFont.Weight) {
        let currentFontName = self.font.fontName
        var calculatedFont: UIFont?
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0: //Iphone 3,4S => 3.5 inch
            calculatedFont = UIFont(name: currentFontName, size: size * 0.7)
            resizeFont(calculatedFont: calculatedFont, weight: weight)
            break
        case 568.0: //iphone 5, SE => 4 inch
            calculatedFont = UIFont(name: currentFontName, size: size * 0.8)
            resizeFont(calculatedFont: calculatedFont, weight: weight)
            break
        case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
            calculatedFont = UIFont(name: currentFontName, size: size * 0.92)
            resizeFont(calculatedFont: calculatedFont, weight: weight)
            break
        case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
            calculatedFont = UIFont(name: currentFontName, size: size * 0.95)
            resizeFont(calculatedFont: calculatedFont, weight: weight)
            break
        case 812.0: //iphone X, XS => 5.8 inch
            calculatedFont = UIFont(name: currentFontName, size: size)
            resizeFont(calculatedFont: calculatedFont, weight: weight)
            break
        case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
            calculatedFont = UIFont(name: currentFontName, size: size * 1.15)
            resizeFont(calculatedFont: calculatedFont, weight: weight)
            break
        default:
            print("not an iPhone")
            break
        }
    }
    
    private func resizeFont(calculatedFont: UIFont?, weight: UIFont.Weight) {
        self.font = calculatedFont
        self.font = UIFont.systemFont(ofSize: calculatedFont!.pointSize, weight: weight)
    }
}


