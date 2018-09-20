//
//  AlphanumericCesarCipherTests.swift
//  SpyAppTests
//
//  Created by Jason Chow on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphanumericCesarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphanumericCesarCipher()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_decodedComparedtoEncoded(){
        let result = cipher.encode("abc", secret: "2")
        XCTAssertEqual("ABC", cipher.decode(result!, secret: "2"))
    }
    
}
