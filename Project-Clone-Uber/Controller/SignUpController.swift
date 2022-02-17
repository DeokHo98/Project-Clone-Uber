//
//  SingUpController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/02/17.
//

import UIKit

class SignUpController: UIViewController {
    //MARK: - Properties
    
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { //시간이나 와이파이같은 스테이터스 바의 스타일을 바꾸는 코드
        return .lightContent
    }
    
    
    //MARK: - Selectors
}
