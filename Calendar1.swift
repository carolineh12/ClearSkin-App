import SwiftUI

// Model representing a day in the calendar
struct Day {
    let date: Int
    let imageName: String
}

// Model representing a month in the calendar
struct Month {
    let name: String
    let days: [Day]
}

// Calendar view
struct CalendarView1: View {
    let months: [Month]
    let columnNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @State private var selectedDay: Day?
    @State private var currentDate = Date()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(months, id: \.name) { month in
                    Section(header: Text(month.name).font(.title).foregroundColor(.black).bold()) {
                        HStack(spacing: 0) {
                            ForEach(columnNames, id: \.self) { columnName in
                                Spacer()
                                Text(columnName)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                        // Create a grid with seven columns
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                            ForEach(month.days, id: \.date) { day in
                                Button(action: {
                                    // Update selected day and current date
                                    selectedDay = day
                                    currentDate = Calendar.current.date(byAdding: .day, value: day.date, to: currentDate) ?? Date()
                                }) {
                                    VStack {
                                        Text("\(day.date)")
                                            .font(.headline)
                                            .foregroundColor(.blue) // Set text color to blue
                                            .frame(width: 25, height: 25)
                                            .background(Color.gray.opacity(0.2))
                                            .clipShape(Circle())
                                            .multilineTextAlignment(.center)
                                            /*.onTapGesture {
                                                    selectedDate = day.date // Update selected date
                                                }
                                             */
                                        
                                    }
                                    .padding()
                                    //.background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        let days = (1...28).map { Day(date: $0, imageName: "image") } // Assuming February has 28 days for simplicity
        let feb = Month(name: "February", days: days)
        let months = [feb]
        return CalendarView1(months: months)
    }
}
