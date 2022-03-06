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
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = .white
        return label
    }()
    
    
    private let emailContainerView: UIView = {
        
        let imageView: UIImageView = {
            UIImageView().imageView(imageName: "email")
        }()
        
        
         let emailTextField: UITextField = {
             return UITextField().textField(plachHolderName: "email", isSecureText: false)
        }()
        
        
        return UIView().inputContainerView(imageView: imageView, texField: emailTextField)
    }()
    
    
    private let PasswordContainerView: UIView = {
        
        let imageView: UIImageView = {
            UIImageView().imageView(imageName: "password")
        }()
    
        
         let PasswordField: UITextField = {
             return UITextField().textField(plachHolderName: "Password", isSecureText: true)
        }()
        
        return UIView().inputContainerView(imageView: imageView, texField: PasswordField)
    }()
    
    
    private let LoginButton: UIButton = {
        return UIButton().loginButton(buttonLabel: "Log in")
    }()
    
    private let 
    
    
    //MARK: - 라이프 사이클
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLayout()

        
    }
    
   //MARK: - 도움 메서드
    
    private func makeLayout() {
        view.backgroundColor = UIColor.backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor,leading: view.leadingAnchor,trailng: view.trailingAnchor,paddingTop: 40,paddingLeading: 16,paddingTrailing: 16,height: 50)
        
        view.addSubview(PasswordContainerView)
        PasswordContainerView.anchor(top: emailContainerView.bottomAnchor,leading: view.leadingAnchor,trailng: view.trailingAnchor,paddingTop: 16,paddingLeading: 16,paddingTrailing: 16,height: 50)
        
        view.addSubview(LoginButton)
        LoginButton.anchor(top: PasswordContainerView.bottomAnchor,leading: view.leadingAnchor,trailng: view.trailingAnchor,paddingTop: 16,paddingLeading: 16,paddingTrailing: 16)
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
