import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var instruction: UILabel!
    

    let factory = CipherFactory()
    var cipher: Cipher!
    
    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        
        guard let cipher = self.cipher else{
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText){
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
        
        /*
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.encode(plaintext, secret: secret)
*/
    }
    
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.decode(plaintext, secret: secret)
    }

    // We will talk about this method during lecture
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        let key = sender.titleLabel!.text!
        cipher = factory.cipher(for: key)
        instruction.text = cipher.instructionSet()
        
    }

    
    
    
    
    
    

    
    
}

