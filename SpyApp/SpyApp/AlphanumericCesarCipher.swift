//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Jason Chow on 9/13/18.

import Foundation

struct AlphanumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        var shiftBy = UInt32(secret)!
        
        let uppercasePlaintext = plaintext.uppercased()
        
        for character in uppercasePlaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            while shiftedUnicode > 90{
                shiftedUnicode = shiftedUnicode - 33
            }
            while shiftedUnicode > 57  && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 8
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
            while shiftedUnicode < 48{
                shiftedUnicode = shiftedUnicode + 42 + shiftBy
            }
            while shiftedUnicode < 65  && shiftedUnicode > 57{
                shiftedUnicode = shiftedUnicode - 8 + shiftBy
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
}
    
    func instructionSet() -> String{
        return "Enter a single word with letters or number"
    }
    
}

