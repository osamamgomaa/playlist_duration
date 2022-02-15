// https://www.googleapis.com/youtube/v3/videos?&part=contentDetails&key=AIzaSyCarVDjOK4KkoCLBjyje5Hkqn2ohVWPMBc&fields=items/contentDetails/duration&id=kRcbYLK3OnQ,NEuUxy4Skpc,ADIhuD_vQ5g,TQyIJ4xHOEE,DY7p1IDIioM,pwUNLjgw7lY,nA28o5DMtRc,RkrCWn3_p1Y,Hkd2r5yEMvc,aA8nhHbrC9Y,dCFUZ43IL5w,ot4yp_vgT2E,id62LvJXK8Q,vh6E23vvroE,k_YFH3PezqA,YbWMlAx7PW0,Hk4yo4tr5Ts,Cp2yZxCrqyA,zPi163Xo4m8,AFTfqXdrYBQ,BJShopyg4G0,gNoqm6aAzM0,CJm6o82Vu2g,v_ZdslCeRfQ,IYQe1-QsJEs,j1OrjcZyrhg,M5PwIoz2Fco,mdqVwTFMGe0,aevwBkdG_QE,_ZairtpcXTs,HjaCTX4WAmI,k1s1tnoVH9U,GJFqT6Kz9NE,7q-SbRdW_24,gKOgCG1PHKI,8-HR57Jfaz4,IdvuB3QxQFU,cLzJxOwLSB0,V9Ab0Xqhu0A,JWx_FYIRaVI,JqwUUCZe62M,WljDOMwPY_w,HFH65-sNQmI,0QvNhSN_ivs,r1wWlUCZW08,CkHIsx5vcDA,a8L1nu4EByI,Y0g3cIkCKtw,onKnrNJZRbs,A-j5xN-pOCU
class VideosList {
  List<Items> items;

  VideosList({this.items});

  VideosList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  ContentDetails contentDetails;

  Items({this.contentDetails});

  Items.fromJson(Map<String, dynamic> json) {
    contentDetails = json['contentDetails'] != null
        ? ContentDetails.fromJson(json['contentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.contentDetails != null) {
      data['contentDetails'] = this.contentDetails.toJson();
    }
    return data;
  }
}

class ContentDetails {
  String duration;

  ContentDetails({this.duration});

  ContentDetails.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['duration'] = this.duration;
    return data;
  }
}
