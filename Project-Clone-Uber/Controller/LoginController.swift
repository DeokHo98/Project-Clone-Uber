//
//  LoginController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/02/17.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    private let titleLabel: UILabel = { //레이블을 클로져 형태로 만들기
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        return label
    }()
    
    //MARK: - Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
