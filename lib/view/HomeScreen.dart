import 'package:flutter/material.dart';
import 'package:HansiOn/controller/fetchMeme.dart';
import 'package:HansiOn/controller/saveMyData.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = "";
  int? memeNo;
  int targetMeme = 100;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetinitMemeNo();
    UpdateImg();
  }

  GetinitMemeNo() async{
    memeNo = await saveMyData.fetchData() ?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }else if(memeNo! > 500){
      targetMeme  = 1000;
    }
    setState(() {

    });
  }
  void UpdateImg() async{
    String getImgUrl = await fetchMeme.fetchNewMeme();
    setState(() {
      imageUrl = getImgUrl;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120,),
            Text("Meme # ${memeNo.toString()}" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("Target ${targetMeme} Memes", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            SizedBox(height: 30,),
            isLoading ? Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(color: Colors.purple,)),
              ),
            ):
            Image.network(
                height: 400,
                width : MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
                imageUrl),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              setState(() {
                isLoading = true;
              });
              await saveMyData.saveData(memeNo! + 1);
              GetinitMemeNo();
              UpdateImg();
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                child: Container(
                height: 60,
                width: 125,
                child: Center(child: Text("More Fun!!" , style: TextStyle(fontSize: 25))))),
            Spacer(),
            Text("App Created By", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            Text("Tooba Fayyaz", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 12,)
          ],
        ),
      )
    );
  }
}
