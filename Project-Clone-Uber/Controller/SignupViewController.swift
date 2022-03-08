//
//  SignupViewController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/03/07.
//

import UIKit

class SignupViewController: UIViewController {

    //MARK: - 속성
    
    private let titleLabel: UILabel = {
        UILabel.uberTitleLabel()
    }()
    
    
    private let emailContainerView: UIView = {
        let imageView: UIImageView = {
            UIImageView.imageView(imageName: "email")
        }()
         let emailTextField: UITextField = {
             return UITextField.textField(plachHolderName: "email", isSecureText: false)
        }()
        return UIView.inputContainerView(imageView: imageView, texField: emailTextField)
    }()
    
    private let PasswordContainerView: UIView = {
        let imageView: UIImageView = {
            UIImageView.imageView(imageName: "password")
        }()
         let PasswordField: UITextField = {
             return UITextField.textField(plachHolderName: "Password", isSecureText: true)
        }()
        return UIView.inputContainerView(imageView: imageView, texField: PasswordField)
    }()
    
    private let nameContainerView: UIView = {
        let imageView: UIImageView = {
            UIImageView.imageView(imageName: "user")
        }()
         let PasswordField: UITextField = {
             return UITextField.textField(plachHolderName: "Full name", isSecureText: false)
        }()
        return UIView.inputContainerView(imageView: imageView, texField: PasswordField)
    }()
    
    private let userImage: UIImageView = {
        return UIImageView.imageView(imageName: "user.fill")
    }()
    
    //MARK: - 라이프 사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        makeLayout()
    }
    
    
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
        
        view.addSubview(nameContainerView)
        nameContainerView.anchor(top: PasswordContainerView.bottomAnchor,leading: view.leadingAnchor, trailng: view.trailingAnchor, paddingTop: 16, paddingLeading: 16, paddingTrailing: 16, height: 50)
        
    }


}
