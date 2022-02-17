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
