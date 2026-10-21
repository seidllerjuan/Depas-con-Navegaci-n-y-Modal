//
//  ModalFotosView.swift
//  Depas navigation modal
//
//  Created by WIN603 on 20/10/26.
//
import SwiftUI

struct ModalFotosView: View {
    @Environment(\.dismiss) var dismiss
    let departamento: Departamento

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Diagrama del Departamento")
                        .font(.headline)

                    Image(departamento.diagramaImagen)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)

                    Text("Más Fotos")
                        .font(.headline)

                    ForEach(departamento.fotosAdicionales, id: \.self) { foto in
                        Image(foto)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(12)
                            .clipped()
                    }
                }
                .padding()
            }
            .navigationTitle("Planos y Galería")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
