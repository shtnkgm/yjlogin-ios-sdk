//
//  StubProcess.swift
//  YJLoginSDKTests
//
//  Copyright © 2019 Yahoo Japan Corporation. All rights reserved.
//
import Foundation
@testable import YJLoginSDK

internal struct StubProcess: AuthenticationProcessProtocol {
    var viewController: UIViewController?
    private let result: Result<LoginResult, LoginError>

    var onFinish: ((Result<LoginResult, LoginError>) -> Void)?
    init(result: Result<LoginResult, LoginError>) {
        self.result = result
    }

    func start(request: AuthenticationRequest) {
        usleep(200_000)
        onFinish?(result)
    }

    func resume(url: URL) -> Bool {
        return true
    }
}
