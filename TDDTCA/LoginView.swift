//
//  LoginView.swift
//  TDDTCA
//
//  Created by arifinfrds.engineer on 22/11/22.
//

import ComposableArchitecture
import SwiftUI

struct LoginView: View {
    
    let store: StoreOf<LoginScreenFeature>
    
    @State private var emailText = ""
    @State private var passwordText = ""
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 8) {
                Text("login to Our App!")
                    .font(.largeTitle)
                Text(viewStore.errorMessage ?? "")
                    .foregroundColor(.red)
                
                TextField("Email", text: viewStore.binding(
                    get: \.emailText,
                    send: LoginScreenFeature.Action.onEmailTextFieldChanged(text:)
                ))
                TextField("Password", text: viewStore.binding(
                    get: \.passwordText,
                    send: LoginScreenFeature.Action.onPasswordTextFieldChanged(text:)
                ))
                
                Button("Login", action: {
                    viewStore.send(.onLoginButtonTapped)
                })
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(store: Store(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        ))
    }
}
