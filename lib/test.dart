import 'package:flex_color_scheme/flex_color_scheme.dart';
import "package:flutter/material.dart";

import 'main.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  // Used to select if we use the dark or light theme.
  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.light;

  int themeIndex = 7;
  FlexSurface flexSurface = FlexSurface.medium;

  FlexAppBarStyle flexAppBarStyle = FlexAppBarStyle.primary;

  double appBarElevation = 0;

  bool transparentStatusBar = false;

  FlexTabBarStyle flexTabBarStyle = FlexTabBarStyle.forAppBar;

  bool tooltipsMatchBackground = false;

  bool swapLightColors = false;

  bool swapDarkColors = false;

  bool darkIsTrueBlack = false;

  bool useToDarkMethod = false;

  int level = 35;

  bool useToThemeMethod = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      theme: useToThemeMethod
          ? FlexColorScheme.light(
              colors: myFlexSchemes[themeIndex].light,
              surfaceStyle: flexSurface,
              appBarStyle: flexAppBarStyle,
              appBarElevation: appBarElevation,
              transparentStatusBar: transparentStatusBar,
              tabBarStyle: flexTabBarStyle,
              tooltipsMatchBackground: tooltipsMatchBackground,
              swapColors: swapLightColors,
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              //fontFamily: AppFonts.mainFont,
            ).toTheme
          : ThemeData.from(
              colorScheme: FlexColorScheme.light(
                colors: myFlexSchemes[themeIndex].light,
                surfaceStyle: flexSurface,
                appBarStyle: flexAppBarStyle,
                appBarElevation: appBarElevation,
                transparentStatusBar: transparentStatusBar,
                tabBarStyle: flexTabBarStyle,
                tooltipsMatchBackground: tooltipsMatchBackground,
                swapColors: swapLightColors,
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                //fontFamily: AppFonts.mainFont,
              ).toScheme,
            ).copyWith(
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              typography: Typography.material2018(
                platform: defaultTargetPlatform,
              ),
            ),
       darkTheme: useToThemeMethod
       ? FlexColorScheme.dark(
          colors: useToDarkMethod
             ? myFlexSchemes[themeIndex].light.defaultError.toDark(level)
             : myFlexSchemes[themeIndex].dark,
           surfaceStyle: flexSurface,
           appBarStyle: flexAppBarStyle,
           appBarElevation: appBarElevation,
           transparentStatusBar: transparentStatusBar,
           tabBarStyle: flexTabBarStyle,
           tooltipsMatchBackground: tooltipsMatchBackground,
           swapColors: swapDarkColors,
           darkIsTrueBlack: darkIsTrueBlack,
           visualDensity: FlexColorScheme.comfortablePlatformDensity,
           //fontFamily: AppFonts.mainFont,
         ).toTheme

       : ThemeData.from(
           colorScheme: FlexColorScheme.dark(
             colors: useToDarkMethod
               ? myFlexSchemes[themeIndex].light.defaultError.toDark(level)
               : myFlexSchemes[themeIndex].dark,
             surfaceStyle: flexSurface,
             appBarStyle: flexAppBarStyle,
             appBarElevation: appBarElevation,
             transparentStatusBar: transparentStatusBar,
             tabBarStyle: flexTabBarStyle,
             tooltipsMatchBackground: tooltipsMatchBackground,
             swapColors: swapDarkColors,
             darkIsTrueBlack: darkIsTrueBlack,
             visualDensity: FlexColorScheme.comfortablePlatformDensity,
            // fontFamily: AppFonts.mainFont,
           ).toScheme,
         ).copyWith(
             visualDensity: FlexColorScheme.comfortablePlatformDensity,
             typography: Typography.material2018(
             platform: defaultTargetPlatform,
           ),
         ),
         // themeMode value and change callback.
       themeMode: themeMode,
       home: HomePage(
         themeMode: themeMode,
         onThemeModeChanged: (ThemeMode mode) {
           setState(() { themeMode = mode; });
         },
         // Used theme index and change callback.
         schemeIndex: themeIndex,
         onSchemeChanged: (int index) {
           setState(() { themeIndex = index;});
         },
         // Used surface branding and change callback.
         themeSurface: flexSurface,
         onThemeSurfaceChanged: (FlexSurface surface) {
           setState(() { flexSurface = surface; });
         },
         // Used app bar style and change callback.
         appBarStyle: flexAppBarStyle,
         onAppBarStyleChanged: (FlexAppBarStyle style) {
           setState(() { flexAppBarStyle = style; });
         },
         // Used transparentStatusBar and change callback.
         transparentStatusBar: transparentStatusBar,
         onTransparentStatusBarChanged: (bool value) {
           setState(() {transparentStatusBar = value; });
         },
         // Used app bar elevation and change value callback.
         appBarElevation: appBarElevation,
         onAppBarElevationChanged: (double value) {
           setState(() { appBarElevation = value; });
         },
         // Used tab bar style and change callback.
         tabBarStyle: flexTabBarStyle,
         onTabBarStyleChanged: (FlexTabBarStyle style) {
           setState(() { flexTabBarStyle = style; });
         },
         // Used tooltip style and change callback.
         tooltipsMatchBackground: tooltipsMatchBackground,
         onTooltipsMatchBackgroundChanged: (bool value) {
           setState(() { tooltipsMatchBackground = value; });
         },
         // Swap colors value for light mode and change callback.
         swapLightColors: swapLightColors,
         onSwapLightColors: (bool value) {
           setState(() { swapLightColors = value; });
         },
         // Swap colors value for dark mode and change callback.
         swapDarkColors: swapDarkColors,
         onSwapDarkColors: (bool value) {
           setState(() { swapDarkColors = value; });
         },
         // True black mode and change callback.
         darkIsTrueBlack: darkIsTrueBlack,
         onDarkIsTrueBlackChanged: (bool value) {
           setState(() { darkIsTrueBlack = value; });
         },
         // Dark scheme method and toggle method callback.
         useToDark: useToDarkMethod,
         onUseToDarkChanged: (bool value) {
           setState(() { useToDarkMethod = value; });
         },
        // Dark scheme white blend level and change callback.
         whiteBlend: level,
         onWhiteBlendChanged: (int value) {
           setState(() { level = value; });
         },
         // Theme creation method and toggle method callback.
         useToTheme: useToThemeMethod,
         onUseToThemeChanged: (bool value) {
           setState(() { useToThemeMethod = value; });
         },
         // And pass the current FlexSchemeData to the
         // homePage so we can use some info from it.
         // We use copyWith to modify the dark scheme to
         // the colors we get from toggling the switch
         // for computed dark colors or the actual defined
         // dark colors.
         flexSchemeData: myFlexSchemes[themeIndex].copyWith(
           dark: useToDarkMethod
             ? myFlexSchemes[themeIndex].light.toDark()
             : myFlexSchemes[themeIndex].dark),
       ),
     );
   }
 }