import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController{

  RewardedAd? _rewardedAd;
  int rewardPoint = 0;
  double multiplier = 0;
  double percentage =0;
  double netIncome = 0;
  double withdrawn = 0;
  int credit = 0;

  Future<void> loadAds()async{
    await RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad){
              _rewardedAd = ad;
            },
            onAdFailedToLoad: (LoadAdError err){
              loadAds();
            }
        )
    );

    if(_rewardedAd!=null){
      _rewardedAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem points)async{
            print('The coins earned are: ${points.amount}');
            rewardPoint+=  points.amount.toInt();
            multiplier += 0.02;
            percentage += 0.01;
            netIncome += 0.5;
            credit += 10;

          });
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError err){
            ad.dispose();
          },
          onAdDismissedFullScreenContent: (RewardedAd ad){
            ad.dispose();
          }
      );
    }


  }

// void showAds(){
//   _rewardedAd.show(
//       onUserEarnedReward: (AdWithoutView ad, RewardItem points){
//         print('The coins earned are: ${points.amount}');
//       });
//   _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
//     onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError err){
//       ad.dispose();
//     },
//     onAdDismissedFullScreenContent: (RewardedAd ad){
//       ad.dispose();
//   }
//   );
//
// }
}