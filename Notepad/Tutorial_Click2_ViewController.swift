//
//  Tutorial_Click2_ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/08/21.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit
import Alamofire

class tutorialClick2Cell : UITableViewCell{
    
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbContents: UILabel!
    @IBOutlet var lbDate: UILabel!
    
    
}


class Tutorial_Click2_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var ivNextBtn: UIImageView!
    @IBOutlet var searchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        searchView.layer.cornerRadius = 10
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped1(tapGestureRecognizer:)))
        ivNextBtn.isUserInteractionEnabled = true
        ivNextBtn.addGestureRecognizer(tapGestureRecognizer1)
        
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tutorialCell", for: indexPath) as! tutorialClick2Cell
        
        if(indexPath.row == 0)
        {
            cell.lbTitle.text = "홈트레이닝하기 30분 루틴"
            cell.lbContents.text = "1. 스쿼트 5세트 x 20개 다리는 골반보다 조금 넓게 벌린 상태에서 상체를 다리 사이로 집어 넣는 다는 느낌"
            cell.lbDate.text = "최근 작성일 : 2020-08-12"
        }else if(indexPath.row==1)
        {
            cell.lbTitle.text = "부동산 정보 유용한 사이트 모음"
            cell.lbContents.text = "서울특별시 정보광장 → 부동산 종합정보 건축불 정보,. 가격정보 (공시되는 정보들이 있음)"
            cell.lbDate.text = "최근 작성일 : 2020-08-12"
        }else if(indexPath.row==2)
        {
            cell.lbTitle.text = "알리오 올리오 맛있게 만드는 법"
            cell.lbContents.text = "스파게티 면 200g을 준비한다. 1인분은 파스타 100원 짜리 동전 크기 만큼 계량을 하면 되고, 양이 적으면 500원 짜리"
            cell.lbDate.text = "최근 작성일 : 2020-08-12"
        }else
        {
            cell.lbTitle.text = "무료 예능 드라마 볼 수 있는 사이트 모음"
            cell.lbContents.text = "PC에서는 접속이 안되고 폰으로 열어야 함"
            cell.lbDate.text = "최근 작성일 : 2020-08-12"
        }
        
        return cell
    }
    
    @objc func imageTapped1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "pageToSecutiry", sender: self)
    }
    
}
