//
//  SwiftUIView.swift
//  MachineLearning
//
//  Created by Alumno on 08/04/25.
//
/*
import SwiftUI
import PhotosUI
import Vision

struct SwiftUIView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    var body: some View {
        
        
        VStack {
            if let image = selectedImage{
                Image(uiImage: image).resizable().scaledToFit().cornerRadius(20).frame(width: 300, height: 300)
                
            }
            PhotosPicker(selection: $selectedItem, matching: .images) {
                HStack{
                    Image(systemName: "photo")
                    Text("Seleccionar Imagen")
                }
            }.padding()
                .foregroundStyle(.white)
                .background(Color.blue)
                .cornerRadius(20)
        }.padding().onChange(of: selectedItem){
            loadImage()
        }
    }
    
    private func loadImage(){
        Task{
            if let item = selectedItem{
                let data = try? await item.loadTransferable(type: Data.self)
                let uiImage = UIImage(data: data!)
                selectedImage = uiImage
                if let ciImage = CIImage(image: uiImage!){
                    await classifyImage(ciImage)
                }
            }
        }
    }
    
    private func classifyImage(_ image: CIImage ) async{
        //1. request
        let request = ClassifyImageRequest()
        
        //2. perform
        
        do{
            //clasifica
            let result = try await request.perform(on: image)
            print(result)
            //classifications = result
        }catch{
            print("Clasification failed \(error)")
        }
    }
}

#Preview {
    SwiftUIView()
}
*/
