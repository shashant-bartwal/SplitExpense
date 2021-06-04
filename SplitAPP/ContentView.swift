//
//  ContentView.swift
//  SplitAPP
//
//  Created by shashant on 30/05/21.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = ""
    @State private var numberOfpeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfpeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfpeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                        
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?").bold().foregroundColor(.black)) {
                   
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                   Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }.navigationBarTitle("Split Expense")
           
        }
      
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
