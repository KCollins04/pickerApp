//
//  ViewController.swift
//  pickerApp
//
//  Created by Kelsey Collins on 2/4/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var solveLabel: UILabel!
    @IBOutlet weak var pickerOutlet: UIPickerView!
   
    var equation = ["+","-","*","/"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerOutlet.delegate = self
    }


    //number of colums
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    //number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //numbers in rows for 0 col into infinint number
        if component == 0 || component == 2{
            return Int(UInt8.max)
               }
        //equation in rows for 1 col
        if component == 1{
            return equation.count
               }
       
        
               return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 || component == 2{
            return String(row)
        }
        if component == 1 {
            return equation[row]
        }
        return ""
       }
    
    
 
    @IBAction func solveAction(_ sender: UIButton) {
        // gets each selected row into one string
        let eq = String(pickerOutlet.selectedRow(inComponent: 0)) + equation[pickerOutlet.selectedRow(inComponent: 1)] + String(pickerOutlet.selectedRow(inComponent: 2))
        
        //truns eq into expression   Ex of Expressiuon: "23 + 2"
        let expression = NSExpression(format: eq)
        
        //solves the expression
        solveLabel.text = "\(expression.expressionValue( with: nil, context: nil)!)"
    }
}

