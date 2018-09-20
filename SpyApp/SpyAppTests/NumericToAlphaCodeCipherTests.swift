//
//  NumericToAlphaTests.swift
//  SpyAppTests
//
//  Created by Jason Chow on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class NumericToAlphaCodeCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = NumericToAlphaCodeCipher()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_decodedComparedtoEncoded(){
        let result = cipher.encode("123", secret: "0")
        XCTAssertEqual("123", cipher.decode(result!, secret: "0"))
    }
    
}
