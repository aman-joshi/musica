//
//  UserManager.swift
//  Musica
//
//  Created by Aman Joshi on 28/08/21.
//

import Foundation
import FirebaseAuth

class UserManager {

  static let shared = UserManager()
  private init() {}

  var isLoggedIn:Bool {
    Auth.auth().currentUser != nil
  }

  func logOut() {
    try! Auth.auth().signOut()
  }

  func signIn(email:String, password:String,completion:@escaping (Bool, Error?) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      if error == nil {
        if let _ = authResult?.user {
          completion(true,nil)
        }
      }else {
        self.signUp(email: email, password: password) { (isSignUp, error) in
          completion(isSignUp,error)
        }
      }
    }
  }

  private func signUp(email:String, password:String,completion:@escaping (Bool,Error?) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
      if error == nil {
        completion(true,nil)
      }else {
        completion(false,error)
      }
    }
  }

}
