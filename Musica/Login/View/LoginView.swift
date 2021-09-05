//
//  LoginView.swift
//  Musica
//
//  Created by Aman Joshi on 15/08/21.
//

import SwiftUI

struct LoginView: View {

  @ObservedObject var viewModel = LoginVM()

    var body: some View {
      switch viewModel.state {
      case .initial:
          baseView()
      case .loading:
        LoadingView(content: baseView())
      case .success:
        HomeView()
      case .error(let msg):
          baseView()
            .alert(isPresented: .constant(true), content: {
              DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                viewModel.state = .initial
              }
              return Alert(title: Text(Constants.shared.error), message: Text(msg), dismissButton: nil)
            })
      }
    }

  func baseView() -> some View {
    return
      VStack {
        Text(Constants.shared.APP_NAME).font(.custom(Font.gilroyBold, size: FontSize.xxLarge)).foregroundColor(AppColor.shared.white)
          .padding([.top,.bottom],40)
        Image("logo").resizable()
          .frame(width: 250, height: 250)
          .clipShape(Circle())
          .overlay(Circle().stroke(AppColor.shared.white, lineWidth: 4.0))
          .shadow(radius: 10)
          .padding(.bottom,50)

        VStack(alignment: .leading, spacing: 15, content: {
          TextField(Constants.shared.emailPlaceholder, text: $viewModel.email)
            .padding()
            .background(AppColor.shared.white.opacity(0.8))
            .cornerRadius(20.0)

          SecureField(Constants.shared.passwordPlaceholder, text: $viewModel.password)
            .padding()
            .background(AppColor.shared.white.opacity(0.8))
            .cornerRadius(20.0)
        })
        .padding([.leading, .trailing], 27.5)

        Button(action: {
          viewModel.validate()
        }) {
          Text(Constants.shared.signInSignUp)
            .font(.headline)
            .foregroundColor(AppColor.shared.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.green)
            .cornerRadius(15.0)
        }.padding()
        Spacer()
      }
      .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
  }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
