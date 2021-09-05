//
//  LoginServiceTests.swift
//  MusicaTests
//
//  Created by Aman Joshi on 05/09/21.
//

import XCTest
@testable import Musica

class LoginServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testIsEmailValid() throws {
    let viewModel = LoginVM()
    let isValid = viewModel.isValidEmailAddress(emailAddressString: "aman.joshi@crownstack.com")
    
    XCTAssertEqual(isValid, true)
  }

  func testIsPassValid() throws {
    let viewModel = LoginVM()
    let isValid = viewModel.isValidPass(password: "1234")

    XCTAssertEqual(isValid, false)
  }

}
