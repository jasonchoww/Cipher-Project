//
//  CeaserCipherTests.swift
//  SpyAppTests
//
//  Created by Jason Chow on 9/17/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class CeaserCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        
        cipher = CeaserCipher()
    }
    
    func test_oneCharacterStringGetsMappedtoSelfWith_0_secret(){
        let cipher = CeaserCipher()
        let plaintext = "a"
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNomericInputForSecret(){
        let result = cipher.encode("b", secret: "nonNumericString")
        XCTAssertNil(result)
    }
    
}
