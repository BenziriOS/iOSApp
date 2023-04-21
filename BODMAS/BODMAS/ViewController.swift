//
//  ViewController.swift
//  BODMAS
//
//  Created by MAC on 05/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiTextField: UITextField!
    
    var Number1 = 0
    var Number2 = 0
    var Number3 = 0
    
    var Operator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Button1(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "1"
        
    }
    @IBAction func Button2(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "2"
        
    }

    @IBAction func Button3(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "3"
        
    }

    @IBAction func Button4(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "4"
        
    }

    @IBAction func Button5(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "5"
    }

    @IBAction func Button6(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "6"
    }

    @IBAction func Button7(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "7"
    }

    @IBAction func Button8(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "8"
    }

    @IBAction func Button9(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "9"
    }

    @IBAction func Button0(Sender : UIButton){
        uiTextField.text = uiTextField.text! + "0"
    }
    
    @IBAction func ButtonDvision(Sender : UIButton){
        Operator = "/"
        Number1 =   Int(uiTextField.text!)!
        ClearText()
    }

    @IBAction func ButtonMultiplication(Sender : UIButton){
        Operator = "*"
        Number1 =   Int(uiTextField.text!)!
        ClearText()
    }

    @IBAction func ButtonPlus(Sender : UIButton){
        Operator = "+"
        Number1 =   Int(uiTextField.text!)!
        ClearText()
    }

    @IBAction func ButtonMinus(Sender : UIButton){
        Operator = "-"
        Number1 =   Int(uiTextField.text!)!
        ClearText()
    }
   
   
    @IBAction func ButtonEqual(Sender : UIButton){
        Number2 = Int(uiTextField.text!)!
        
        switch Operator {
        case "/":
            Number3 = Number1 / Number2
            uiTextField.text = String(Number3)
        case "*":
            Number3 = Number1 * Number2
            uiTextField.text = String(Number3)
        case "+":
            Number3 = Number1 + Number2
            uiTextField.text = String(Number3)
        case "-":
            Number3 = Number1 - Number2
            uiTextField.text = String(Number3)
       
       
        default:
            uiTextField.text = "ERROR"
        }
    }

    @IBAction func ButtonClear(Sender : UIButton){
        ClearText()
    }

    func ClearText() {
        uiTextField.text = ""
        
        
    }
    
}

