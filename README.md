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
