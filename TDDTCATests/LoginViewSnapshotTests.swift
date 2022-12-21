//
//  LoginViewSnapshotTests.swift
//  TDDTCATests
//
//  Created by arifinfrds.engineer on 21/12/22.
//

import XCTest
import SnapshotTesting
import SwiftUI
import ComposableArchitecture
@testable import TDDTCA

final class LoginViewSnapshotTests: XCTestCase {

    func test_snapshot_shouldInInitialState() {
        let sut = makeSUT()
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13, traits: UITraitCollection(userInterfaceStyle: .light)))
        assertSnapshot(matching: sut, as: .image(on: .iPad10_2, traits: UITraitCollection(userInterfaceStyle: .dark)))
    }
    
    func test_snapshot_shouldShowEmailTextOnNonEmptyEmail() {
        let sut = makeSUT(initialState: LoginScreenFeature.State(emailText: "any-email@mail.com"))
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13))
    }
    
    func test_snapshot_shouldShowPasswordTextOnNonEmptyPassword() {
        let sut = makeSUT(initialState: LoginScreenFeature.State(passwordText: "any-password"))
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13))
    }
    
    func test_snapshot_shouldShowErrorMessage() {
        let sut = makeSUT(initialState: LoginScreenFeature.State(errorMessage: "any error message"))
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13))
    }
    
    // MARK: - Helpers
    
    private func makeSUT(initialState: LoginScreenFeature.State = LoginScreenFeature.State()) -> UIViewController {
        let store = Store(
            initialState: initialState,
            reducer: LoginScreenFeature()
        )
        let loginView = LoginView(store: store)
        let sut = UIHostingController(rootView: loginView)
        return sut
    }
}
