//
//  LoginScreenReducerTests.swift
//  TDDTCATests
//
//  Created by arifinfrds.engineer on 19/11/22.
//

import ComposableArchitecture
import XCTest
@testable import TDDTCA

final class LoginScreenReducerTests: XCTestCase {

    func test_onEmailTextFieldChanged_shouldSaveEmailState() {
        let typedText = "arifin"
        let store = TestStore(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onEmailTextFieldChanged(text: typedText)) { state in
            state.emailText = typedText
        }
    }
    
    func test_onPasswordTextFieldChanged_shouldSaveEmailState() {
        let typedText = "password"
        let store = TestStore(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onPasswordTextFieldChanged(text: typedText)) { state in
            state.passwordText = typedText
        }
    }
    
    func test_loginButtonTapped_showsErrorWhenEmailIsEmpty() {
        let store = TestStore(
            initialState: LoginScreenFeature.State(emailText: "", passwordText: "any-password"),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onLoginButtonTapped) { state in
            state.errorMessage = "Email should not be empty"
        }
    }
    
    func test_onEmailTextFieldChanged_shouldResetsErrorMessageWhenEmailIsNotEmpty() {
        let store = TestStore(
            initialState: LoginScreenFeature.State(
                emailText: "",
                passwordText: "not empty password",
                errorMessage: "Email and password should not be empty"
            ),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onEmailTextFieldChanged(text: "a")) { state in
            state.emailText = "a"
            state.errorMessage = nil
        }
        
        store.send(.onEmailTextFieldChanged(text: "")) { state in
            state.emailText = ""
            state.errorMessage = nil
        }
    }
    
    func test_onPasswordTextFieldChanged_shouldResetsErrorMessageWhenEmailIsNotEmpty() {
        let store = TestStore(
            initialState: LoginScreenFeature.State(
                emailText: "not empty email",
                passwordText: "",
                errorMessage: "Email and password should not be empty"
            ),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onPasswordTextFieldChanged(text: "a")) { state in
            state.passwordText = "a"
            state.errorMessage = nil
        }
        
        store.send(.onPasswordTextFieldChanged(text: "")) { state in
            state.passwordText = ""
            state.errorMessage = nil
        }
    }
}
