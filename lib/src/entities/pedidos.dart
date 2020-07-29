

import 'package:delivery_prueba1/src/entities/tienda_profile.dart';
import 'package:delivery_prueba1/src/entities/usuario.dart';

class Pedido{
  String id;
  String fecha;
  Usuario cliente;
  Tienda tienda;
  String servicio;

  Pedido(this.id, this.fecha, this.cliente, this.tienda, this.servicio);
}