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
        let store = Store(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        )
        let loginView = LoginView(store: store)
        let loginViewController = UIHostingController(rootView: loginView)
        
        assertSnapshot(matching: loginViewController, as: .image(on: .iPhone13))
    }
}
