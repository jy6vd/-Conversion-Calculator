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
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    
    var converters: [converter] = [converter(label: "fahrenheit to celcius", outputVar: "°C", inputVar: "°F"), converter(label: "celcius to fahrenheit", outputVar: "°F", inputVar: "°C"), converter(label: "miles to kilometers", outputVar: "km", inputVar: "mi"), converter(label: "kilometers to miles", outputVar: "mi", inputVar: "km")]
    
    
    var currentString: String = ""
    var total = 0.0, forClear = " ", outputVar = "°C", inputVar = "°F"
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDisplay.text = "°C"
        inputDisplay.text = "°F"
        // Do any additional setup after loading the view.
    }
    @IBAction func conversionAlert(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Converter", message: " ", preferredStyle: UIAlertController.Style.actionSheet)
        for converter in converters{
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                //self.inputDisplay.text = "°F"
                self.inputVar = converter.inputVar
                // self.outputDisplay.text = "°C"
                self.outputVar = converter.outputVar
            }))
        }
        self.present(alert,animated: true,completion: nil)
    }
    @IBAction func number(_ sender: UIButton) {
        currentString = currentString + Int(sender.tag - 1).description
        inputDisplay.text = currentString + inputVar
    }
    @IBAction func misc(_ sender: UIButton) {
        switch(sender.tag){
        case 1:
            currentString = ""
            inputDisplay.text = currentString + inputVar
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


