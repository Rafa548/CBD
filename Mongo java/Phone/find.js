function find(seq) {
    var ctc = db.phones.find({}, { "_id": 0, "display": 1 });

    while (ctc.hasNext()) {
        var ctc = contactos.next();
        var numb= contacto.display.split("-");
        var comp = numb[1]
        if (comp.includes(seq)){
            print(ctc.display);
        }
    }
}
