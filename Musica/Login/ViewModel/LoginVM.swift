//
//  LoginVM.swift
//  Musica
//
//  Created by Aman Joshi on 15/08/21.
//

import SwiftUI
import FirebaseAuth

class LoginVM: ObservableObject {

  @Published var email = ""
  @Published var password = ""
  @Published var state:State = .initial

  func validate() {
    if isValidEmailAddress(emailAddressString: email) {
      if password.count > 5 {
        state = .loading
        signIn()
      }else {
        state = .error(msg: Constants.shared.minPassword)
      }
    }
    else {
      state = .error(msg: Constants.shared.invalidEmail)
    }
  }

  private func signIn() {
    UserManager.shared.signIn(email: email, password: password) { (isLoggedIn, error) in
      if error == nil {
        self.state = .success
      }else {
        self.state = .error(msg: Constants.shared.somethingWrong)
      }
    }
  }

  func isValidEmailAddress(emailAddressString: String) -> Bool {

    var returnValue = true
    let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

    do {
      let regex = try NSRegularExpression(pattern: emailRegEx)
      let nsString = emailAddressString as NSString
      let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))

      if results.count == 0
      {
        returnValue = false
      }

    } catch let error as NSError {
      print("invalid regex: \(error.localizedDescription)")
      returnValue = false
    }

    return  returnValue
  }
}
