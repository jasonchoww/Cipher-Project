//  SpyApp
//
//  Created by Jason Chow on 9/13/18.

import Foundation

struct ReverseAlphaCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        var shiftBy = UInt32(secret)!
        
        let uppercasePlaintext = plaintext.uppercased()
        
        for character in uppercasePlaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            let modifier = shiftedUnicode - 65
            if shiftedUnicode > 64 && shiftedUnicode < 91{
                shiftedUnicode = 64 + 26 - modifier
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
            var shiftedUnicode = unicode + shiftBy
            let modifier = shiftedUnicode - 65
            if shiftedUnicode > 64 && shiftedUnicode < 91{
                shiftedUnicode = 90 - modifier
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
    
    
    func instructionSet() -> String{
        return "Enter letters with no numbers and no spaces and set the bottom text field to 0"
    }
 
}
