//
//  HomeController.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/02/18.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    //MARK: - properties
    private let mapView = MKMapView()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - API

    
    func signOut() {
        do {
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        } catch {
            print("로그아웃실패")
        }
    }
    
    
    //MARK: -  helper Functions
    
    private func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
}
