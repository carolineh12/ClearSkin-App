import SwiftUI

struct CalendarView2: View {
    @State private var selectedDate: Date?
    @State private var isChecked: [Bool] = [false, false, false]
    let itemTexts = ["Apply moisturizer", "Exfoliate", "Apply face mask"]
    let sampleMonths = [
        Month(name: "February", days: (1...28).map { Day(date: $0, imageName: "image2") })
    ]
    
    var body: some View {
        VStack {
            //NavigationView {
                ScrollView {
                    CalendarView(months: sampleMonths)
                        .padding()
                    Divider() // Add a divider between the calendar and the list
                }
                
                // Three rows at the bottom
                List {
                    if let selectedDate = selectedDate {
                        Text("Tasks for \(selectedDate, formatter: dateFormatter)")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical)
                    }
                    ForEach(0..<isChecked.count, id: \.self) { index in
                        HStack {
                            Button(action: {
                                isChecked[index].toggle()
                            }) {
                                Image(systemName: isChecked[index] ? "checkmark.square" : "square")
                                    .foregroundColor(isChecked[index] ? .blue : .gray)
                                    .imageScale(.large)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            Text(itemTexts[index])
                                .foregroundColor(.blue)
                        }
                    }
                }
                .frame(height: 200) // Set a fixed height for the list
            VStack {
                Button(action: {
                    // Navigate to another page
                }) {
                    VStack {
                        Text("Progress Video")
                            .font(.headline)
                            .bold()
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding()
                
                NavigationLink(destination: AnotherPageView()) {
                    EmptyView() // This ensures the NavigationLink covers the entire button area
                }
            }

        }
    }
    private func formattedDate(_ date: Date) -> String {
         let formatter = DateFormatter()
         formatter.dateFormat = "EEEE MMMM d yyyy"
         return formatter.string(from: date)
     }
    // Date Formatter
        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter
        }()
}
struct AnotherPageView: View {
    var body: some View {
        Text("This is another page")
            .font(.largeTitle)
    }
}

struct Calendar2_Previews: PreviewProvider {
    static var previews: some View {
        let days = (1...28).map { Day(date: $0, imageName: "image") }
        let feb = Month(name: "February", days: days)
        let months = [feb]
        CalendarView2()
    }
}

