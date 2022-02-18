//
//  SingUpController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/02/17.
//

import UIKit

class SignUpController: UIViewController {
    //MARK: - Properties
    private let titleLabel: UILabel = { //레이블을 만들기
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private lazy var emailContrainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "ic_mail_outline_white_2x")!, textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true //이메일 부분 높이 설정
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    
    private lazy var passwordContrainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "ic_lock_outline_white_2x")!, textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true 
        return view
    }()
    
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    
    private lazy var fullnameContrainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "ic_person_outline_white_2x")!, textField: fullnameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    
    private let fullnameTextField: UITextField = {
        let view = UITextField().textField(withPlaceholder: "Fullname", isSecureTextEntry: false)
        return view
    }()
    
    private lazy var accounContrainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "ic_account_box_white_2x")!, segmentedControl: accountTypeSegmentedControl)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private let  accountTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Rider", "Driver"])
        sc.backgroundColor = .backgroundColor
        sc.tintColor = UIColor(white: 1, alpha: 0.87)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton().loginButton()
        button.setTitle("Sign Up", for: .normal)
        return button
    }()
    
    private let pageReturnButton: UIButton = {
        let button = UIButton().textButton(message: "Already have an account?")
        button.addTarget(self, action: #selector(handlShowLogin), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    
    
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        configureUI()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { //시간이나 와이파이같은 스테이터스 바의 스타일을 바꾸는 코드
        return .lightContent
    }
    
    
    //MARK: - Selectors
    
    @objc func handlShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Helper functions
    
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContrainerView, fullnameContrainerView ,passwordContrainerView,accounContrainerView, loginButton])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        
        view.addSubview(pageReturnButton)
        pageReturnButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,height: 32)
        pageReturnButton.centerX(inView: view)
        }
}
