//
//  TripListViewController.swift
//  projectTrip
//
//  Created by Friday on 2016. 12. 11..
//  Copyright © 2016년 SwiftTive. All rights reserved.
//

import UIKit

class TripListViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let transition = TripModalAnimator()
    var tripGirdLayout : TripGirdLayout!
    
    let userDefaults = UserDefaults.standard
    var collectionInt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createViewContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionView.reloadData()
    }
    
    func createViewContents() {
        
        //네비게이션 바 색 설정
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 71/255, green: 173/255, blue: 247/255, alpha: 1)
        
        //네비게이션 타이틀 커스텀 이미지
        let titleImage = UIImage.init(named: "title")
        self.navigationItem.titleView = UIImageView.init(image: titleImage)
        
        //오른쪽 바 버튼 아이템
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(onAddButton))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        //컬렉션 뷰 격자 설정 클래스
        tripGirdLayout = TripGirdLayout(numberOfColumns: 2)
        collectionView.collectionViewLayout = tripGirdLayout
        collectionView.reloadData()
        
    }
    
    // + 버튼 눌렀을 때
//    func onAddButton() {
//        
//        let titleInputController = self.storyboard?.instantiateViewController(withIdentifier: "TripTitleInputViewController") as! TripTitleInputViewController
//        titleInputController.modalTransitionStyle = .crossDissolve
//        present(titleInputController, animated: true, completion: nil)
//    }

    //보류
    @IBAction func onMenuButton(_ sender: UIBarButtonItem) {
        
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "TripListSubMenuViewController") as! TripListSubMenuViewController
        modalVC.modalPresentationStyle = .overCurrentContext
        modalVC.transitioningDelegate = self
        present(modalVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("prepare")
    }
}

extension TripListViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = false
        return transition
    }
}

extension TripListViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("기둥을 만들었다.")
        
        return collectionInt
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TripListCell", for: indexPath) as! TripListCollectionViewCell
        
        return cell
    }
}











