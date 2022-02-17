//
//  LoginController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/02/17.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    
    //우버 레이블
    private let titleLabel: UILabel = { //레이블을 만들기
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    
    
    
    
    //로그인 - 이메일
    private lazy var emailContrainerView: UIView = {
        return UIView().inputContainerView(image: UIImage(named: "ic_mail_outline_white_2x")!, textField: emailTextField)
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    
    //로그인 - 비밀번호
    private lazy var passwordContrainerView: UIView = {
        return UIView().inputContainerView(image: UIImage(named: "ic_lock_outline_white_2x")!, textField: passwordTextField)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    
    
    
    
    
    
    //MARK: - Lifecycle

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContrainerView, passwordContrainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        
        
        view.addSubview(emailContrainerView)
        emailContrainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16, height: 50)
        view.addSubview(passwordContrainerView)
        passwordContrainerView.anchor(top: emailContrainerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 50)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { //시간이나 와이파이같은 스테이터스 바의 스타일을 바꾸는 코드
        return .lightContent
    }
}
