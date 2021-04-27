part of "../view.dart";

class PatientEducationPage extends StatefulWidget {

  final GlobalKey<ScaffoldState> drawerKey;

  PatientEducationPage(this.drawerKey);

  @override
  _PatientEducationPageState createState() => _PatientEducationPageState();
}

class _PatientEducationPageState extends State<PatientEducationPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _){

        final authProvider = watch(authenticationProvider);

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: MQuery.height(1.3, context),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Header(
                        content: Column(
                          children: [
                            AppBar(
                              leadingWidth: MQuery.width(0.025, context),
                              toolbarHeight: MQuery.height(0.08, context),
                              leading: IconButton(
                                icon : Icon(CupertinoIcons.line_horizontal_3, size: 24),
                                onPressed: (){
                                  widget.drawerKey.currentState!.openDrawer();
                                },
                              ),
                              actions: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 200
                                  ),
                                  child: CircleAvatar(
                                    radius: 22.5,
                                    child: ClipOval(
                                      child: Image.network(authProvider.auth.currentUser!.photoURL ?? "", fit: BoxFit.cover,)
                                    ),
                                    backgroundColor: Palette.secondary,
                                  ),
                                )
                              ],
                              backgroundColor: Colors.transparent,
                              elevation: 0
                            ),
                            Container(
                              height: 130,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Font.out(
                                    "Patient Education",
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 32,
                                    textAlign: TextAlign.start
                                  ),
                                  Font.out(
                                    "discover your therapist's \nnote for you",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20,
                                    textAlign: TextAlign.left
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: EdgeInsets.all(
                          MQuery.height(0.04, context)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DefaultTile(
                              icons: Icon(CupertinoIcons.xmark_circle, color: Palette.alert),
                              callback: (){
                                Get.to(() => PatientEducationSubPage("Contraindications"), transition: Transition.cupertino);
                              },
                              title: "Contraindications",
                            ),
                            SizedBox(height: MQuery.height(0.025, context)),
                            DefaultTile(
                              icons: Icon(CupertinoIcons.exclamationmark_circle, color: Palette.warning),
                              callback: (){
                                Get.to(() => PatientEducationSubPage("Precautions"), transition: Transition.cupertino);
                              },
                              title: "Precautions",
                            ),
                            SizedBox(height: MQuery.height(0.025, context)),
                            DefaultTile(
                              icons: Icon(CupertinoIcons.paperclip, color: Palette.primary),
                              callback: (){
                                Get.to(() => PatientEducationSubPage("General \nInstructions"), transition: Transition.cupertino);
                              },
                              title: "General Instructions",
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        );
      }
    );
  }
}