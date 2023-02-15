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
            Form {
                Section(header: Text("Expense Details")) {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Amount")) {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
            }
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
        .navigationBarTitleDisplayMode(.inline) // Show navigation title in line with the back button
    }

}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
     AddView(expenses: Expenses())
    }
}
