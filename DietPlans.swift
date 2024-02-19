import SwiftUI

struct DietPlans: View {
    let dietOptions = ["Pescetarian", "Nut Free", "Vegan", "Paleo", "Vegetarian", "Diabetic", "Lactose-Free", "Gluten-Free", "Low/No Sodium", "High Protein", "Low Carb", "Other"]
    @State private var selectedDiet: Set<String> = []
    @State private var isOtherSelected = false
    @State private var isAddMealsButtonVisible = true // Change here

    var body: some View {
        NavigationView {
            VStack {
                Text("Select a diet:")
                    .font(.headline)
                    .padding()

                List(dietOptions, id: \.self, selection: $selectedDiet) { diet in
                    Text(diet)
                }
                .listStyle(GroupedListStyle())
                .onAppear {
                    UITableView.appearance().allowsMultipleSelection = true
                }

                Button(action: {
                    //  button action
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "food")
                            .foregroundColor(.white)
                        Text("AddMeals") // Changed button text
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(25) 
                    .padding([.leading, .trailing]) // Adjusted padding
                }
                .disabled(!isAddMealsButtonVisible)
                .opacity(isAddMealsButtonVisible ? 1 : 0)

                Spacer()
            }
            .navigationTitle("Diet Selection")
        }
    }
}

struct DietPlans_Previews : PreviewProvider {
    static var previews : some View {
        DietPlans()
    }
}

