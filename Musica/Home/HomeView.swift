//
//  HomeView.swift
//  Musica
//
//  Created by Aman Joshi on 15/08/21.
//

import SwiftUI

struct HomeView: View {

  init() {
    UserManager.shared.logOut()
  }

  var body: some View {
    NavigationView {
      Text("Login success")
        .navigationBarTitle("Home")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
