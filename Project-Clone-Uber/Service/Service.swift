//
//  Service.swift
//  Project-Clone-Uber
//
//  Created by 정덕호 on 2022/03/17.
//

import Firebase

let db = Firestore.firestore()

struct Service {
    
    
    static let shared = Service()
    let uid = Auth.auth().currentUser?.email
    
    func fetchData(completion: @escaping (User) -> Void) {
        
        db.collection("user").document(uid!).getDocument { snapshot, error in
            guard let dic = snapshot?.data() else {return}
            let user = User(dic: dic)
            completion(user)
        }
    }
}

