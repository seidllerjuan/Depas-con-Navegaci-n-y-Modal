//
//  DepartamentosMainView.swift
//  Depas navigation modal
//
//  Created by WIN603 on 20/10/26.
//


import SwiftUI

struct DepartamentosMainView: View {
    @State var departamentos: [Departamento] = [
        Departamento(
            ubicacion: "CDMX",
            imagen: "depa01",
            precio: "$2,500 / noche",
            caracteristicas: [
                "Wi-Fi de alta velocidad",
                "Aire acondicionado",
                "Cocina equipada",
                "Refrigerador grande",
                "Cama King Size",
                "Elevador disponible"
            ],
            diagramaImagen: "depa011",
            fotosAdicionales: ["depa01", "depa04"]
        ),
        Departamento(
            ubicacion: "Cancún",
            imagen: "depa02",
            precio: "$3,800 / noche",
            caracteristicas: [
                "Wi-Fi de alta velocidad",
                "Aire acondicionado",
                "Cocina equipada",
                "Refrigerador grande",
                "Cama Matrimonial",
                "Estacionamiento privado"
            ],
            diagramaImagen: "depa012",
            fotosAdicionales: ["depa04", "depa01"]
        ),
        Departamento(
            ubicacion: "Guadalajara",
            imagen: "depa03",
            precio: "$2,100 / noche",
            caracteristicas: [
                "Wi-Fi de alta velocidad",
                "Aire acondicionado",
                "Cocina equipada",
                "Refrigerador grande",
                "Cama Queen Size",
                "Elevador disponible"
            ],
            diagramaImagen: "depa013",
            fotosAdicionales: ["depa01", "depa05"]
        ),
        Departamento(
            ubicacion: "Monterrey",
            imagen: "depa04",
            precio: "$2,400 / noche",
            caracteristicas: [
                "Wi-Fi de alta velocidad",
                "Aire acondicionado",
                "Cocina equipada",
                "Refrigerador grande",
                "Cama King Size",
                "Elevador disponible"
            ],
            diagramaImagen: "depa014",
            fotosAdicionales: ["depa05", "depa01"]
        ),
        Departamento(
            ubicacion: "Puebla",
            imagen: "depa05",
            precio: "$1,800 / noche",
            caracteristicas: [
                "Wi-Fi de alta velocidad",
                "Aire acondicionado",
                "Cocina equipada",
                "Refrigerador grande",
                "Cama Matrimonial"
            ],
            diagramaImagen: "depa015",
            fotosAdicionales: ["depa03", "depa04"]
        )
    ]

    @State var departamentoReservadoId: UUID? = nil
    @State var mostrarAlerta: Bool = false
    @State var mensajeAlerta: String = ""

    var todosSonFavoritos: Bool {
        for depto in departamentos {
            if !depto.esFavorito {
                return false
            }
        }
        return true
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    if todosSonFavoritos {
                        GroupBox {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("Todos han sido marcados")
                                    .bold()
                                    .foregroundColor(.green)
                            }
                        }
                    }

                    Toggle("Marcar todos como favoritos", isOn: Binding(
                        get: {
                            todosSonFavoritos
                        },
                        set: { nuevoValor in
                            for i in 0..<departamentos.count {
                                departamentos[i].esFavorito = nuevoValor
                            }
                        }
                    ))
                    .padding()
                    .background(Color.orange.opacity(0.15))
                    .cornerRadius(12)

                    ForEach(departamentos.indices, id: \.self) { index in
                        DepartamentoView(
                            departamento: $departamentos[index],
                            departamentoReservadoId: $departamentoReservadoId,
                            mensajeAlerta: $mensajeAlerta,
                            mostrarAlerta: $mostrarAlerta
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Departamentos")
            .background(Color.gray.opacity(0.1).ignoresSafeArea())
        }
        .alert(isPresented: $mostrarAlerta) {
            Alert(
                title: Text("Notificación"),
                message: Text(mensajeAlerta),
                dismissButton: .default(Text("Aceptar"))
            )
        }
    }
}
