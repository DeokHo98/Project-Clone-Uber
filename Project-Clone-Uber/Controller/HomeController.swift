//
//  HomeController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/03/16.
//

import UIKit
import Firebase
import MapKit
class HomeController: UIViewController {
    
    //MARK: - 속성
    private let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    private let locationManager = CLLocationManager()
    
    
    private let inputActivationView: LocationInputActivationView = {
        let view = LocationInputActivationView()
        return view
    }()
    
    private let loccationInputView = LocationInputView()
    
    private let tableview = UITableView(frame: .zero, style: .grouped)
    
    private final let locationInputViewheight: CGFloat = 200
    
    //MARK: - 라이프사이클

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        locationManager.delegate = self
        loccationInputView.delegate = self
        inputActivationView.delegate = self
        
        makeLayout()
        enableLocationServices()
        configureTableView()
    }
    

    
//MARK: - API
    
    func signOut() {
        do {
           try Auth.auth().signOut()
        } catch {
            print("로그아웃 에러")
        }
    }
    
    
    //MARK: - 도움 메서드

    func makeLayout() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
        view.addSubview(inputActivationView)
        inputActivationView.centerX(inView: view)
        inputActivationView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        inputActivationView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.inputActivationView.alpha = 1
        }
    }
    
    func configureLocationInputView() {
        view.addSubview(loccationInputView)
        loccationInputView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailng: view.trailingAnchor, height: 200)
        loccationInputView.alpha = 0
        UIView.animate(withDuration: 0) {
            self.loccationInputView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.tableview.frame.origin.y = self.locationInputViewheight
            }
        }

    }
    
    func configureTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
        
        tableview.register(LocationCell.self, forCellReuseIdentifier: LocationCell.indentifier)
        tableview.rowHeight = 60
        tableview.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height - locationInputViewheight)
        
        view.addSubview(tableview)
    }
    
}

//MARK: - 위치 서비스

extension HomeController: CLLocationManagerDelegate {
    func enableLocationServices() {

        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            print("결정되지않음")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways:
            print("항상 유지")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("자동으로 유지")
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
}

//MARK: - 로케이션 액티비션 뷰 델리게이트
extension HomeController: LocationInputActivationViewDelegate {
    func presentLocationInputView() {
        inputActivationView.alpha = 0
        configureLocationInputView()
    }
    
    
}


//MARK: - 로케이션 인풋 뷰 델리게이트
extension HomeController: LocationInputViewDelegate {
    func dismissLocationInputView() {

        UIView.animate(withDuration: 0.3) {
            self.loccationInputView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.3) { [self] in
                loccationInputView.removeFromSuperview()
                tableview.frame.origin.y = self.view.frame.height
                inputActivationView.alpha = 1
            }
        }

    }
    
    
}
//MARK: - 테이블뷰 데이터소스
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.indentifier, for: indexPath) as! LocationCell
        return cell
    }
    
//MARK: - 테이블뷰 델리게이트
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "test"
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
    
    
}
