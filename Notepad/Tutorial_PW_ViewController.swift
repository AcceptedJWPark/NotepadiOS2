//
//  ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/08/21.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

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
        
    }
    override open var prefersStatusBarHidden: Bool {
        return true
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
            self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
                  self.performSegue(withIdentifier: "pageToTutorialClick", sender: self)
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
        print(pwInput)
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


