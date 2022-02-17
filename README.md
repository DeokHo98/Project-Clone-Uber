# Project-Clone-Uber
# 우버 클론앱을 만들면서 공부한 내용

## 스토리보드 없이 코드로만 개발할때 환경을 만들기
```swift
//SceneDelegate에 아래 코드 추가하기

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = LoginController()

//내가 원하는 뷰컨트롤러를 앱을 처음 실행할때 나타나게 할수 있다
```


## 스토리보드 없이 뷰에 레이블 넣기
```swift
class LoginController: UIViewController {
    
    //MARK: - Properties
    
    private let titleLabel: UILabel = { //레이블을 만들기
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    //MARK: - Lifecycle

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false //false로 해주어야 오토레이아웃을 내가 조정할수 있음
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true //중앙정렬을 뷰의 중앙정렬에 맞춰 액티브
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true //상부 앵커를 뷰의 상부에 맞춰 액티브
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { //시간이나 와이파이같은 스테이터스 바의 스타일을 바꾸는 코드
        return .lightContent
    }
}

```

## 오토레이아웃울 코드로 아주 편하게 잡을수 있는 extension
```swift
import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func centerY(inView view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        titleLabel.centerX(inView: view)
    }

//이렇게 하면 레이블을 아주 쉽게 내가 원하는데로 레이아웃을 쉽게 잡을수 있다.
//한번 설정해두면 나중에 복사해서 쓰기도 편하다.

```

