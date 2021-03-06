//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Jonathan Yee on 4/8/19.
//  Copyright © 2019 Jonathan Yee. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    struct converter{
        var label: String
        var outputVar: String
        var inputVar: String
    }
    
    var number: Float = 0.0
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    
    var converters: [converter] = [converter(label: "fahrenheit to celcius", outputVar: "°C", inputVar: "°F"), converter(label: "celcius to fahrenheit", outputVar: "°F", inputVar: "°C"), converter(label: "miles to kilometers", outputVar: "km", inputVar: "mi"), converter(label: "kilometers to miles", outputVar: "mi", inputVar: "km")]
    
    
   var currentString: String = " "
    //"°F"
   var outputString: String = " "
    //"°C"
    var total = 0.0, outputVar = "°C", inputVar = "°F"
    override func viewDidLoad() {
        super.viewDidLoad()
        //outputDisplay.text = "°C"
        self.outputString = self.outputString + self.outputVar
        self.outputDisplay.text = self.outputString
        self.currentString = self.currentString + self.inputVar
        self.inputDisplay.text = self.currentString
        //inputDisplay.text = "°F"
        // Do any additional setup after loading the view.
    }
    @IBAction func conversionAlert(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Converter", message: " ", preferredStyle: UIAlertController.Style.actionSheet)
        for converter in converters{
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in

                self.inputVar = converter.inputVar
                self.currentString.removeLast(2)
                self.currentString = self.currentString + self.inputVar
                self.inputDisplay.text = self.currentString
                
                self.outputVar = converter.outputVar
                self.outputString.removeLast(2)
                self.outputString = self.outputString + self.outputVar
                self.outputDisplay.text = self.outputString
            }))
        }
        self.present(alert,animated: true,completion: nil)
    }
    @IBAction func number(_ sender: UIButton) {
        currentString = currentString + Int(sender.tag - 1).description
        inputDisplay.text = currentString + inputVar
        
        if(!currentString.isEmpty){
            if(currentString.hasPrefix("-")){
                //currentString.removeLast(2)
                switch (inputVar){
                case "°F":
                    number = -1*((Float(currentString) ?? 0.0)-(Float(32)) * (5/9))
                case "°C":
                    number = -1*(((Float(currentString) ?? 0.0)*(Float(5/9))) + 32)
                case "mi":
                    number = -1*((Float(currentString) ?? 0.0)/0.62137)
                case "km":
                    number = -1*((Float(currentString) ?? 0.0)*0.62137)
                default:
                    break
                }
            }else{
                //currentString.removeLast(2)
                switch (inputVar){
                case "°F":
                    
                    number = ((Float(currentString) ?? 0.0)-(Float(32)) * (5/9))
                case "°C":
                    number = (Float(currentString) ?? 0.0)*(Float(5/9)) + 32
                case "mi":
                    number = (Float(currentString) ?? 0.0)/0.62137
                case "km":
                    number = (Float(currentString) ?? 0.0)*0.62137
                default:
                    break
                }
            }
        }
        outputDisplay.text = "\(number)" + outputVar
        
    }
    @IBAction func misc(_ sender: UIButton) {
        switch(sender.tag){
        case 1:
            currentString = ""
            inputDisplay.text = currentString + inputVar
            number = 0.0
            outputDisplay.text = " " + outputVar
        case 2:
            if(currentString.contains("-")){
                currentString.removeFirst()
            }else{
                currentString = "-" + currentString
            }
            inputDisplay.text = currentString + inputVar
        case 3:
            if inputDisplay.text!.contains(".") || currentString.isEmpty {
                break
            }
            currentString = currentString + "."
            inputDisplay.text! = currentString + inputVar
        default:
            break
        }
    }
    
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


