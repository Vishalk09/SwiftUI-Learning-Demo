//
//  TextFieldView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 30/08/23.
//

import SwiftUI

struct TextFieldView: View {
    @State private var name = "Vishal"
    @State var text = NSMutableAttributedString(string: "")
    
    var body: some View {
        VStack {
            Text("Editor")
//            TextField("Enter your name:", text: $name)
//                .textFieldStyle(.roundedBorder)
//                .textCase(.uppercase)
//
//            Text(72.3, format: .currency(code: "inr"))
            TextView(text: $text)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        
        }
            
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}
