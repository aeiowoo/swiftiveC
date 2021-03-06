//
//  TripTitleInputViewController.swift
//  projectTrip
//
//  Created by Friday on 2016. 12. 11..
//  Copyright © 2016년 SwiftTive. All rights reserved.
//

import UIKit

class TripTitleInputViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createViewContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animation()
    }
    
    //컨텐츠 생성
    func createViewContents() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.backgroundImage.alpha = 0
        self.textField.alpha = 0
        self.addButton.alpha = 0
    }
    
    //시작 애니메이션
    func animation() {
        
        let addButtonOriginY = addButton.frame.origin.y
        let textFieldOriginY = textField.frame.origin.y
        
        addButton.frame.origin.y -= self.view.frame.size.height / 2.7
        textField.frame.origin.y -= self.view.frame.size.height / 2.7
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
            self.addButton.frame.origin.y = addButtonOriginY
            self.textField.frame.origin.y = textFieldOriginY
            
            self.backgroundImage.alpha = 1
            self.textField.alpha = 1
            self.addButton.alpha = 1
        }) { (sucess:Bool) in
            
            //텍스트필드 안으로 바로 들어오도록 하는 메소드
            self.textField.becomeFirstResponder()
        }
    }
    
//    여행 추가하기 버튼
    @IBAction func onAddButton(_ sender: UIButton) {
        
        //텍스트
        let text = self.textField.text!
        
        //날짜
        let current = Date(timeIntervalSinceNow: TimeInterval(NSTimeZone.system.secondsFromGMT()))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = formatter.string(from: current)
        
        TRDataManager.setNewTripMasterData(title: text, startDate: currentDate, endDate: currentDate, countryCode: "", expCurrencyCode: "", stdCurrencyCode: "KRW", budget: 0, exchangeRate: 0, currencyDailyUpdate: false, imgPath: "")
        
        
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func dismissButton(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil)
    }
}










