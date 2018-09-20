import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "cesar": CeaserCipher(),
        "alphanumericCaesar": AlphanumericCesarCipher(),
        "numericToAlpha": NumericToAlphaCodeCipher(),
        "reverseAlpha": ReverseAlphaCipher()
        
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
    
  
}
