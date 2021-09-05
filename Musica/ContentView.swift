//
//  ContentView.swift
//  Musica
//
//  Created by Aman Joshi on 15/08/21.
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    if UserManager.shared.isLoggedIn {
      HomeView()
    }else {
      LoginView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
