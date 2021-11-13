//
//  ContentView.swift
//  WeSplit
//
//  Created by Alex Diaz on 11/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
        let tipPercentages = 0..<101
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
            let checkTotal = Double(checkAmount)
            let tipSelection = Double(tipPercentage)
        
            let tipValue = checkAmount / 100 * tipSelection
            let totalCheckAmount = checkTotal + tipValue
        
            return totalCheckAmount
        }
    
    var cheapSkate: Bool {
        if tipPercentage == 0 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    }
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                    }
                }
            
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0)%")
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
            }
            
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    } header: {
                        Text("Amount Per Person")
            }
                 
                
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(cheapSkate ? .red : .black)
                }
             header: {
                    Text("Total amount")
                }
            }
            
                .navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                                amountIsFocused = false
                    }
                }
            }
        }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
