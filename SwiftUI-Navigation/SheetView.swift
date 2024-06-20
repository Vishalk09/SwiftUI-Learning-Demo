//
//  SheetView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 29/08/23.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingFirst = false
    @State private var showingSecond = false

    @Binding var chartType: ChartType
    var body: some View {

        List {
            Button("Bar") {
                chartType = .bar
                presentationMode.wrappedValue.dismiss()
            }
            Button("Line") {
                chartType = .line
                presentationMode.wrappedValue.dismiss()
            }
            Button("Area") {
                chartType = .area
                presentationMode.wrappedValue.dismiss()
            }
            Button("Rectangle") {
                chartType = .rectangle
                presentationMode.wrappedValue.dismiss()
            }
            Button("Point") {
                chartType = .point
                presentationMode.wrappedValue.dismiss()
            }
        }
        Spacer()
        Button("Present sheet 1") {
            showingFirst = true
        }
        .sheet(isPresented: $showingFirst) {
            Button("Present sheet 2") {
                showingSecond = true
            }
            .sheet(isPresented: $showingSecond){
                Text("Sheet 2")
                    
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        @State var chartType = ChartType.bar
        SheetView(chartType: $chartType)
        SheetView(chartType: $chartType).preferredColorScheme(.dark)
    }
}
