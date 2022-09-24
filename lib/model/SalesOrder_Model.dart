// SalesOrder_Model

class SalesOrder {
  List<SalesOrder_Model> items=[];

  SalesOrder.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      //  items = <SalesOrder_Model>[];
      json['items'].forEach((v) {
        items.add(new SalesOrder_Model.fromJson(v));
      });
    }
  }

}


class SalesOrder_Model {
  int ? SalesOrderId;
  String ? SalesOrderDate;
  dynamic ? leId;
  dynamic ? Value;
  dynamic ? CustVenName;
  dynamic ? CustPhone;
  dynamic ?  status ;

  SalesOrder_Model({this.SalesOrderId,this.SalesOrderDate,this.leId,this.Value,this.CustVenName,this.CustPhone});
  SalesOrder_Model.fromJson(Map<String, dynamic> json) {
    SalesOrderId = json['SalesOrderId'];
    SalesOrderDate = json['SalesOrderDate'];
    leId = json['LeId'];
    Value = json['Value'];
    CustVenName = json['CustVenName'];
    CustPhone = json['CustPhone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SalesOrderId'] = this.SalesOrderId;
    data['SalesOrderDate'] = this.SalesOrderDate;
    data['LeId'] = this.leId;
    data['Value'] = this.Value;
    data['CustVenName'] = this.CustVenName;
    data['CustPhone'] = this.CustPhone;
    return data;
  }

}



