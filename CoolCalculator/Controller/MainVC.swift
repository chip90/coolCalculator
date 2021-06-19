//
//  ViewController.swift
//  CoolCalculator
//
//  Created by Carleton Snow on 6/10/21.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var calLbl: UILabel!
    
    enum selectedOperation: String {
        case Divide = "/"
        case Multiplication = "*"
        case Subtraction = "-"
        case Addition = "+"
        case Empty = "Empty"
    }
    
    var inputNumber = ""
    var firstStatement: Double = 0.0
    var secondStatement: Double = 0.0
    var statementResults: Double = 0.0
    var currentOperation = selectedOperation.Empty

    override func viewDidLoad() {
        super.viewDidLoad()
        calLbl.text = "0"
    }
    
    @IBAction func pressedNumber(sender: UIButton) {
        inputNumber += "\(sender.tag)"
        calLbl.text = inputNumber
    }
    
    @IBAction func opMultiplication(_ sender: Any) {
        setOperation(operation: .Multiplication)
    }
    
    @IBAction func opDivision(_ sender: Any) {
        setOperation(operation: .Divide)
    }
    
    @IBAction func opAddition(_ sender: Any) {
        setOperation(operation: .Addition)
    }
    
    @IBAction func opSubtraction(_ sender: Any) {
        setOperation(operation: .Subtraction)
    }
    
    @IBAction func equalsPressed(_ sender: Any) {
        setOperation(operation: currentOperation)
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        clearCalculator()
    }
    
    @IBAction func decimalPressed(_ sender: Any) {
        decimalPointAdd()
    }
    
    @IBAction func backSpacePressed(_ sender: Any) {
        backSpace()
    }
    
    @IBAction func sqrPressed(_ sender: Any) {
        squareRoot()
    }
    
    @IBAction func percentPressed(_ sender: Any) {
        changePercent()
    }
    
    func squareRoot() {
        if inputNumber != "" {
            let sqrRoot = Double(inputNumber)!.squareRoot()
            inputNumber = String(sqrRoot)
            calLbl.text = inputNumber
        }
    }
    
    func changePercent() {
        if inputNumber != "" {
            let percentNum = Double(inputNumber)!
            inputNumber = String(percentNum / 100)
            calLbl.text = inputNumber
        }
    }
    
    func decimalPointAdd() {
        let check = inputNumber.firstIndex(of: ".") ?? inputNumber.endIndex
        if check == inputNumber.endIndex {
            if inputNumber == "" {
                inputNumber = "0."
            } else {
                inputNumber += "."
            }
            calLbl.text = inputNumber
        }
    }
    
    func backSpace() {
        if inputNumber != "" {
            inputNumber.remove(at: inputNumber.index(before: inputNumber.endIndex))
            calLbl.text = inputNumber
        }
    }
    
    func clearCalculator() {
        inputNumber = ""
        firstStatement = 0.0
        secondStatement = 0.0
        statementResults = 0.0
        currentOperation = selectedOperation.Empty
        calLbl.text = "0"
    }
    
    func setOperation(operation: selectedOperation) {
        if currentOperation == .Empty {
            currentOperation = operation
            if inputNumber != "" {
                firstStatement = Double(inputNumber)!
                inputNumber = ""
            }
        } else {
            if inputNumber != "" {
                secondStatement = Double(inputNumber)!
                inputNumber = ""
                
                switch currentOperation {
                case .Multiplication:
                    statementResults = firstStatement * secondStatement
                case .Divide:
                    statementResults = firstStatement / secondStatement
                case .Addition:
                    statementResults = firstStatement + secondStatement
                case .Subtraction:
                    statementResults = firstStatement - secondStatement
                default:
                    statementResults = 0.0
                }
                
                firstStatement = statementResults
                calLbl.text = String(statementResults)
            }
            currentOperation = operation
        }
    }
    
}

