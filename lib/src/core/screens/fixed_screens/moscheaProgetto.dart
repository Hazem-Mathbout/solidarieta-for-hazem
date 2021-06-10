import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:solidarieta/src/core/components/widgets/drawerLink.dart';

class MoscheaProject extends StatelessWidget {
  const MoscheaProject({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: color),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "مشروع تجهيز مقر المركز الإسلامي بمدينة ميلانو- منطقة كوارتوجارو",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: ArabicFonts.Amiri,
                      color: color,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTitleStyle("أهداف الجمعية"),
                  SizedBox(height: 20),
                  for (var i = 0; i < one.length; i++) _buildItem(one, i),
                  SizedBox(height: 10),
                  _buildTitleStyle("نبذة عن حال المسلمين في منطقة كوارتوجارو"),
                  SizedBox(height: 20),
                  Text(
                    'منذ ما يقرب من عشر سنوات والمسلمون في منطقة كوارتوجارو بمدينة ميلانو يصلون في مكان مستأجر صغير لا تتجاوز مساحته 200 متر مربع ، يقع في وسط أحياء سكنية، يتضايق بعض أهلها من تواجد المسلمين وصالتهم، ولا يزال المسلمون يعانون من ضيق المساحة خصوصاً يوم الجمعة لكثافة أعداد المصلين مما يضطرهم إلى إقامة صلاة الجمعة أكثر من مرة، إضافةً إلى ان المكان لا يلبي احتياجاتهم الأساسية وعلى رأسها مدرسة القرآن الكريم واللغة العربية مما يجعل أبناء المنطقة يذهبون لتعليم أبنائهم نهاية الأسبوع إلى مناطق بعيدة، كما أن هذا المكان لا يمكن فيه استقبال الإيطاليين الراغبين في التعرف على الإسلام؛ فقام ثلة من أبناء الجالية في المنطقة بالبحث عن مكان آخر يلبي احتياج المسلمين وتطلعاتهم، وقد استطاع الإخوة في إدارة جمعية التضامن بفضل الله تعالى العثور على مكان مناسب وفي منطقة مناسبة فبدأوا فوراً باستنفار جميع أبناء المنطقة من جوارهم من المسلمين لشراء المكان الجديد.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTitleStyle("نبذة عن المكان الجديد"),
                  SizedBox(height: 20),
                  Text(
                    'موقع المكان',
                    style: new TextStyle(
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                      color: color,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Via Pascarella 7, Milano – 20157',
                    style: new TextStyle(
                      color: color,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'وفقنا الله تعالى لإيجاد هذا المكان والذي هو عبارة عن محل تجاري كبير لبيع الأثاث التراثي القديم، ومن توفيق الله تعالى أن هذا المكان كان معروضا في المزاد من قبل محكمة ميالنو بسعر استثنائي يمثل ربع قيمة المكان الأصلية فالمكان سعره مليون ومائتا ألف يورو  1.200.000  إلا انه عرض بثلاثمائة الف يورو  300.000  تم جمعها من قبل أبناء الجالية في ظرف سنة واحدة رغم الظروف الصعبة التي يمر بها البلد عموما والمسلمون خصوصاً، وأصبح المكان ملكاً للمسلمين بفضل الله تعالى.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'تبلغ مساحة المكان أكثر من 850 متر مربع موزعة على أربعة طوابق:',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                      color: color,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  for (var i = 0; i < two.length; i++) _buildItem(two, i),
                  SizedBox(height: 20),
                  _buildTitleStyle("احتياجات المكان"),
                  SizedBox(height: 20),
                  Text(
                    ' أخذ الترخيص القانوني لممارسة النشاط في المكان، وهذا يتطلب تحويل طبيعة المكان ليتناسب مع النشاط الذي سيقام فيه، وذلك بتحويله من معرض تجاري إلى مركز ثقافي ديني، وهذا الامر يتطلب رسوما تدفع للدولة وإصلاحات داخلية ليكون المكان على مستوى الشروط القانونية ومواصفات السلامة للتجمعات البشرية.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'تم تقدير الكلفة اللازمة لتهيئة المكان بكل ما يلزم من خلال مهندس مختص ب  242.000   مائتين وأربعين ألف يورو',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                      color: color,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => openLink(
                        'https://www.gofundme.com/f/associazione-la-solidariet'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تبرع للمسجد',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: ArabicFonts.El_Messiri,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' - SOSTIENICI',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

_buildItem(List<String> one, int i) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(LineAwesomeIcons.hand_pointing_left_1),
      SizedBox(width: 10),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Text(
            one[i],
            style: new TextStyle(
              fontFamily: ArabicFonts.El_Messiri,
              package: 'google_fonts_arabic',
              fontSize: 18,
            ),
          ),
        ),
      ),
    ],
  );
}

_buildTitleStyle(String title) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color.fromRGBO(0, 133, 119, 0.3),
      border: Border.all(
        color: Color.fromRGBO(0, 133, 119, 1),
        width: 2,
      ),
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: ArabicFonts.Amiri,
        color: Color.fromRGBO(0, 133, 119, 1),
        package: 'google_fonts_arabic',
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
  );
}

List<String> one = [
  "الحفاظ على هوية وعقيدة الجالية المسلمة في المنطقة من خالل إحياء رسالة المسجد ودوره الديني والحضاري",
  " تعليم المسلمين أحكام الدين ومفاهيمه من خلال المنهج الوسطي المعتدل",
  "تمثيل الصورة الحسنة للإسالم والمسلمين لدى المجتمع الإيطالي",
  "نشرالصورة الناصعة لتعاليم الدين في الوسط الإيطالي",
  "استقبال وتعليم المسلمين الجدد ورعايتهم",
  "تعليم أبناء المسلمين القرآن الكريم واللغة العربية",
  "الحفاظ على الأسرة المسلمة",
];
List<String> two = [
  "طابق تحت الأرض بمساحة 400 متر، وهو الذي سيتم تهيئتة ليكون المسجد بإذن الله تعالى",
  "الطابق الارضي وهو الذي سيتم تهيئته ليكون فيه مكتبة دينية ومكتب إداري وبعض الأقسام التعليمية",
  "الطابق الأول وسيكون فيه مدرسة القرآن الكريم واللغة العربية",
  "الطابق العلوي وسيكون فيه قاعة مهيئة للدورات التأهيلية",
];
List<String> three = [];
List<String> four = [];
List<String> five = [];
