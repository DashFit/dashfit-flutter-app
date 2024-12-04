import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const DashboardWidget() : const LogSignupWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const DashboardWidget() : const LogSignupWidget(),
        ),
        FFRoute(
          name: 'LogSignup',
          path: '/logSignup',
          builder: (context, params) => const LogSignupWidget(),
        ),
        FFRoute(
          name: 'PersonalDetails',
          path: '/personalDetails',
          builder: (context, params) => PersonalDetailsWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            feet: params.getParam(
              'feet',
              ParamType.String,
            ),
            inch: params.getParam(
              'inch',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          builder: (context, params) => const DashboardWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'WeekHistory',
          path: '/weekHistory',
          builder: (context, params) => WeekHistoryWidget(
            weekStartDate: params.getParam(
              'weekStartDate',
              ParamType.DateTime,
            ),
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'FunctionalExercise',
          path: '/functionalExercise',
          builder: (context, params) => FunctionalExerciseWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            exercise: params.getParam(
              'exercise',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['exercises'],
            ),
            additionalWeight: params.getParam(
              'additionalWeight',
              ParamType.double,
            ),
            repetitions: params.getParam(
              'repetitions',
              ParamType.int,
            ),
            sets: params.getParam(
              'sets',
              ParamType.int,
            ),
            oldExerciseScore: params.getParam(
              'oldExerciseScore',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData', 'exerciseScoresData'],
            ),
            weightUnit: params.getParam(
              'weightUnit',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'AbdomentScoreBreakdown',
          path: '/abdomentScoreBreakdown',
          builder: (context, params) => AbdomentScoreBreakdownWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'RegisterAs',
          path: '/registerAs',
          builder: (context, params) => const RegisterAsWidget(),
        ),
        FFRoute(
          name: 'ListingClientScreen',
          path: '/listingClientScreen',
          builder: (context, params) => const ListingClientScreenWidget(),
        ),
        FFRoute(
          name: 'TrainerDashboard',
          path: '/trainerDashboard',
          builder: (context, params) => const TrainerDashboardWidget(),
        ),
        FFRoute(
          name: 'ClientWeekHistory',
          path: '/clientWeekHistory',
          builder: (context, params) => const ClientWeekHistoryWidget(),
        ),
        FFRoute(
          name: 'ClientExerciseScore',
          path: '/clientExerciseScore',
          builder: (context, params) => const ClientExerciseScoreWidget(),
        ),
        FFRoute(
          name: 'AddClientLogin',
          path: '/addClientLogin',
          builder: (context, params) => const AddClientLoginWidget(),
        ),
        FFRoute(
          name: 'ClientOtp',
          path: '/clientOtp',
          builder: (context, params) => ClientOtpWidget(
            mobileNumber: params.getParam(
              'mobileNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MonthHistory',
          path: '/monthHistory',
          builder: (context, params) => MonthHistoryWidget(
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'LatsScoreBreakdown',
          path: '/latsScoreBreakdown',
          builder: (context, params) => const LatsScoreBreakdownWidget(),
        ),
        FFRoute(
          name: 'WeightExercise',
          path: '/weightExercise',
          requireAuth: true,
          builder: (context, params) => WeightExerciseWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            exercise: params.getParam(
              'exercise',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['exercises'],
            ),
            weightLifted: params.getParam(
              'weightLifted',
              ParamType.double,
            ),
            repetitions: params.getParam(
              'repetitions',
              ParamType.int,
            ),
            sets: params.getParam(
              'sets',
              ParamType.int,
            ),
            oldExerciseScore: params.getParam(
              'oldExerciseScore',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData', 'exerciseScoresData'],
            ),
            weightUnit: params.getParam(
              'weightUnit',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TrainerEditProfileDeleted',
          path: '/trainerEditProfileDeleted',
          builder: (context, params) => const TrainerEditProfileDeletedWidget(),
        ),
        FFRoute(
          name: 'ClientProfile',
          path: '/clientProfile',
          builder: (context, params) => ClientProfileWidget(
            selectedClientDetails: params.getParam(
              'selectedClientDetails',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData'],
            ),
          ),
        ),
        FFRoute(
          name: 'ClientEditProfile',
          path: '/clientEditProfile',
          builder: (context, params) => ClientEditProfileWidget(
            selectedUserReference: params.getParam(
              'selectedUserReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData'],
            ),
          ),
        ),
        FFRoute(
          name: 'ClientMonthHistory',
          path: '/clientMonthHistory',
          builder: (context, params) => const ClientMonthHistoryWidget(),
        ),
        FFRoute(
          name: 'AddClientDetails',
          path: '/addClientDetails',
          builder: (context, params) => AddClientDetailsWidget(
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SearchExercise',
          path: '/searchExercise',
          builder: (context, params) => SearchExerciseWidget(
            selectedCategory: params.getParam(
              'selectedCategory',
              ParamType.String,
            ),
            selectedDate: params.getParam(
              'selectedDate',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'UploadProfilePhoto',
          path: '/uploadProfilePhoto',
          builder: (context, params) => const UploadProfilePhotoWidget(),
        ),
        FFRoute(
          name: 'ExerciseScoreList',
          path: '/exerciseScoreList',
          builder: (context, params) => ExerciseScoreListWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'kettlebellMedicineBall',
          path: '/kettlebellMedicineBall',
          builder: (context, params) => KettlebellMedicineBallWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            exercise: params.getParam(
              'exercise',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['exercises'],
            ),
            weightLifted: params.getParam(
              'weightLifted',
              ParamType.double,
            ),
            repetitions: params.getParam(
              'repetitions',
              ParamType.int,
            ),
            sets: params.getParam(
              'sets',
              ParamType.int,
            ),
            oldExerciseScore: params.getParam(
              'oldExerciseScore',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData', 'exerciseScoresData'],
            ),
            weightUnit: params.getParam(
              'weightUnit',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PlankExercise',
          path: '/plankExercise',
          builder: (context, params) => PlankExerciseWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            exercise: params.getParam(
              'exercise',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['exercises'],
            ),
            additionalWeight: params.getParam(
              'additionalWeight',
              ParamType.double,
            ),
            durations: params.getParam(
              'durations',
              ParamType.int,
            ),
            sets: params.getParam(
              'sets',
              ParamType.int,
            ),
            oldExerciseScore: params.getParam(
              'oldExerciseScore',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData', 'exerciseScoresData'],
            ),
            weightUnit: params.getParam(
              'weightUnit',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'StrongmanExercise',
          path: '/strongmanExercise',
          builder: (context, params) => StrongmanExerciseWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            exercise: params.getParam(
              'exercise',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['exercises'],
            ),
            additionalWeight: params.getParam(
              'additionalWeight',
              ParamType.double,
            ),
            distanceCovered: params.getParam(
              'distanceCovered',
              ParamType.int,
            ),
            sets: params.getParam(
              'sets',
              ParamType.int,
            ),
            oldExerciseScore: params.getParam(
              'oldExerciseScore',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData', 'exerciseScoresData'],
            ),
            weightUnit: params.getParam(
              'weightUnit',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ManageClient',
          path: '/manageClient',
          builder: (context, params) => const ManageClientWidget(),
        ),
        FFRoute(
          name: 'test123',
          path: '/test123',
          builder: (context, params) => const Test123Widget(),
        ),
        FFRoute(
          name: 'ClientOtpCopy',
          path: '/clientOtpCopy',
          builder: (context, params) => ClientOtpCopyWidget(
            mobileNumber: params.getParam(
              'mobileNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SearchExerciseCopy',
          path: '/searchExerciseCopy',
          builder: (context, params) => SearchExerciseCopyWidget(
            selectedCategory: params.getParam(
              'selectedCategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ClientUploadProfilePhoto',
          path: '/clientUploadProfilePhoto',
          builder: (context, params) => ClientUploadProfilePhotoWidget(
            seletedUserDataDetails: params.getParam(
              'seletedUserDataDetails',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['usersData'],
            ),
          ),
        ),
        FFRoute(
          name: 'AbdomentScoreBreakdownCopy',
          path: '/abdomentScoreBreakdownCopy',
          builder: (context, params) => AbdomentScoreBreakdownCopyWidget(
            exerciseDate: params.getParam(
              'exerciseDate',
              ParamType.DateTime,
            ),
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyProfile',
          path: '/myProfile',
          builder: (context, params) => const MyProfileWidget(),
        ),
        FFRoute(
          name: 'VerifyCopy',
          path: '/verifyCopy',
          builder: (context, params) => VerifyCopyWidget(
            mobileNumber: params.getParam(
              'mobileNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditClientDetails',
          path: '/editClientDetails',
          asyncParams: {
            'clientUserData':
                getDoc(['usersData'], UsersDataRecord.fromSnapshot),
          },
          builder: (context, params) => EditClientDetailsWidget(
            clientUserData: params.getParam(
              'clientUserData',
              ParamType.Document,
            ),
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'VerifyCopy2',
          path: '/verifyCopy2',
          builder: (context, params) => VerifyCopy2Widget(
            mobileNumber: params.getParam(
              'mobileNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'verifyNew',
          path: '/verifyNew',
          builder: (context, params) => const VerifyNewWidget(),
        ),
        FFRoute(
          name: 'Verify',
          path: '/verify',
          builder: (context, params) => VerifyWidget(
            mobileNumber: params.getParam(
              'mobileNumber',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/logSignup';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/Frame_1261155101.png',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}