import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:kwaba/styles/colors.dart';
import 'package:kwaba/styles/text.dart';

abstract class AppTheme {
  static ThemeData get theme {
    final defaultBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.border,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          0xff33377c,
          <int, Color>{
            50: AppColors.primary.withOpacity(.1), //10%
            100: AppColors.primary.withOpacity(.2), //20%
            200: AppColors.primary.withOpacity(.3), //30%
            300: AppColors.primary.withOpacity(.4), //40%
            400: AppColors.primary.withOpacity(.5), //50%
            500: AppColors.primary.withOpacity(.6), //60%
            600: AppColors.primary.withOpacity(.7), //70%
            700: AppColors.primary.withOpacity(.8), //80%
            800: AppColors.primary.withOpacity(.9), //90%
            900: AppColors.primary, //100%
          },
        ),
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: AppColors.greyCharcoal,
        displayColor: AppColors.greyCharcoal,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppText.bold600.copyWith(
          fontSize: 18,
          color: AppColors.greyCharcoal,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 24,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.greyGandalf,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: AppColors.border.withOpacity(.3),
      ),
      disabledColor: Colors.grey,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintStyle: AppText.bold600.copyWith(
          color: AppColors.greyClooney,
          fontSize: 14,
        ),
        labelStyle: AppText.bold400.copyWith(
          color: AppColors.greyGandalf,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        errorStyle: AppText.bold400.copyWith(
          color: AppColors.error,
          fontSize: 10,
        ),
        enabledBorder: defaultBorder,
        focusedBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        disabledBorder: defaultBorder,
        border: defaultBorder,
        errorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        prefixStyle: AppText.bold700,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(48),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        trackColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primary.withOpacity(.5);
            }
            return null;
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primary;
            }
            return null;
          },
        ),
      ),
    );
  }
}
