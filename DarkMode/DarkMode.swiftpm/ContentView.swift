import SwiftUI

struct ContentView: View {
    @ObservedObject var appTheme: AppTheme = AppTheme()
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                Text("Dark Mode")
                    .font(.largeTitle)
                    .fontWeight(.black)
                Text("Demo of how to make an appearance setting. Allows for system default (changes with the system settings on device), light or dark.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
            
            VStack() {
                Picker("Color", selection: $appTheme.selectedAppearance) {
                    ForEach(AppearanceChoices.allCases) { choice in
                        Text("\(choice.id.uppercased())").tag(choice)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
            
            Spacer()
            
            VStack {
                Text("Made with 💛 by The Web Workers")
                    .foregroundStyle(.tertiary)
                    .font(.footnote)
                
            }
        }
        .padding(24)
    }
}
