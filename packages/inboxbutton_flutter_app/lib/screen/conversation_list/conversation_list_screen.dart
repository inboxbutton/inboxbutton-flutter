//create a stateful widget according to filename in pascal case
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:inboxbutton_flutter_app/inboxbutton_theme.dart';
import 'package:inboxbutton_flutter_app/screen/conversation_list/provider/conversation_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ConversationListScreen extends StatefulWidget {
  static Widget get route => ChangeNotifierProvider(
        create: (context) => ConversationListModel(),
        child: const ConversationListScreen(),
      );
  const ConversationListScreen({Key? key}) : super(key: key);
  @override
  _ConversationListScreenState createState() => _ConversationListScreenState();
}

class _ConversationListScreenState extends State<ConversationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: InboxButtonTheme.of(context).data,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conversation'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _body(),
      ),
    );
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Widget _body() {
    return Consumer<ConversationListModel>(
      builder:
          (BuildContext context, ConversationListModel model, Widget? child) {
        var isEmpty = model.conversationDtoList.isEmpty;
        if (_refreshController.isRefresh) {
          _refreshController.refreshCompleted();
        }
        if (_refreshController.isLoading) {
          if (model.isLastPage) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: () async {
            //TODO: refresh

            Provider.of<ConversationListModel>(context, listen: false).load();
          },
          onLoading: () async {
            //TODO: load next page
            Provider.of<ConversationListModel>(context, listen: false)
                .loadMore();
          },
          header: ClassicHeader(),
          footer: ClassicFooter(),
          child: isEmpty ? _emptyView() : _sectionContent(model),
        );
      },
    );
  }

  Widget _sectionContent(ConversationListModel model) {
    var loanList = model.conversationDtoList;
    return ListView.separated(
        itemBuilder: (context, index) => _biddingItem(context, model, index),
        separatorBuilder: (context, index) => Divider(),
        itemCount: loanList.length);
  }

  Widget _biddingItem(
      BuildContext context, ConversationListModel model, int index) {
    var loan = model.conversationDtoList[index];
    // var hasRead = loan.seenAt != null;
    var hasRead = null;
    var htmlString = loan.body ?? "";
    List<String> cleanStrings = [];
    List<dom.Element> ps =
        parse(htmlString.replaceAll('<br>', '</p><p>')).querySelectorAll('p');
    if (ps.isNotEmpty)
      ps.forEach((f) {
        if (f.text != '') cleanStrings.add(f.text);
      });
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      isThreeLine: false,
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(
          (loan.from?.name ?? "A").substring(0, 1),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        "${loan.subject ?? ""}",
      ),
      subtitle: cleanStrings.isNotEmpty
          ? Text(
              "${cleanStrings.first}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          : Text(
              loan.body ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      // Text(
      //   "${loan.content ?? ""}",
      //   style:
      //       hasRead ? AppTextStyle.darkText12w400 : AppTextStyle.darkText12w500,
      //   maxLines: 1,
      //   overflow: TextOverflow.ellipsis,
      // ),
      // trailing: hasRead
      //     ? null
      //     : Container(
      //         width: 9,
      //         height: 9,
      //         decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: MyColors.pinkishRed,
      //             border: Border.all(color: MyColors.pinkishRed))),
      onTap: () {},
    );
    // return Container(
    //   color: MyColors.cardBackground,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       GestureDetector(
    //         onTap: () {
    //           if (loan.totalBids > 0)
    //             Get.to(UserNotificationDetailRoute.route,
    //                 arguments: UserNotificationDetailArgument(id: loan.id));
    //         },
    //         behavior: HitTestBehavior.translucent,
    //         child: Container(
    //           decoration: BoxDecoration(
    //               color: MyColors.darkGreen,
    //               borderRadius: const BorderRadius.only(
    //                   topLeft: Radius.circular(Dimens.common_container_radius),
    //                   topRight:
    //                       Radius.circular(Dimens.common_container_radius))),
    //           padding:
    //               EdgeInsets.symmetric(horizontal: Dimens.common_padding_small),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Expanded(
    //                 child: Text(
    //                   "${loan.id}",
    //                   style: AppTextStyle.whiteText18w700,
    //                 ),
    //               ),
    //               IgnorePointer(
    //                 child: IconButton(
    //                     icon: SvgPicture.asset(
    //                       Utils.getImgPath('ic_right'),
    //                       color: MyColors.whiteText,
    //                     ),
    //                     onPressed: () {}),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.symmetric(
    //             horizontal: Dimens.common_padding_small,
    //             vertical: Dimens.common_padding_extra_small),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               flex: 5,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                       "${loan.financingType == FinancingType.businessFinancing ? "Company" : "Applicant"}",
    //                       style: AppTextStyle.greyText14w400),
    //                   Text(
    //                     "${loan.name}",
    //                     style: AppTextStyle.whiteText14w700,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               flex: 5,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text("Type", style: AppTextStyle.greyText14w400),
    //                   Text(
    //                     "${loan.financingType.name.titleCase}",
    //                     style: AppTextStyle.whiteText14w700,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(
    //             left: Dimens.common_padding_small,
    //             right: Dimens.common_padding_small,
    //             top: Dimens.common_padding_small,
    //             bottom: Dimens.common_bar_gap),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               flex: 5,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text("Financing Amount",
    //                       style: AppTextStyle.greyText14w400),
    //                   Text(
    //                     "${loan.amount.toAppCurrencyFormat()}",
    //                     style: AppTextStyle.whiteText14w700,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               flex: 5,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                     child: Text("Payback Period",
    //                         style: AppTextStyle.greyText14w400),
    //                   ),
    //                   Text(
    //                     "${loan.paybackPeriod} months",
    //                     style: AppTextStyle.whiteText14w700,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       MyDivider(
    //         indent: 0,
    //         height: 16,
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(
    //             left: Dimens.common_padding_small,
    //             right: Dimens.common_padding_small,
    //             bottom: Dimens.common_padding_smaller,
    //             top: Dimens.common_padding_extra_small),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               flex: 5,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text("UserNotification Start",
    //                       style: AppTextStyle.greyText14w400),
    //                   Text(
    //                     "${DateTime.tryParse(loan.startAt ?? "").displayAppFormat}",
    //                     style: AppTextStyle.whiteText14w700,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               flex: 5,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text("UserNotification End",
    //                       style: AppTextStyle.greyText14w400),
    //                   Text(
    //                     "${DateTime.tryParse(loan.endAt ?? "").displayAppFormat}",
    //                     style: AppTextStyle.whiteText14w700,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       if (loan.totalBids == 0)
    //         AppFilledTextButton(
    //           text: "No offer yet",
    //           callback: () {},
    //           color: MyColors.disabled,
    //         ),
    //       if (loan.totalBids == 1)
    //         AppFilledTextButton(
    //           text: "You have received 1 offer!",
    //           callback: () {
    //             Get.to(UserNotificationDetailRoute.route,
    //                 arguments: UserNotificationDetailArgument(id: loan.id));
    //           },
    //           color: MyColors.orange,
    //         ),
    //       if (loan.totalBids > 1)
    //         AppFilledTextButton(
    //           text: "You have received ${loan.totalBids} offers!",
    //           callback: () {
    //             Get.to(UserNotificationDetailRoute.route,
    //                 arguments: UserNotificationDetailArgument(id: loan.id));
    //           },
    //           color: MyColors.orange,
    //         )
    //     ],
    //   ),
    // );
  }

  Widget _emptyView() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Text('You do not have any conversations yet.'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ConversationListModel>(context, listen: false).load();
  }
}
