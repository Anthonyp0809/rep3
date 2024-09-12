//
//  ContentView.swift
//  WeSplit
//
//  Created by Mobile on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tapCount = 0
    @State private var checkAmount = 0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson : Double{
        return 0
        let peopleCount = Double(numberOfPeople + 2)
           let tipSelection = Double(tipPercentage)

           let tipValue = checkAmount / 100 * tipSelection
           let grandTotal = checkAmount + tipValue
           let amountPerPerson = grandTotal / peopleCount

           return amountPerPerson
    }
    var body: some View {
        NavigationStack {
            Form{
                
                
                Section("Enter amount paid"){
                    TextField("Amount", value:$checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("number opf people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0)people")
                        }
                    }
//                    .pickerStyle(.segmented)
                }
                Section("You entered:"){
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
            }
            .navigationTitle("weSplit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
        
}
//VStack {
//  Image(systemName: "globe")
//    .imageScale(.large)
//  .foregroundStyle(.tint)
//text("hello world")
//.foregroundStyle(.pink)

// .padding()


//
#Preview {
    ContentView()
}
