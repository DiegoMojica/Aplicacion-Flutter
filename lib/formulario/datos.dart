class Note {
  int id = 0;
  String novedad = "";
  String codigo = "";
  String nombre = "";
  String codDescrip = "";
  String cargo = "";
  String depenD = "";
  String correo = "";
  String codOper = "";
  String operResp = "";

  Note({
    this.id = 0,
    required this.novedad,
    required this.codigo,
    required this.nombre,
    required this.codDescrip,
    required this.cargo,
    required this.depenD,
    required this.correo,
    required this.codOper,
    required this.operResp,
  });

  Note.empty();

  Map<String, dynamic> toMap() {
    return id == 0
        ? {
            'novedad': novedad,
            'codigo': codigo,
            'nombre': nombre,
            'codDescrip': codDescrip,
            'cargo': cargo,
            'depenD': depenD,
            'correo': correo,
            'codOper': codOper,
            'operResp': operResp,
          }
        : {
            'id': id,
            'novead': novedad,
            'codigo': codigo,
            'nombre': nombre,
            'codDescrip': codDescrip,
            'cargo': cargo,
            'telefono': depenD,
            'correo': correo,
            'codOper': codOper,
            'operResp': operResp,
          };
  }
}
