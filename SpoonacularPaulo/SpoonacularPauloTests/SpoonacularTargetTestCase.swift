//
//  SpoonacularTargetTestCase.swift
//  SpoonacularPauloTests
//
//  Created by Paulo H.M. on 02/11/22.
//
@testable import SpoonacularPaulo

import XCTest


final class SpoonacularTargetTestCase: XCTestCase {
    var sut : SpoonacularTarget!
    
    override func setUpWithError() throws {
        sut = SpoonacularTarget.search
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }
    
    func testValidSearchOptionConfiguration() throws {
        XCTAssert(sut.baseURL.baseURL?.path() == SpoonacularTargetConfiguration.baseUrl, "Base url Problem")

        XCTAssert(sut.path == SpoonacularTargetConfiguration.Path.searchPath, "PAth Problem")

        XCTAssert(sut.headers == SpoonacularTargetConfiguration.Headers.search, "Headers Problem")

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
