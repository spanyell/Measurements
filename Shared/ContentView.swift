//
//  ContentView.swift
//  Shared
//
//  Created by Dan Beers on 9/16/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: LengthConversion()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .leading, endPoint: .topTrailing)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("Length Conversion").bold()
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                        NavigationLink(destination: TempConversion()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                                RadialGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center, startRadius: 10, endRadius: 200)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("Temp Conversion").bold()
                                    .foregroundColor(Color.black)
                            }
                        }
                        NavigationLink(destination: LengthConversion()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                                AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("Weight Conversion").bold()
                                    .foregroundColor(Color.black)
                            }
                        }
                        NavigationLink(destination: LengthConversion()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10.0).fill(Color.green)
                                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                                Text("Volume Conversion").bold()
                                    .foregroundColor(Color.black)
                            }
                        }
                        .navigationBarTitle("Conversion Perversion")
                    }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LengthConversion: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This shit ain't done yet.")
            }
        }
    }
}
struct TempConversion: View {
    
    @State private var numberOfUnit = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    
    var units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var numberOutput: Double {
        let numberOfUnits = Double(numberOfUnit) ?? 0
        
        if inputUnit == 0 && outputUnit == 1 {
           return Double((numberOfUnits * 9/5) + 32)
        }
        if inputUnit == 0 && outputUnit == 2 {
            return Double(numberOfUnits + 273.15)
        }
        if inputUnit == 1 && outputUnit == 0 {
            return Double((numberOfUnits - 32) * 5/9)
        }
        if inputUnit == 1 && outputUnit == 2 {
            return Double((numberOfUnits - 32) * 5/9 + 273.15)
        }
        if inputUnit == 2 && outputUnit == 0 {
            return Double(numberOfUnits - 273.15)
        }
        if inputUnit == 2 && outputUnit == 1 {
            return Double((numberOfUnits - 273.15) * 5/9 + 32)
        } else {
            return numberOfUnits
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the number of units here", text: $numberOfUnit)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose units:")) {
                    Picker("Select Unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converting to:")) {
                    Picker("Select Unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Answer:")) {
                    Text("\(numberOutput, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Temp Conversion")
        }
    }
}
