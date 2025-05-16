import SwiftUI

struct NavigatingButtonView<Destination: View>: View
{
    var style: Int
    var text: String
    var color: Color
    var destination: Destination
    var hasNavigation: Bool
    
    // Styles only affects if either the background color changes (Text is white and button bg is red) or if the text changes (Text is red and button is white)
    
    var body: some View
    {
        VStack
        {
            Button(action:{})
            {
                if (style == 1 && hasNavigation)
                {
                    NavigationLink(destination: destination)
                    {
                        Text(text)
                            .foregroundColor(color)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 40)
                            .background(Color.white)
                            .cornerRadius(25)
                    }
                }
                else if (style == 0 && hasNavigation)
                {
                    NavigationLink(destination: destination)
                    {
                        Text(text)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 40)
                            .background(color)
                            .cornerRadius(25)
                    }
                }
                else
                {
                    Text(text)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: 200, maxHeight: 40)
                        .background(color)
                        .cornerRadius(25)
                }
            }
        }
    }
}

