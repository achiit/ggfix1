
//The Navigation class in this file provides functionality for navigation,
// including calls such as pushNamed, pop, and push functions.
import 'package:fuzzy/helper/navigation_class.dart';

//In this configuration file, import all files such as navigation functions,
// index files, common paths, and class links are defined.
import 'config.dart';

export 'package:flutter/material.dart';

//In the common folder, all file paths are stored in a single path list file.
export 'package:fuzzy/common/common_path_list.dart';

//In this file, the list of all screen providers is defined.
export '../../provider/provider_path_list.dart';

//In this file, all the paths for common widgets are listed.
export '../../../widgets/widget_path_list.dart';

//In this file, all screen paths are defined according to the authentication,
// bottom, and other page folders.
export 'package:fuzzy/screens/screens_path_list.dart';

//The validation file contains all the validations used for storing form data.
export 'package:fuzzy/helper/validation.dart';

//This file contains all the common functions used in the application for storing data.
export 'package:fuzzy/utils/common_function.dart';

NavigationClass route = NavigationClass();
AppArray appArray = AppArray();
AppCss appCss = AppCss();
AppFonts appFonts = AppFonts();
Validation validation = Validation();

