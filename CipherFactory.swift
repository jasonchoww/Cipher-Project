import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "cesar": CeaserCipher(),
        "alphanumericCesar": AlphanumericCesarCipher(),
        "numericToAlpha": NumericToAlphaCodeCipher(),
        
        
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
    

    
    
    
    
    
}
