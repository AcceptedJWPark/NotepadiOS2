//
//  Tutorial_Security_ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/08/29.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class Tutorial_Security_ViewController: UIViewController {
    
    @IBOutlet var ivLow: UIImageView!
    @IBOutlet var ivHigh: UIImageView!
    
    @IBOutlet var lbLow: UILabel!
    @IBOutlet var lbHigh: UILabel!
    
    @IBOutlet var lbFirstLine: UILabel!
    @IBOutlet var lbSecondLine: UILabel!
    @IBOutlet var lbThirdLine: UILabel!
    @IBOutlet var lbFourthLine: UILabel!
    
    @IBOutlet var nextButton: UIButton!
    var securityType : Int = 1
    
    var isCheckedHigh : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = UIColor.init(rgb: 0xf37a00)
        
        lbLow.textColor = UIColor(rgb: 0x039c17)
        lbHigh.textColor = UIColor(rgb: 0x949494)
        
        if(securityType == 1)
        {
            lbFourthLine.isHidden  = true
        }
      
        
        lbLow.dynamicFont(fontSize: 15, weight: .semibold)
        lbHigh.dynamicFont(fontSize: 15, weight: .regular)
        
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped1(tapGestureRecognizer:)))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped3(tapGestureRecognizer:)))
        
        
        ivLow.isUserInteractionEnabled = true
        ivLow.addGestureRecognizer(tapGestureRecognizer1)
        
        
        ivHigh.isUserInteractionEnabled = true
        ivHigh.addGestureRecognizer(tapGestureRecognizer3)
        
      
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        var message:String = ""
       if(!isCheckedHigh)
        {
         message = "높음 보안방식을 확인해주세요."
            let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
                present(alert, animated: false, completion: nil)
                
                let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
                    self.dismiss(animated: false, completion: nil)
                      }
                alert.addAction(okAction)
       }else{
        performSegue(withIdentifier: "pageToBgr", sender: nil)
        }
        
    }
    
    @objc func imageTapped1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        securityType = 1
        ivLow.image = UIImage(named: "low2")
        ivHigh.image = UIImage(named: "high1")
        lbLow.textColor = UIColor(rgb: 0x039c17)
        lbHigh.textColor = UIColor(rgb: 0x949494)
        
        lbLow.dynamicFont(fontSize: 15, weight: .semibold)
        lbHigh.dynamicFont(fontSize: 15, weight: .regular)
        
        
        
        lbFirstLine.text = "별도의 보안 방식이 없습니다."
        lbSecondLine.text = "일반글 작성 시에만 사용하시고"
        lbThirdLine.text = "비밀글에는 보통 이상의 보안 방식을 설정해주세요."
        lbFourthLine.isHidden = true
        
        
    }
    
   
    
    @objc func imageTapped3(tapGestureRecognizer: UITapGestureRecognizer)
    {
        securityType = 3
        isCheckedHigh = true
        ivLow.image = UIImage(named: "low1")
        ivHigh.image = UIImage(named: "high2")
        
        lbLow.textColor = UIColor(rgb: 0x949494)
        lbHigh.textColor = UIColor(rgb: 0xff0911)
        
        lbLow.dynamicFont(fontSize: 15, weight: .regular)
        lbHigh.dynamicFont(fontSize: 15, weight: .semibold)
        
        
        lbFirstLine.text = "메모는 Fake 제목과 내용이 노출됩니다."
        lbSecondLine.text = "글 작성 시 선택한 클릭 방식과 비밀번호를 확인하여 진짜 글을 노출합니다."
        lbThirdLine.text = "클릭 방식과 비밀번호 둘 중 하나라도 틀리면 Fake 글이 노출됩니다."
        lbFourthLine.text = "클릭 방식과 Fake글은 글 작성 시 선택/작성 할 수 있습니다."
        lbFourthLine.isHidden = false
        
        
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

