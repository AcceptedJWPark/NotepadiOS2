//
//  BackgroundViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/16.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {
    var isMenubar:Bool!
    var isSearch:Bool!
    
    @IBOutlet var searchContainerHeight: NSLayoutConstraint!
    
    @IBOutlet var trashView: UIView!
    
    //color1
    @IBOutlet var border1: UIView!
    @IBOutlet var border2: UIView!
    @IBOutlet var border3: UIView!
    @IBOutlet var viewColor1: UIView!
    @IBOutlet var searchContainer2: UIView!
    @IBOutlet var tfSearch: UITextField!
    @IBOutlet var container: UIView!
    
    //color2
    @IBOutlet var totalContainer: UIView!
    @IBOutlet var searchContainer: UIView!
    @IBOutlet var memoContainer: UIView!
    @IBOutlet var viewColor2: UIView!
    
    //color3
    @IBOutlet var lbMain: UILabel!
    @IBOutlet var lbSub: UILabel!
    @IBOutlet var lbIsMenu: UILabel!
    @IBOutlet var lbIsSearch: UILabel!
    @IBOutlet var lbBgr: UILabel!
    @IBOutlet var viewColor3: UIView!
    @IBOutlet var memoSummay: UILabel!
    @IBOutlet var lbApptitle: UILabel!
    @IBOutlet var regDate: UILabel!
    @IBOutlet var tfAppTitle: UITextField!
    
    
    @IBOutlet var ivMenu: UIImageView!
    @IBOutlet var lbColorMode: UILabel!
    @IBOutlet var appTitle: UILabel!
    @IBOutlet var ivSearch: UIImageView!
    
    //color4
    @IBOutlet var btnNext: UIButton!
    @IBOutlet var viewColor4: UIView!
    @IBOutlet var switchIsMenu: UILabel!
    @IBOutlet var switchIsSearch: UILabel!
    @IBOutlet var arrowLeft: UIImageView!
    @IBOutlet var arrowRight: UIImageView!
    
    let basicColor1 = "#f5f5f5"
    let basicColor2 = "#ffffff"
    let basicColor3 = "#544f4f"
    let basicColor4 = "#f37a00"
    
    let nightColor1 = "#2d2d2d"
    let nightColor2 = "#3b3b3b"
    let nightColor3 = "#e7e7e7"
    let nightColor4 = "#00a8ff"
    
    var choosedColor1 : String!
    var choosedColor2 : String!
    var choosedColor3 : String!
    var choosedColor4 : String!
    
    var colormode : Int!
    var colorCount : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorCount = 2
        colormode = 1
        
        if(colormode==1)
        {
            choosedColor1 = basicColor1
            choosedColor2 = basicColor2
            choosedColor3 = basicColor3
            choosedColor4 = basicColor4
        }else if(colormode==2){
            choosedColor1 = nightColor1
            choosedColor2 = nightColor2
            choosedColor3 = nightColor3
            choosedColor4 = nightColor4
        }
        
        backgroundColor(color1:choosedColor1,color2:choosedColor2,color3:choosedColor3,color4:choosedColor4)
        
        
        viewColor1.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        viewColor2.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        viewColor3.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        viewColor4.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        viewColor1.layer.borderWidth = 1
        viewColor2.layer.borderWidth = 1
        viewColor3.layer.borderWidth = 1
        viewColor4.layer.borderWidth = 1
        
        switchIsMenu.layer.borderWidth = 2
        switchIsSearch.layer.borderWidth = 2
        switchIsMenu.layer.cornerRadius = 10
        switchIsSearch.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        isMenubar = true
        isSearch = true
        
        if(isMenubar)
        {
            
            
            switchIsMenu.text = "ON"
            switchIsMenu.textColor = UIColor(hexFromString: choosedColor4)
            switchIsMenu.layer.borderColor = UIColor(hexFromString: choosedColor4).cgColor
            ivMenu.image = ivMenu.image?.withRenderingMode(.alwaysTemplate)
                              ivMenu.tintColor = UIColor(hexFromString: choosedColor3)
        }else
        {
            switchIsMenu.text = "OFF"
            switchIsMenu.textColor = UIColor(hexFromString: "#949494")
            switchIsMenu.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
            ivMenu.image = ivMenu.image?.withRenderingMode(.alwaysTemplate)
                              ivMenu.tintColor = UIColor(hexFromString: choosedColor2)
        }
        
        if(isSearch)
        {
            
            searchContainer2.isHidden = false
            switchIsSearch.text = "ON"
            searchContainerHeight.constant = 80
            
            switchIsSearch.textColor = UIColor(hexFromString: choosedColor4)
            switchIsSearch.layer.borderColor = UIColor(hexFromString: choosedColor4).cgColor
            
            
        }else{
            searchContainer2.isHidden = true
            switchIsSearch.text = "OFF"
            searchContainerHeight.constant = 40
            switchIsSearch.textColor = UIColor(hexFromString: "#949494")
            switchIsSearch.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
        }
        
        
        
        tfAppTitle.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        
        tfSearch.isEnabled = false
        container.layer.cornerRadius = 5
        container.layer.borderColor = UIColor.init(displayP3Red: 239/255, green: 239/255, blue: 239/255, alpha: 1).cgColor
        container.layer.borderWidth = 2
        
        searchContainer.layer.shadowColor = UIColor.gray.cgColor
        searchContainer.layer.shadowOpacity = 0.5
        searchContainer.layer.shadowRadius = 3
        searchContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        memoContainer.layer.shadowColor = UIColor.gray.cgColor
        memoContainer.layer.shadowOpacity = 0.5
        memoContainer.layer.shadowRadius = 3
        memoContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        btnNext.layer.cornerRadius = 10
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(isMenubar(tapGestureRecognizer:)))
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(isSearch(tapGestureRecognizer:)))
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(keyboardHide(tapGestureRecognizer:)))
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(colormodeLeft(tapGestureRecognizer:)))
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(colormodeRight(tapGestureRecognizer:)))
        
        
        switchIsMenu.isUserInteractionEnabled = true
        switchIsMenu.addGestureRecognizer(tapGestureRecognizer1)
        switchIsSearch.isUserInteractionEnabled = true
        switchIsSearch.addGestureRecognizer(tapGestureRecognizer2)
        
        trashView.isHidden = true
        trashView.isUserInteractionEnabled = true
        trashView.addGestureRecognizer(tapGestureRecognizer3)
        
        
        arrowLeft.isUserInteractionEnabled = true
        arrowLeft.addGestureRecognizer(tapGestureRecognizer4)
        
        
        
        arrowRight.isUserInteractionEnabled = true
        arrowRight.addGestureRecognizer(tapGestureRecognizer5)
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func textFieldDidChange(tapGestureRecognizer: UITapGestureRecognizer)
    {
        appTitle.text = tfAppTitle.text
    }
    
    @objc func keyboardHide(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
        
    }
    @objc func colormodeLeft(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if(colormode == 1)
        {
            colormode = colorCount
        }else{
            colormode = colormode - 1
        }
        if(colormode==1)
        {
            choosedColor1 = basicColor1
            choosedColor2 = basicColor2
            choosedColor3 = basicColor3
            choosedColor4 = basicColor4
        }else if(colormode==2){
            choosedColor1 = nightColor1
            choosedColor2 = nightColor2
            choosedColor3 = nightColor3
            choosedColor4 = nightColor4
        }
        
        backgroundColor(color1:choosedColor1,color2:choosedColor2,color3:choosedColor3,color4:choosedColor4)
    }
    
    @objc func colormodeRight(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if(colormode == colorCount)
        {
            colormode = 1
        }else{
            colormode = colormode + 1
        }
        if(colormode==1)
        {
            choosedColor1 = basicColor1
            choosedColor2 = basicColor2
            choosedColor3 = basicColor3
            choosedColor4 = basicColor4
        }else if(colormode==2){
            choosedColor1 = nightColor1
            choosedColor2 = nightColor2
            choosedColor3 = nightColor3
            choosedColor4 = nightColor4
        }
        
        backgroundColor(color1:choosedColor1,color2:choosedColor2,color3:choosedColor3,color4:choosedColor4)
    }
    
    
    @objc func isMenubar(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if(isMenubar)
        {
            isMenubar = false
            switchIsMenu.text = "OFF"
            
            switchIsMenu.textColor = UIColor(hexFromString: "#949494")
            switchIsMenu.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
            
            ivMenu.image = ivMenu.image?.withRenderingMode(.alwaysTemplate)
                   ivMenu.tintColor = UIColor(hexFromString: choosedColor2)
            
            
        }else{
            isMenubar = true
            switchIsMenu.text = "ON"
            
            switchIsMenu.textColor = UIColor(hexFromString: choosedColor4)
            switchIsMenu.layer.borderColor = UIColor(hexFromString: choosedColor4).cgColor
            
            ivMenu.image = ivMenu.image?.withRenderingMode(.alwaysTemplate)
                   ivMenu.tintColor = UIColor(hexFromString: choosedColor3)
        }
        
    }
    
    
    @objc func isSearch(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        if(isSearch)
        {
            isSearch = false
            searchContainer2.isHidden = true
            switchIsSearch.text = "OFF"
            searchContainerHeight.constant = 40
            switchIsSearch.textColor = UIColor(hexFromString: "#949494")
            switchIsSearch.layer.borderColor = UIColor(hexFromString: "#949494").cgColor
            
        }else{
            isSearch = true
            searchContainer2.isHidden = false
            switchIsSearch.text = "ON"
            searchContainerHeight.constant = 80
            
            switchIsSearch.textColor = UIColor(hexFromString: choosedColor4)
            switchIsSearch.layer.borderColor = UIColor(hexFromString: choosedColor4).cgColor
        }
        
        
    }
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        
        trashView.isHidden = false
        
        
    }
    
    
    @objc func keyboardWillDisappear() {
        trashView.isHidden = true
        
        
    }
    
    func backgroundColor(color1:String,color2:String,color3:String,color4:String){
        //color1
        border1.backgroundColor = UIColor(hexFromString: color1)
        border2.backgroundColor = UIColor(hexFromString: color1)
        border3.backgroundColor = UIColor(hexFromString: color1)
        viewColor1.backgroundColor = UIColor(hexFromString: color1)
        searchContainer2.backgroundColor = UIColor(hexFromString: color1)
        tfSearch.backgroundColor = UIColor(hexFromString: color1)
        container.backgroundColor = UIColor(hexFromString: color1)
        tfAppTitle.backgroundColor = UIColor(hexFromString: color1)
        
        
        
        //color2
        totalContainer.backgroundColor = UIColor(hexFromString: color2)
        searchContainer.backgroundColor = UIColor(hexFromString: color2)
        memoContainer.backgroundColor = UIColor(hexFromString: color2)
        viewColor2.backgroundColor = UIColor(hexFromString: color2)
        
        //color3
        lbMain.textColor = UIColor(hexFromString: color3)
        lbSub.textColor = UIColor(hexFromString: color3)
        lbIsMenu.textColor = UIColor(hexFromString: color3)
        lbIsSearch.textColor = UIColor(hexFromString: color3)
        lbBgr.textColor = UIColor(hexFromString: color3)
        viewColor3.backgroundColor = UIColor(hexFromString: color3)
        lbApptitle.textColor = UIColor(hexFromString: color3)
        memoSummay.textColor = UIColor(hexFromString: color3)
        regDate.textColor = UIColor(hexFromString: color3)
        lbApptitle.textColor = UIColor(hexFromString: color3)
        appTitle.textColor = UIColor(hexFromString: color3)
        tfAppTitle.textColor = UIColor(hexFromString: color3)
        
        tfAppTitle.attributedPlaceholder = NSAttributedString(string: "App 제목을 입력하세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexFromString: color3)])
        tfSearch.attributedPlaceholder = NSAttributedString(string: "검색",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexFromString: color3)])
        
        ivSearch.image = ivSearch.image?.withRenderingMode(.alwaysTemplate)
        ivSearch.tintColor = UIColor(hexFromString: color3)
        
        
        ivMenu.image = ivMenu.image?.withRenderingMode(.alwaysTemplate)
        ivMenu.tintColor = UIColor(hexFromString: color3)
        
        
        
        //color4
        btnNext.backgroundColor = UIColor(hexFromString: color4)
        viewColor4.backgroundColor = UIColor(hexFromString: color4)
        lbColorMode.textColor = UIColor(hexFromString: color4)
        
        
        switchIsMenu.layer.borderColor = UIColor(hexFromString: color4).cgColor
        switchIsSearch.layer.borderColor = UIColor(hexFromString: color4).cgColor
        switchIsMenu.textColor = UIColor(hexFromString: color4)
        switchIsSearch.textColor = UIColor(hexFromString: color4)
        
        arrowLeft.image = arrowLeft.image?.withRenderingMode(.alwaysTemplate)
        arrowLeft.tintColor = UIColor(hexFromString: color4)
        
        
        arrowRight.image = arrowRight.image?.withRenderingMode(.alwaysTemplate)
        arrowRight.tintColor = UIColor(hexFromString: color4)
        
        
        
    }
    
}
extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

