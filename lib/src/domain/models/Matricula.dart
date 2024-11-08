import 'dart:convert';

// Funciones para parsear y serializar los datos de Matricula
List<Matricula> matriculasFromJson(String str) =>
    List<Matricula>.from(json.decode(str).map((x) => Matricula.fromJson(x)));

String matriculasToJson(List<Matricula> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Matricula {
  int? id;
  String curso;
  String estudiante;
  int numeroHoras;
  int numeroCreditos;
  DateTime? fechaRegistro;
  String estado;

  Matricula({
    this.id,
    required this.curso,
    required this.estudiante,
    required this.numeroHoras,
    required this.numeroCreditos,
    this.fechaRegistro,
    required this.estado,
  });

  // Método para convertir JSON en un objeto Matricula (Recepción de datos)
  factory Matricula.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String? dateStr) {
      if (dateStr == null || dateStr.isEmpty) return null;

      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        print("Error parsing date: $e");
        return null;
      }
    }

    return Matricula(
      id: json["id"], // Corregido a la clave correcta
      curso: json["curso"] ?? 'Curso no especificado', // Corregido
      estudiante:
          json["estudiante"] ?? 'Estudiante no especificado', // Corregido
      numeroHoras: json["numeroHoras"] ?? 0, // Corregido
      numeroCreditos: json["numeroCreditos"] ?? 0, // Corregido
      fechaRegistro: parseDate(json["fechaRegistro"]), // Corregido
      estado: json["activo"] == true ? 'Activo' : 'Inactivo', // Corregido
    );
  }

  // Método para convertir un objeto Matricula a JSON (Envío de datos)
  Map<String, dynamic> toJson() => {
  "id": id,
  "curso": curso,
  "estudiante": estudiante,
  "numeroHoras": numeroHoras,
  "numeroCreditos": numeroCreditos,
  "activo": estado == 'Activo', // Esto asegura que "activo" sea un booleano
};

}
