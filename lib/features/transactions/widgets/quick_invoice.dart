import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/app_styles.dart';
import 'package:responsive_dash_board/shared/widgets/custom_background_container.dart';
import 'package:responsive_dash_board/features/transactions/widgets/latest_transction.dart';
import 'package:responsive_dash_board/features/transactions/widgets/latest_transction_list_view.dart';
import 'package:responsive_dash_board/features/transactions/widgets/quick_invoice_form.dart';
import 'package:responsive_dash_board/features/transactions/widgets/quick_invoice_header.dart';
import 'package:responsive_dash_board/shared/widgets/title_text_field.dart';

class QuickInvoice extends StatelessWidget {
  const QuickInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuickInvoiceHeader(),
        LatestTransction(),
        Divider(
          height: 48,
          color: Color(0xffF1F1F1),
        ),
        QuickInvoiceForm(),
      ],
    ));
  }
}
