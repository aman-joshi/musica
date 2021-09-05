//
//  LoadinView.swift
//  Musica
//
//  Created by Aman Joshi on 05/09/21.
//

import SwiftUI

struct LoadingView<Content: View>: View {

  private var content: Content

  init(content: Content) {
    self.content = content
  }


  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .center) {

        self.content
          .disabled(true)
          .blur(radius:3)

        VStack {
          Text("Loading...")
          ActivityIndicator(isAnimating: .constant(true), style: .large)
        }
        .frame(width: 100,
               height: 100)
        .background(Color.secondary.colorInvert())
        .foregroundColor(Color.primary)
        .cornerRadius(20)
        .opacity(1)

      }
    }
  }
}
