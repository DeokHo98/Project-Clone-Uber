//
//  loginViewController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/03/06.
//

import UIKit

class loginViewController: UIViewController {
    
    //MARK: - 속성
    private let titleLabel: UILabel = {
        UILabel.uberTitleLabel()
    }()
    
    
    private let emailContainerView: UIView = {
        
        let imageView: UIImageView = {
            UIImageView.imageView(imageName: "email",alpha: 0.87)
        }()
        
        
         let emailTextField: UITextField = {
             return UITextField.textField(plachHolderName: "email", isSecureText: false)
        }()
        
        
        return UIView.inputContainerView(imageView: imageView, texField: emailTextField)
    }()
    
    
    private let PasswordContainerView: UIView = {
        
        let imageView: UIImageView = {
            UIImageView.imageView(imageName: "password",alpha: 0.87)
        }()
    
        
         let PasswordField: UITextField = {
             return UITextField.textField(plachHolderName: "Password", isSecureText: true)
        }()
        
        return UIView.inputContainerView(imageView: imageView, texField: PasswordField)
    }()
    
    
    private let LoginButton: UIButton = {
        return UIButton.loginButton(buttonLabel: "Log in")
    }()
    
    private let accountButton: UIButton = {
        let button = UIButton.textButton(text1: "Don't have an accout?  ", text2: "Sign up")
        button.addTarget(self, action: #selector(handlerSignUp), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: -  셀렉터
    
    @objc func handlerSignUp() {
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }
    
    
    
    
    //MARK: - 라이프 사이클
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        makeLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationSetting()
    }
    
    //화면 터치시 키보드 내리기 기능입니다.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    
    //MARK: - 도움 메서드
    
    private func makeLayout() {

        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor,leading: view.leadingAnchor,trailng: view.trailingAnchor,paddingTop: 40,paddingLeading: 16,paddingTrailing: 16,height: 50)
        
        view.addSubview(PasswordContainerView)
        PasswordContainerView.anchor(top: emailContainerView.bottomAnchor,leading: view.leadingAnchor,trailng: view.trailingAnchor,paddingTop: 16,paddingLeading: 16,paddingTrailing: 16,height: 50)
        
        view.addSubview(LoginButton)
        LoginButton.anchor(top: PasswordContainerView.bottomAnchor,leading: view.leadingAnchor,trailng: view.trailingAnchor,paddingTop: 16,paddingLeading: 16,paddingTrailing: 16)
        
        view.addSubview(accountButton)
        accountButton.centerX(inView: view)
        accountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,height: 32)
    }
    
    private func navigationSetting() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
