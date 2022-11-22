//
//  LoginScreenFeature.swift
//  TDDTCA
//
//  Created by arifinfrds.engineer on 19/11/22.
//

import ComposableArchitecture
import Foundation

struct LoginScreenFeature: ReducerProtocol {
    struct State: Equatable {
        var emailText: String = ""
        var passwordText: String = ""
        var errorMessage: String?
    }
    
    enum Action {
        case onEmailTextFieldChanged(text: String)
        case onPasswordTextFieldChanged(text: String)
        case onLoginButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case let .onEmailTextFieldChanged(text):
            state.emailText = text
            
            if !text.isEmpty {
                state.errorMessage = nil
            }
            
            return .none
            
        case let .onPasswordTextFieldChanged(text):
            state.passwordText = text
            
            if !text.isEmpty {
                state.errorMessage = nil
            }
            
            return .none
            
        case .onLoginButtonTapped:
            state.errorMessage = "Email should not be empty"
            return .none
        }
    }
}

