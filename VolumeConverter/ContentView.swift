//
//  ContentView.swift
//  VolumeConverter
//
//  Created by Milosz Tabaka on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0.0
    @State private var inputUnit: volumes = .liters
    @State private var outputUnit: volumes = .milliliters
    @FocusState private var focus: Bool
    
    var outputValue: Double {
        let inputInLiters = inputValue * inputUnit.rawValue
        let output = inputInLiters / outputUnit.rawValue
        
        return output
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Source value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($focus)
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(volumes.allCases, id: \.self) {
                            Text($0.description)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input value")
                }
                
                Section {
                    Text(outputValue, format: .number)
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(volumes.allCases, id: \.self) {
                            Text($0.description)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Value")
                }
            }
            .navigationTitle("VolumeConverter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focus = false
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
