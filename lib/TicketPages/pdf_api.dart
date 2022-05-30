
import 'dart:io';
import 'dart:ui';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../Trains/Available trains/trainModel.dart';

class PdfApi {
  static Future<File> generateCenteredText( trainModel train ,int price) async {
    final pdf = Document();

    pdf.addPage(Page(
        build: (Context context) {
          return   Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Row(
                    children: [
                      Text('${train.TrainName}',
                        style: TextStyle(
                          fontSize: 40,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text('TYPE',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('${train.Type}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ]
                      )
                    ]

                  ),
                  SizedBox(height: 10),
                  Divider(height: 1.5),
                  SizedBox(height: 10),
                  Row(
                      children: [
                        Column(
                            children: [
                              Text('DATE',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${train.Departure}',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ]
                        ),
                        SizedBox(height: 10),
                        Column(
                            children: [
                              Text('PRICE',
                                style: TextStyle(
                                    fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${price}',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ]
                        ),
                      ]

                  ),


                ]
            ),
          );

        },
        pageFormat: PdfPageFormat.letter),
        //build: (Context context) => Text("hello world"),
    );

    return saveDocument(name: 'ticket_${train.id}.pdf' ,pdf: pdf );

  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf ,
}) async {
      final bytes = await pdf.save();

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$name');

      await file.writeAsBytes(bytes);

      return file ;
  }

  static Future openFile(File file) async {
    final url = file.path;
    print(url);
    await OpenFile.open(url);
  }
}