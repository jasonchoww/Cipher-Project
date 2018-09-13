//
//  atbashCipher.swift
//  SpyApp
//
//  Created by Jason Chow on 9/13/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct NumericToAlphaCodeCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        var shiftBy = UInt32(secret)!

        let uppercasePlaintext = plaintext.uppercased()
        
        for character in uppercasePlaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            while shiftedUnicode > 48 && shiftedUnicode < 58{
                shiftedUnicode = shiftedUnicode + 16
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        var decoded = ""
        var shiftBy = UInt32(secret)!
        
        let uppercasePlaintext = plaintext.uppercased()
        
        for character in uppercasePlaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy
            while shiftedUnicode > 64  && shiftedUnicode < 74{
                shiftedUnicode = shiftedUnicode - 16
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}
