//
//  AddView.swift
//  iExpense
//
//  Created by Yashraj jadhav on 27/01/23.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var showingAddExpense = false
    
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            VStack {
                Image("receipt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 0)
                
                Form {
                    Section(header: Text("Expense Details").font(.title2)) {
                        TextField("Name", text: $name)
                        
                        Picker("Type", selection: $type) {
                            ForEach(types, id: \.self) {
                                Text($0)
                            }
                        }
                        .font(.custom("Lato", size: 16))
                    }
                    
                    Section(header: Text("Amount").font(.title2)) {
                        TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .font(.custom("Lato", size: 16))
                    }
                }
                .padding(.vertical, 20)
          
                .navigationTitle("Add New Expense")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            let item = ExpenseItem(name: name, type: type, amount: amount)
                            expenses.items.append(item)
                            dismiss()
                        }
                    }
                }
            }
            .accentColor(.blue)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
     AddView(expenses: Expenses())
    }
}
