import SwiftUI

enum AppearanceChoices: String, Identifiable, CaseIterable {
    case light, dark, system
    
    var id: String {
        return self.rawValue
    }
}

class AppTheme: ObservableObject {
    @AppStorage("selectedAppearance") var selectedAppearance: AppearanceChoices = .system
}

struct DarkModeViewModifier: ViewModifier {
    @ObservedObject var appTheme: AppTheme = AppTheme()
    
    public func getAppearance() -> ColorScheme? {
        switch appTheme.selectedAppearance {
        case .dark:
            return ColorScheme.dark
        case .light:
            return ColorScheme.light
        default:
            return nil
        }   
        
    } 
    
    public func body(content: Content) -> some View {
        content
            .preferredColorScheme(getAppearance())
    }
}
