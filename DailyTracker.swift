import SwiftUI

struct DailyTracker: View {
    // User-entered data
    @State private var fatConsumed: Double = 0
    @State private var proteinConsumed: Double = 0
    @State private var carbsConsumed: Double = 0

    // Daily goals
    let dailyFatGoal: Double = 70 // Example value, you can change it
    let dailyProteinGoal: Double = 90 // Example value, you can change it
    let dailyCarbsGoal: Double = 200 // Example value, you can change it

    // Calculated percentages
    var fatPercentage: Double {
        return (fatConsumed / dailyFatGoal) * 100
    }

    var proteinPercentage: Double {
        return (proteinConsumed / dailyProteinGoal) * 100
    }

    var carbsPercentage: Double {
        return (carbsConsumed / dailyCarbsGoal) * 100
    }

    // Calculated total calories
    var totalCalories: Int {
        let fatCalories = Int(fatConsumed * 9) // 9 calories per gram of fat
        let proteinCalories = Int(proteinConsumed * 4) // 4 calories per gram of protein
        let carbsCalories = Int(carbsConsumed * 4) // 4 calories per gram of carbs
        return fatCalories + proteinCalories + carbsCalories
    }

    var body: some View {
        VStack {
            Text("Daily Tracker")
                .font(.largeTitle)
                .padding()

            Spacer()

            HStack(spacing: 20) {
                // Fat tracker
                TrackerView(color: .blue, consumed: fatConsumed, goal: dailyFatGoal, percentage: fatPercentage, nutrient: "Fat")

                // Protein tracker
                TrackerView(color: .green, consumed: proteinConsumed, goal: dailyProteinGoal, percentage: proteinPercentage, nutrient: "Protein")

                // Carbs tracker
                TrackerView(color: .orange, consumed: carbsConsumed, goal: dailyCarbsGoal, percentage: carbsPercentage, nutrient: "Carbs")
            }
            .padding()

            Spacer()

            Text("Total Calories: \(totalCalories)")
                .font(.headline)
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct TrackerView: View {
    let color: Color
    let consumed: Double
    let goal: Double
    let percentage: Double
    let nutrient: String

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                    .frame(width: 180, height: 180)

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(percentage / 100, 1.0)))
                    .stroke(color, style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.linear)
                    .frame(width: 180, height: 180)

                VStack {
                    Text("\(Int(consumed))/\(Int(goal))g")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)

                    Text("\(Int(percentage))%")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }

            Text(nutrient)
                .font(.headline)
                .padding(.top, 10)
        }
    }
}

struct DailyTracker_Previews: PreviewProvider {
    static var previews: some View {
        DailyTracker()
    }
}
