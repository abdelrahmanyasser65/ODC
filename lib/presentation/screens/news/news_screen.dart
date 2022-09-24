import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/bussiness_logic/home_cubit/cubit.dart';
import 'package:odc/bussiness_logic/home_cubit/state.dart';
import 'package:odc/data/models/allNews_model.dart';
import 'package:odc/presentation/screens/news/web_screen.dart';
import 'package:odc/presentation/widgets/default_AppBar.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import '../../constants/app_colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<HomeCubit>(context);
        var model=cubit.allNewsModel!.data;
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: buildAppBar(context, 'News'),
          body:
          state is GetAllNewsLoadingState
              ?
          const  Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ):
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height/40
            ),
            child: ListView.separated(
                physics:const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildItems(size, model, index, context),
                separatorBuilder: (context,index)=>Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(size.height/300),
                  color: Colors.grey[300],
                  height: 1,
                ),
                itemCount: model.length),
          )


        );
      },
    );
  }

  InkWell buildItems(Size size, List<Data> model, int index, BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> WebViewScreen(model[index].linkUrl)));
      },
      child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width/20
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width:size.width/2.8 ,
                      height: size.height/7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(model[index].imageUrl,),

                          )),
                    ),
                    SizedBox(
                      width: size.width/20,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: size.height/7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              model[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(height:size.height/75),
                            DefaultText(
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: model[index].body,
                              fontWeight: FontWeight.w400,
                              fontSize: size.width*0.04,
                            ),
                            SizedBox(height: size.height/75,),
                            DefaultText(
                              text: model[index].date,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w300,
                            ),
                            SizedBox(height: size.height/75,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
    );
  }
}