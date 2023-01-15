class Note {
  int id = 0;
  String nombre = "";
  String edad = "";
  String telefono = "";
  String correo = "";
  String fecha = "";

  Note({
    this.id = 0,
    required this.nombre,
    required this.edad,
    required this.telefono,
    required this.correo,
    required this.fecha,
  });

  Note.empty();

  Map<String, dynamic> toMap() {
    return id == 0
        ? {
            'nombre': nombre,
            'edad': edad,
            'telefono': telefono,
            'correo': correo,
            'fecha': fecha,
          }
        : {
            'id': id,
            'nombre': nombre,
            'edad': edad,
            'telefono': telefono,
            'correo': correo,
            'fecha': fecha,
          };
  }
}
